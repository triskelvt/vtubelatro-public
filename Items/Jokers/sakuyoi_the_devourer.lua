SMODS.Atlas({
    key = "sakuyoi_devourer",
    path = "sakuyoi_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'sakuyoi_devourer',
    config = { is_vtuber = true, extra = { Xmult = 1, tarot_gain = 0.25, planet_gain = 0.20 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'sakuyoi_devourer',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.tarot_gain,
                card.ability.extra.planet_gain,
                string.format("%.2f", card.ability.extra.Xmult)
            }
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Sakuyoi', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: teddieee6', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if G.GAME.blind.boss then
                if #G.consumeables.cards > 0 then
                    local consumed = G.consumeables.cards[1]
                    local is_tarot = consumed.ability.set == 'Tarot'
                    local is_planet = consumed.ability.set == 'Planet'
                    local gain = 0
                    local msg = ''
                    local colour = G.C.WHITE
                    if is_tarot then
                        gain = card.ability.extra.tarot_gain
                        msg = '+' .. gain .. 'X (Tarot)'
                        colour = G.C.PURPLE
                    elseif is_planet then
                        gain = card.ability.extra.planet_gain
                        msg = '+' .. gain .. 'X (Planet)'
                        colour = G.C.BLUE
                    end
                    if gain > 0 then
                        card.ability.extra.Xmult = card.ability.extra.Xmult + gain
                    end
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            card_eval_status_text(card, 'extra', nil, nil, nil, { message = msg, colour = colour })
                            consumed:start_dissolve()
                            return true
                        end
                    }))
                else
                    if #G.jokers.cards > 1 then
                        local sacrificed = nil
                        for i = 1, #G.jokers.cards do
                            if G.jokers.cards[i] ~= card then
                                sacrificed = G.jokers.cards[i]
                                break
                            end
                        end
                        if sacrificed then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    card_eval_status_text(card, 'extra', nil, nil, nil,
                                        { message = 'Devoured!', colour = G.C.RED })
                                    sacrificed:start_dissolve()
                                    return true
                                end
                            }))
                        end
                    end
                end
            end
        end
        if context.joker_main then
            if card.ability.extra.Xmult > 1 then
                return {
                    Xmult_mod = card.ability.extra.Xmult,
                    message = 'X' .. string.format("%.2f", card.ability.extra.Xmult),
                    colour = G.C.MULT
                }
            end
        end
    end
}
