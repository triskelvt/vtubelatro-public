SMODS.Atlas({
    key = "pardoky_bag",
    path = "pardoky_bag.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'pardoky_bag',
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    atlas = 'pardoky_bag',
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Pardoky', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Model by: Jully Eny', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.before and context.poker_hands and next(context.poker_hands['Five of a Kind']) then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('gold_seal', 1.2, 0.4)
                    card:juice_up(0.8, 0.5)
                    local legendary_pool = {}
                    for k, v in pairs(G.P_CENTERS) do
                        if v.set == 'Joker' and v.rarity == 4 then
                            legendary_pool[#legendary_pool + 1] = k
                        end
                    end
                    local chosen_key = pseudorandom_element(legendary_pool, pseudoseed('paper_bag_choice'))
                    local new_joker = SMODS.create_card({ set = 'Joker', key = chosen_key, area = G.jokers, edition = { negative = true } })
                    new_joker:add_to_deck()
                    G.jokers:emplace(new_joker)
                    return true
                end
            }))
            return {
                message = '¡Sorpresa!',
                colour = G.C.FILTER
            }
        end
    end
}
