SMODS.Atlas({
    key = 'twitch_deck',
    path = 'twitch_deck.png',
    px = 71,
    py = 95,
})

local twitch = {
    key = 'twitch',
    atlas = 'twitch_deck',
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    apply = function(self, back)
        G.GAME.starting_params.twitch_deck = true

        G.E_MANAGER:add_event(Event({
            func = function()
                local suit_map = { D = 'H', S = 'C' }
                local rank_map = {
                    [2] = '2',
                    [3] = '3',
                    [4] = '4',
                    [5] = '5',
                    [6] = '6',
                    [7] = '7',
                    [8] = '8',
                    [9] = '9',
                    [10] = 'T',
                    [11] = 'J',
                    [12] = 'Q',
                    [13] = 'K',
                    [14] = 'A'
                }

                for i = #G.playing_cards, 1, -1 do
                    local card = G.playing_cards[i]
                    local suit_prefix = string.sub(card.base.suit, 1, 1)
                    if suit_map[suit_prefix] then
                        local rank = rank_map[card.base.id]
                        if rank then
                            local new_key = suit_map[suit_prefix] .. '_' .. rank
                            if G.P_CARDS[new_key] then
                                card:set_base(G.P_CARDS[new_key])
                            end
                        end
                    end
                end

                local vtuber_jokers = {}
                for k, v in pairs(G.P_CENTERS) do
                    if v.set == 'Joker' and v.config and v.config.is_vtuber then
                        table.insert(vtuber_jokers, k)
                    end
                end

                if #vtuber_jokers >= 2 then
                    local idx1 = math.random(#vtuber_jokers)
                    local chosen1 = vtuber_jokers[idx1]
                    table.remove(vtuber_jokers, idx1)
                    local idx2 = math.random(#vtuber_jokers)
                    local chosen2 = vtuber_jokers[idx2]

                    local card1 = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen1)
                    card1:set_edition('e_vtb_hyped', true, true)
                    card1:add_to_deck()
                    G.jokers:emplace(card1)

                    local card2 = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen2)
                    card2:add_to_deck()
                    G.jokers:emplace(card2)
                elseif #vtuber_jokers == 1 then
                    local card1 = create_card('Joker', G.jokers, nil, nil, nil, nil, vtuber_jokers[1])
                    card1:set_edition('e_vtb_hyped', true, true)
                    card1:add_to_deck()
                    G.jokers:emplace(card1)
                end

                return true
            end
        }))
    end,
}

SMODS.Back(twitch)
