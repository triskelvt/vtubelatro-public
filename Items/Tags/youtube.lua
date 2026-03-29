SMODS.Atlas({
    key = "youtube_tag",
    path = "youtube_tag.png",
    px = 34,
    py = 34
})

SMODS.Tag {
    key = 'youtube_live',
    atlas = 'youtube_tag',
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    apply = function(self, tag, context)
        if context.type == 'store_joker_create' and not tag.triggered then
            local vtubers = {}
            for k, v in pairs(G.P_CENTERS) do
                if v.set == 'Joker' and v.config and v.config.is_vtuber then
                    table.insert(vtubers, v)
                end
            end
            if #vtubers > 0 then
                local chosen = vtubers[math.random(#vtubers)]
                local card = create_card('Joker', context.area, nil, nil, nil, nil, chosen.key, 'youtube_live')
                create_shop_card_ui(card, 'Joker', context.area)
                card.states.visible = false
                card:start_materialize()
                tag:yep('+Free Vtuber!', G.C.GREEN, function()
                    card.ability.couponed = true
                    card:set_cost()
                    return true
                end)
                tag.triggered = true
                return card
            end
        end
    end
}
