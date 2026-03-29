SMODS.Atlas({
    key = "mono_feast",
    path = "mono_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'mono_feast',
    config = { is_vtuber = true, extra = { Xmult = 1, xmult_gain = 0.15, xmult_loss = 0.15 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    atlas = 'mono_feast',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult_gain, card.ability.extra.xmult_loss, string.format("%.2f", card.ability.extra.Xmult) } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Artist: Mono Vampie', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if #context.full_hand == 5 then
                card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.xmult_gain
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = 'Feast!',
                    colour = G.C.MULT
                }
            else
                if card.ability.extra.Xmult > 1 then
                    card.ability.extra.Xmult = math.max(1, card.ability.extra.Xmult - card.ability.extra.xmult_loss)
                end
                if card.ability.extra.Xmult > 1 then
                    return {
                        Xmult_mod = card.ability.extra.Xmult,
                        message = 'Hungry...',
                        colour = G.C.RED
                    }
                end
            end
        end
    end
}
