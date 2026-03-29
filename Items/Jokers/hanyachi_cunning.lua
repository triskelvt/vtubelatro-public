SMODS.Atlas({
    key = "hanyachi_cunning",
    path = "hanyachi_cunning.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'hanyachi_cunning',
    config = { is_vtuber = true, extra = { chips = 20, mult = 3 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    atlas = 'hanyachi_cunning',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.mult } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Hanyachi', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: BunnAriii', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            local has_face = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:is_face() then
                    has_face = true
                    break
                end
            end
            if not has_face then
                return {
                    chips = card.ability.extra.chips,
                    mult = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.chips .. ' ' .. '+' .. card.ability.extra.mult,
                    colour = G.C.MULT
                }
            end
        end
    end
}
