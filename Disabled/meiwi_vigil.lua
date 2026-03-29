SMODS.Atlas({
    key = "meiwi_vigil",
    path = "test_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'meiwi_vigil',
    config = { is_vtuber = true, extra = { mult = 0, mult_gain = 3, discarded = false } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'meiwi_vigil',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = false,
    discovered = false,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Meiwi', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: ???', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            card.ability.extra.discarded = false
        end
        if context.discard and not context.blueprint then
            card.ability.extra.discarded = true
        end
        if context.end_of_round and context.main_eval and not context.blueprint then
            if not card.ability.extra.discarded then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = 'Vigilant!',
                    colour = G.C.MULT,
                    card = card
                }
            end
            card.ability.extra.discarded = false
        end
        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    mult_mod = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.mult .. ' Mult',
                    colour = G.C.MULT
                }
            end
        end
    end
}
