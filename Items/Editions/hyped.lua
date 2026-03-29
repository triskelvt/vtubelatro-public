local hyped_shader = {
    key = 'hyped',
    path = 'hyped.fs',
}

local hyped = {
    key = 'hyped',
    in_shop = true,
    weight = 3,
    extra_cost = 4,
    discovered = true,
    unlocked = true,
    shader = 'hyped',
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                dollars = 5,
                message = '+$5',
                colour = G.C.MONEY
            }
        end
    end
}

SMODS.Shader(hyped_shader)
SMODS.Edition(hyped)
