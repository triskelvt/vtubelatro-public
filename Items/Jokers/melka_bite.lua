SMODS.Atlas({
    key = "melka_bite",
    path = "melka_bite.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'melka_bite',
    config = { is_vtuber = true, extra = { x_mult = 1, odds = 4, x_mult_gain = 1 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    atlas = 'melka_bite',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return { vars = { (G.GAME.probabilities.normal or 1), card.ability.extra.odds, card.ability.extra.x_mult_gain, card.ability.extra.x_mult } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Melka', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: Melka', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.x_mult > 1 then
                return {
                    message = 'X' .. card.ability.extra.x_mult,
                    Xmult_mod = card.ability.extra.x_mult
                }
            end
        end

        if context.destroying_card and not context.blueprint then
            if context.destroying_card:is_suit('Hearts') then
                if pseudorandom('melka_bite') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain
                    return {
                        message = 'Upgrade!',
                        colour = G.C.MULT
                    }
                end
            end
        end
    end
}
