SMODS.Atlas({
    key = "cozymammoth_card",
    path = "cozymmamoth_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'cozymammoth_card',
    config = { is_vtuber = true, extra = { mult_per_empty = 10 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'cozymammoth_card',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        local empty = (G.jokers and G.jokers.config.card_limit or 5) - (G.jokers and #G.jokers.cards or 0)
        if empty < 0 then empty = 0 end
        return { vars = { card.ability.extra.mult_per_empty, empty * card.ability.extra.mult_per_empty } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: CozzyMammoth', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: _vlarue', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local empty = G.jokers.config.card_limit - #G.jokers.cards
            if empty > 0 then
                return {
                    mult = empty * card.ability.extra.mult_per_empty,
                    message = '+' .. (empty * card.ability.extra.mult_per_empty) .. ' Mult',
                    colour = G.C.MULT
                }
            end
        end
    end
}
