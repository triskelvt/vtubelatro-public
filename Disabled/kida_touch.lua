SMODS.Atlas({
    key = "kida_touch",
    path = "test_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'kida_touch',
    config = { is_vtuber = true, extra = { seal_odds = 2, destroy_odds = 4 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'kida_touch',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = false,
    discovered = false,

    loc_vars = function(self, info_queue, card)
        return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.seal_odds, card.ability.extra.destroy_odds } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Kida', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: Kida', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local target_card = context.other_card
            if target_card and target_card.config.center == G.P_CENTERS.m_gold then
                if not context.blueprint and pseudorandom('kida_seal') < G.GAME.probabilities.normal / card.ability.extra.seal_odds then
                    local seals = { 'Red', 'Blue', 'Gold', 'Purple' }
                    local chosen_seal = seals[math.random(#seals)]

                    G.E_MANAGER:add_event(Event({
                        trigger = 'before',
                        delay = 0.1,
                        func = function()
                            target_card:set_seal(chosen_seal, nil, true)
                            target_card:juice_up(0.3, 0.3)
                            card:juice_up(0.5, 0.5)
                            return true
                        end
                    }))
                end

                if not context.blueprint and pseudorandom('kida_dest') < G.GAME.probabilities.normal / card.ability.extra.destroy_odds then
                    target_card.destroyed = true
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            target_card.shattered = true
                            target_card:start_dissolve()
                            return true
                        end
                    }))
                    return {
                        extra = { message = "Shattered!", colour = G.C.RED }
                    }
                end
            end
        end
    end
}
