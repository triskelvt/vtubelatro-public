SMODS.Atlas({
    key = "kaien",
    path = "kaien_card.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'kaien',
    config = { is_vtuber = true },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'kaien',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Kaien', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: SPark845', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and context.scoring_hand then
            if context.other_card:is_suit('Clubs') then
                local chip_val = context.other_card.base.nominal
                return {
                    chips = chip_val,
                    message = '+' .. chip_val,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}
