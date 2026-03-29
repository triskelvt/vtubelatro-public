SMODS.Atlas({
    key = "romanticxlily_card",
    path = "romanticxlily_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'romanticxlily_card',
    config = { is_vtuber = true, extra = { mult_per_hand = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    atlas = 'romanticxlily_card',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        local hands_played = G.GAME.current_round and G.GAME.current_round.hands_played or 0
        local current_mult = hands_played * card.ability.extra.mult_per_hand
        return { vars = { card.ability.extra.mult_per_hand, current_mult } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: RomanticXLily', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: VahcynStudio', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local hands_played = G.GAME.current_round.hands_played or 0
            if hands_played > 0 then
                return {
                    mult = hands_played * card.ability.extra.mult_per_hand,
                    message = '+' .. (hands_played * card.ability.extra.mult_per_hand) .. ' Mult',
                    colour = G.C.MULT
                }
            end
        end
    end
}
