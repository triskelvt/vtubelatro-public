SMODS.Atlas({
    key = "sprout_tour",
    path = "sprout_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'sprout_tour',
    config = { is_vtuber = true, extra = { x_mult = 1, gain = 0.2 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    atlas = 'sprout_tour',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.gain, card.ability.extra.x_mult } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: BabeySprout', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: BabeySprout', HEX('3a86ff'), G.C.white, 1.2)
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

        if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.gain
            return {
                message = 'Upgrade!',
                colour = G.C.MULT
            }
        end
    end
}
