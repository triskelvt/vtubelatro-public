SMODS.Atlas({
    key = 'kick_deck',
    path = 'kick_deck.png',
    px = 71,
    py = 95,
})

local kick = {
    key = 'kick',
    atlas = 'kick_deck',
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    apply = function(self, back)
        G.GAME.starting_params.kick_deck = true

        G.E_MANAGER:add_event(Event({
            func = function()
                local suit_map = { H = 'D', C = 'S' }
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

                if #vtuber_jokers > 0 then
                    local chosen = vtuber_jokers[math.random(#vtuber_jokers)]
                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen)
                    card:set_edition({ negative = true }, true, true)
                    card:add_to_deck()
                    G.jokers:emplace(card)
                end

                return true
            end
        }))
    end,
}

SMODS.Back(kick)
