SMODS.Atlas({
    key = "tonyo",
    path = "tonyo_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'tonyo',
    config = { is_vtuber = true, extra = { odds = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'tonyo',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(_, _, card)
        return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.odds } }
    end,
    set_badges = function(_, _, badges)
        badges[#badges + 1] = create_badge('Vtuber: Tonyo', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: yLillySinclair', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(_, card, context)
        if context.setting_blind and not context.blueprint then
            if #G.jokers.cards < G.jokers.config.card_limit then
                if #G.consumeables.cards < G.consumeables.config.card_limit then
                    if pseudorandom('tonyo_companion') < (G.GAME.probabilities.normal or 1) / card.ability.extra.odds then
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.4,
                            func = function()
                                local spectral_card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil,
                                    'tonyo')
                                spectral_card:add_to_deck()
                                G.consumeables:emplace(spectral_card)
                                card:juice_up(0.3, 0.5)
                                return true
                            end
                        }))
                        return {
                            message = 'A Gift!',
                            colour = G.C.SECONDARY_SET.Spectral
                        }
                    end
                end
            end
        end
    end
}
