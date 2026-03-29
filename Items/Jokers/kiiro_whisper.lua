SMODS.Atlas({
    key = "kiiro_card",
    path = "kiiro_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'kiiro_whisper',
    config = { is_vtuber = true, extra = { chips = 8, xmult = 2.0 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'kiiro_card',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(_, _, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.xmult } }
    end,

    set_badges = function(_, _, badges)
        badges[#badges + 1] = create_badge('Vtuber: kiiroOwO', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Art by: kiiroOwO', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(_, card, context)
        if context.individual and context.cardarea == G.play then
            local played_card = context.other_card
            if played_card and played_card:get_id() <= 5 then
                return {
                    chips = card.ability.extra.chips,
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                    colour = G.C.CHIPS
                }
            end
        end

        if context.joker_main then
            local all_low = true
            for _, played_card in ipairs(context.scoring_hand) do
                if played_card:get_id() > 5 then
                    all_low = false
                    break
                end
            end
            if all_low and #context.scoring_hand > 0 then
                return {
                    xmult = card.ability.extra.xmult,
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
                    colour = G.C.MULT
                }
            end
        end
    end
}
