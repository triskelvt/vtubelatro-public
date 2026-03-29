SMODS.Atlas({
    key = "raid_tag",
    path = "raid_tag.png",
    px = 34,
    py = 34
})

SMODS.Tag {
    key = 'raid_tag',
    atlas = 'raid_tag',
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    min_ante = 5,
    apply = function(self, tag, context)
        if context.type == 'immediate' and not tag.triggered then
            local vtuber_count = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.config and
                    G.jokers.cards[i].config.center.config.is_vtuber then
                    vtuber_count = vtuber_count + 1
                end
            end
            if vtuber_count > 0 then
                local payout = vtuber_count * 3
                tag:yep('+$' .. payout, G.C.MONEY, function()
                    ease_dollars(payout)
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end
}
