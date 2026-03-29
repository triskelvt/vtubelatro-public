SMODS.Atlas({
    key = "milis_glow",
    path = "milis_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'milis_glow',
    config = { is_vtuber = true, extra = { chips_per_heart = 4, mult_per_spade = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    atlas = 'milis_glow',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips_per_heart, card.ability.extra.mult_per_spade } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Milis', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Model by: akizone', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local c = context.other_card
            if c and c:is_suit('Hearts') then
                return {
                    chips = card.ability.extra.chips_per_heart,
                    colour = G.C.CHIPS
                }
            end
            if c and c:is_suit('Spades') then
                return {
                    mult = card.ability.extra.mult_per_spade,
                    colour = G.C.MULT
                }
            end
        end
    end
}
