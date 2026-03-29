SMODS.Atlas({
    key = "pierrot_tent",
    path = "pierrot_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'pierrot_tent',
    config = { is_vtuber = true, extra = { hands_per_bonus = 2, penalty = 3, current_bonus = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'pierrot_tent',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.hands_per_bonus, card.ability.extra.penalty, card.ability.extra.current_bonus } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: PierrotVT', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: momo', HEX('3a86ff'), G.C.white, 1.2)
    end,

    add_to_deck = function(self, card, from_debuff)
        local hands = G.GAME.round_resets.hands or 4
        local bonus = math.floor(hands / card.ability.extra.hands_per_bonus)
        card.ability.extra.current_bonus = bonus
        G.hand:change_size(bonus)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.current_bonus)
        card.ability.extra.current_bonus = 0
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local hands = G.GAME.round_resets.hands or 4
            local new_bonus = math.floor(hands / card.ability.extra.hands_per_bonus)
            local diff = new_bonus - card.ability.extra.current_bonus
            if diff ~= 0 then
                card.ability.extra.current_bonus = new_bonus
                G.hand:change_size(diff)
            end
        end

        if context.end_of_round and context.main_eval and not context.blueprint and not context.repetition and not context.individual then
            if (G.GAME.current_round.hands_left or 0) == 0 then
                ease_dollars(-card.ability.extra.penalty)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
                return {
                    message = '-$' .. card.ability.extra.penalty,
                    colour = G.C.RED
                }
            end
        end
    end
}