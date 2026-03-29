SMODS.Atlas({
    key = "rickynyanheart_card",
    path = "rickynyanheart_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'rickynyanheart_card',
    config = { is_vtuber = true, extra = { chips = 0, chips_per_hand = 10 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'rickynyanheart_card',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips_per_hand, card.ability.extra.chips } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: RickyNyanheart', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: RickyNyanheart', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chips_per_hand
            return {
                message = '+' .. card.ability.extra.chips_per_hand .. ' Chips',
                colour = G.C.CHIPS,
                card = card
            }
        end

        if context.joker_main and card.ability.extra.chips > 0 then
            return {
                chips = card.ability.extra.chips,
                message = '+' .. card.ability.extra.chips .. ' Chips',
                colour = G.C.CHIPS
            }
        end
    end
}
