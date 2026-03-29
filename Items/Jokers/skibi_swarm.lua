SMODS.Atlas({
    key = "skibi_swarm",
    path = "skibi_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'skibi_swarm',
    config = { is_vtuber = true, extra = { chips_per_card = 3 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'skibi_swarm',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        local total_cards = (G.hand and #G.hand.cards or 0) + (G.play and #G.play.cards or 0)
        return { vars = { card.ability.extra.chips_per_card, total_cards * card.ability.extra.chips_per_card } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: SkiBi', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: goshi', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local total_cards = #G.hand.cards + #G.play.cards
            if total_cards > 0 then
                return {
                    chips = total_cards * card.ability.extra.chips_per_card,
                    message = '+' .. (total_cards * card.ability.extra.chips_per_card) .. ' Chips',
                    colour = G.C.CHIPS
                }
            end
        end
    end
}
