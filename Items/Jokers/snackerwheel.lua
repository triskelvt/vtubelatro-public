SMODS.Atlas({
    key = "snackerwheel",
    path = "snacker_card.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'snackerwheel',
    config = { is_vtuber = true, extra = { Xmult = 1, Xmult_mod_base = 0.25, Xmult_mod_success = 0.5 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    atlas = 'snackerwheel',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        local current = 1
        if card and card.ability and card.ability.extra then
            current = card.ability.extra.Xmult
        elseif self.config and self.config.extra then
            current = self.config.extra.Xmult
        end
        return { vars = { string.format("%.2f", current) } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Snackersaurus', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: H0C0L1', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable and context.consumeable.ability and context.consumeable.ability.set == 'Tarot' and context.consumeable.ability.name == 'The Wheel of Fortune' then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod_base
            return {
                extra = { focus = card, message = 'Spin!' },
                colour = G.C.MULT,
                card = card
            }
        end
        if context.wheel_of_fortune then
            card.ability.extra.Xmult = card.ability.extra.Xmult + card.ability.extra.Xmult_mod_success
            return {
                extra = { focus = card, message = 'Lucky!' },
                colour = G.C.MULT,
                card = card
            }
        end
        if context.joker_main then
            if card.ability.extra.Xmult > 1 then
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = 'x' .. string.format("%.2f", card.ability.extra.Xmult) .. ' Mult'
                }
            end
        end
    end
}
