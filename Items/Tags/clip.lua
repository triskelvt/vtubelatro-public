SMODS.Atlas({
    key = "clip_tag",
    path = "clip_tag.png",
    px = 34,
    py = 34
})

SMODS.Tag {
    key = 'clip_tag',
    atlas = 'clip_tag',
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    min_ante = 4,
    apply = function(self, tag, context)
        if context.type == 'new_blind_choice' and not tag.triggered then
            local eligible = {}
            for i = 1, #G.jokers.cards do
                if not G.jokers.cards[i].edition then
                    table.insert(eligible, G.jokers.cards[i])
                end
            end
            if #eligible > 0 then
                local lock = tag.ID
                G.CONTROLLER.locks[lock] = true
                tag:yep('+Edition!', G.C.DARK_EDITION, function()
                    for i = 1, #eligible do
                        local edition = poll_edition('clip_tag' .. i .. G.GAME.round_resets.ante, 2, false, true)
                        eligible[i]:set_edition(edition, true)
                    end
                    G.CONTROLLER.locks[lock] = nil
                    return true
                end)
                tag.triggered = true
                return true
            end
        end
    end
}
