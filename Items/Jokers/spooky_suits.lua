SMODS.Atlas({
    key = "spookyushii_card",
    path = "spookyushii_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'spookyushii_card',
    config = { is_vtuber = true, extra = { mult_gain = 4, mult = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'spookyushii_card',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: SpookyUshii', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: miovartz', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.before and not context.blueprint then
            local suits = {}
            for i = 1, #context.scoring_hand do
                suits[context.scoring_hand[i].base.suit] = true
            end

            local count = 0
            for _ in pairs(suits) do count = count + 1 end

            if count == 2 then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                return {
                    message = 'Upgrade!',
                    colour = G.C.MULT
                }
            end
        end

        if context.joker_main and card.ability.extra.mult > 0 then
            return {
                mult_mod = card.ability.extra.mult,
                message = '+' .. card.ability.extra.mult
            }
        end
    end
}
