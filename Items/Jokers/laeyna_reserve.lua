SMODS.Atlas({
    key = "laeyna_reserve",
    path = "laeyna_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'laeyna_reserve',
    config = { is_vtuber = true, extra = { Xmult = 1, xmult_gain = 0.15 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    atlas = 'laeyna_reserve',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, string.format("%.2f", card.ability.extra.Xmult) } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Laeyna', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: Ackerly', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint then
            local hands_left = G.GAME.current_round.hands_left or 0
            if hands_left > 0 then
                local gain = hands_left * card.ability.extra.xmult_gain
                card.ability.extra.Xmult = card.ability.extra.Xmult + gain
                return {
                    message = 'Reserve!',
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
        if context.joker_main then
            if card.ability.extra.Xmult > 1 then
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = 'X' .. string.format("%.2f", card.ability.extra.Xmult),
                    colour = G.C.MULT
                }
            end
        end
    end
}
