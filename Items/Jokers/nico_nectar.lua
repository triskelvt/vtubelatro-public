SMODS.Atlas({
    key = "nico_nectar",
    path = "otranico_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'nico_nectar',
    config = { is_vtuber = true, extra = { interest_bonus = 3, threshold = 5, odds = 4 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    atlas = 'nico_nectar',
    blueprint_compat = true,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.interest_bonus, card.ability.extra.threshold, (G.GAME.probabilities.normal or 1), card.ability.extra.odds } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Otra Nico', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Model by: anyr_uok', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            local bonus_interest = math.floor(math.max(0, G.GAME.dollars) / card.ability.extra.threshold) *
                card.ability.extra.interest_bonus

            if bonus_interest > 0 then
                ease_dollars(bonus_interest)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
            end

            if pseudorandom('nico_nectar') < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:shatter()
                        return true
                    end
                }))
                return {
                    message = "Broken!",
                    colour = G.C.FILTER
                }
            end
        end
    end
}
