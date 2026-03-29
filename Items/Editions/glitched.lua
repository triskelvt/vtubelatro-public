local glitched_shader = {
    key = 'glitched',
    path = 'glitched.fs',
}

local glitched = {
    key = 'glitched',
    in_shop = true,
    weight = 3,
    extra_cost = 5,
    discovered = true,
    unlocked = true,
    shader = 'glitched',
    calculate = function(self, card, context)
        if context.repetition_only then
            if pseudorandom('glitched_retrigger') < 0.5 then
                return {
                    message = 'Glitched!',
                    repetitions = 1,
                    card = card
                }
            end
        end
        if context.retrigger_joker_check and context.other_card == card then
            if pseudorandom('glitched_joker_retrigger') < 0.5 then
                return {
                    message = 'Glitched!',
                    repetitions = 1,
                    card = card
                }
            end
        end
        if context.post_joker or (context.main_scoring and context.cardarea == G.play) then
            if pseudorandom('glitched_destroy') < 0.125 then
                card.destroyed = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card.shattered = true
                        card:start_dissolve()
                        return true
                    end
                }))
            end
        end
    end
}

SMODS.Shader(glitched_shader)
SMODS.Edition(glitched)
