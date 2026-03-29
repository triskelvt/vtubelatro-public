SMODS.Atlas({
    key = "myoshi_tag",
    path = "myoshi_tag.png",
    px = 34,
    py = 34
})

SMODS.Tag {
    key = 'myoshi',
    atlas = 'myoshi_tag',
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    apply = function(self, tag, context)
        if context.type == 'store_joker_modify' and not tag.triggered then
            if context.card and context.card.config and
                context.card.config.center and context.card.config.center.config and
                context.card.config.center.config.is_vtuber then
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    local vtubers = {}
                    for k, v in pairs(G.P_CENTERS) do
                        if v.set == 'Joker' and v.config and v.config.is_vtuber then
                            table.insert(vtubers, v)
                        end
                    end
                    if #vtubers > 0 then
                        local lock = tag.ID
                        G.CONTROLLER.locks[lock] = true
                        tag:yep('+MyOshi!', G.C.GREEN, function()
                            local chosen = vtubers[math.random(#vtubers)]
                            G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    local card = create_card('Joker', G.jokers, nil, nil, nil, nil, chosen.key, 'myoshi')
                                    card:add_to_deck()
                                    G.jokers:emplace(card)
                                    card:start_materialize()
                                    G.GAME.joker_buffer = 0
                                    G.CONTROLLER.locks[lock] = nil
                                    return true
                                end
                            }))
                            return true
                        end)
                        tag.triggered = true
                        return true
                    end
                end
            end
        end
    end
}
