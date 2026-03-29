SMODS.Atlas({
    key = "keebler_die",
    path = "keebler_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'keebler_die',
    config = { is_vtuber = true, extra = { chips_bonus = 0, xmult_bonus = 1, chips_roll = 15, chips_roll_minor = 8, xmult_roll = 2, last_roll = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'keebler_die',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips_roll, card.ability.extra.xmult_roll, card.ability.extra.last_roll, card.ability.extra.chips_roll_minor } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Keebler', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: Amaneko', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            card.ability.extra.chips_bonus = 0
            card.ability.extra.xmult_bonus = 1
            local roll = math.floor(pseudorandom('keebler_die') * 6) + 1
            card.ability.extra.last_roll = roll
            if roll == 1 then
                local candidates = {}
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i] ~= card then
                        candidates[#candidates + 1] = G.jokers.cards[i]
                    end
                end
                if #candidates > 0 then
                    local target = candidates[math.floor(pseudorandom('keebler_target') * #candidates) + 1]
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Chaos!', colour = G.C.RED })
                            target:start_dissolve()
                            return true
                        end
                    }))
                end
            elseif roll == 2 then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil,
                            { message = 'Nothing...', colour = G.C.WHITE })
                        return true
                    end
                }))
            elseif roll == 3 then
                card.ability.extra.chips_bonus = card.ability.extra.chips_roll_minor
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, { message = '+Chips!', colour = G.C.CHIPS })
                        return true
                    end
                }))
            elseif roll <= 5 then
                card.ability.extra.chips_bonus = card.ability.extra.chips_roll
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, { message = '+Chips!', colour = G.C.CHIPS })
                        return true
                    end
                }))
            else
                card.ability.extra.xmult_bonus = card.ability.extra.xmult_roll
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil,
                            { message = 'X' .. card.ability.extra.xmult_roll .. ' Mult!', colour = G.C.MULT })
                        return true
                    end
                }))
            end
        end
        if context.joker_main then
            if card.ability.extra.xmult_bonus > 1 then
                return {
                    Xmult_mod = card.ability.extra.xmult_bonus,
                    message = 'X' .. card.ability.extra.xmult_bonus,
                    colour = G.C.MULT
                }
            end
            if card.ability.extra.chips_bonus > 0 then
                return {
                    chips = card.ability.extra.chips_bonus,
                    message = '+' .. card.ability.extra.chips_bonus .. ' Chips',
                    colour = G.C.CHIPS
                }
            end
        end
    end
}
