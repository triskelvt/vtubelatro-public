SMODS.Atlas({
    key = "dinkityz_rush",
    path = "dinki_card.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'dinkityz_rush',
    config = { is_vtuber = true, extra = { Xmult = 1, xmult_gain = 0.15, hands_played = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    atlas = 'dinkityz_rush',
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
        badges[#badges + 1] = create_badge('Vtuber: Dinkityz', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: kairuereiko', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            card.ability.extra.hands_played = card.ability.extra.hands_played + 1
        end
        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.hands_played = 0
        end
        if context.joker_main then
            if card.ability.extra.hands_played > 3 then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.xmult_gain
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = 'Rush!',
                    colour = G.C.MULT
                }
            elseif card.ability.extra.Xmult > 1 then
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = 'X' .. string.format("%.2f", card.ability.extra.Xmult),
                    colour = G.C.MULT
                }
            end
        end
    end
}
