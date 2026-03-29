SMODS.Atlas({
    key = "jacknyeko_9_lives",
    path = "jacknyeko_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'jacknyeko_9_lives',
    config = { is_vtuber = true, extra = { durability = 9, mult_per_life = 5 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'jacknyeko_9_lives',
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_per_life,
                card.ability.extra.durability,
                card.ability.extra.durability * card.ability.extra.mult_per_life
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Jacknyeko', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: Cloudsahead', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local mult = card.ability.extra.durability * card.ability.extra.mult_per_life
            if mult > 0 then
                return {
                    mult_mod = mult,
                    message = '+' .. mult .. ' Mult',
                    colour = G.C.MULT
                }
            end
        end
        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.durability = card.ability.extra.durability - 1
            if card.ability.extra.durability <= 0 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:shatter()
                        return true
                    end
                }))
                return {
                    message = 'No lives left!',
                    colour = G.C.RED
                }
            else
                return {
                    message = card.ability.extra.durability .. ' lives left!',
                    colour = G.C.MULT
                }
            end
        end
    end
}
