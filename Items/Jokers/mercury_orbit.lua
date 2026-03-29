SMODS.Atlas({
    key = "mercury_orbit",
    path = "mercury_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'mercury_orbit',
    config = { is_vtuber = true },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 7,
    atlas = 'mercury_orbit',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Mercury', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Model by: sonyaao_o', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.before and context.scoring_name == "Flush Five" then
            if #G.consumeables.cards < G.consumeables.config.card_limit then
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.4,
                    func = function()
                        local spectral_card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil,
                            'mercury_orbit')
                        spectral_card:add_to_deck()
                        G.consumeables:emplace(spectral_card)
                        return true
                    end
                }))
                return {
                    message = 'Spectral!',
                    colour = G.C.SECONDARY_SET.Spectral
                }
            end
        end
    end
}
