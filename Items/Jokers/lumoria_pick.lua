SMODS.Atlas({
    key = "lumoria_pick",
    path = "lumoria_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'lumoria_pick',
    config = { is_vtuber = true, extra = { mult_mod = 6, suit = 'None' } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    atlas = 'lumoria_pick',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_mod, card.ability.extra.suit } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Lumoria', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Model by: bluebyaoi', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            local suits = { 'Spades', 'Hearts', 'Clubs', 'Diamonds' }
            local idx = math.floor(pseudorandom('lumoria_pick') * 4) + 1
            card.ability.extra.suit = suits[idx]
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil,
                        { message = card.ability.extra.suit .. '!', colour = G.C.MULT })
                    return true
                end
            }))
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then
                return {
                    mult = card.ability.extra.mult_mod,
                    message = '+' .. card.ability.extra.mult_mod .. ' Mult',
                    colour = G.C.MULT
                }
            end
        end
    end
}
