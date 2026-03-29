SMODS.Atlas({
    key = "kyuuons_gamble",
    path = "kyuuon_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'kyuuons_gamble',
    config = { is_vtuber = true, extra = { chip_mod = 2, odds_double = 2, odds_zero = 8 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'kyuuons_gamble',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds_double, card.ability.extra.odds_zero } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Kyuuon', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: ???', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if pseudorandom('kyuuon_zero') < G.GAME.probabilities.normal / card.ability.extra.odds_zero then
                return {
                    chip_mod = -G.GAME.chips,
                    message = "MISS!",
                    colour = G.C.RED
                }
            end

            if pseudorandom('kyuuon_double') < G.GAME.probabilities.normal / card.ability.extra.odds_double then
                return {
                    message = "X2 Chips!",
                    x_chips = 2,
                    colour = G.C.CHIPS
                }
            end
        end
    end
}
