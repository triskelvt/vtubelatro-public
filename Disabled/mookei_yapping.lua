SMODS.Atlas({
    key = "mookei_yapping",
    path = "test_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'mookei_yapping',
    config = { is_vtuber = true, extra = { mult_gain = 3, hands_played = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'mookei_yapping',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = false,
    discovered = false,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.hands_played * card.ability.extra.mult_gain } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Mookei', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: ???', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.hands_played = 0
        end
        if context.before and not context.blueprint then
            card.ability.extra.hands_played = card.ability.extra.hands_played + 1
        end
        if context.joker_main then
            local current_mult = card.ability.extra.hands_played * card.ability.extra.mult_gain
            if current_mult > 0 then
                return {
                    mult_mod = current_mult,
                    message = '+' .. current_mult .. ' Mult',
                    colour = G.C.MULT
                }
            end
        end
    end
}
