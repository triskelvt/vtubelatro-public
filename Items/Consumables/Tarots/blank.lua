SMODS.Atlas({
    key = "blank",
    path = "blank.png",
    px = 63,
    py = 93
})

SMODS.Consumable {
    key = 'blank',
    set = 'Tarot',
    atlas = 'blank',
    pos = { x = 0, y = 0 },
    cost = 4,
    unlocked = true,
    discovered = true,
    config = { max_highlighted = 1 },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_SEALS.vtb_follower_seal
    end,

    use = function(self, card, area, copier)
        local targeted_cards = {}
        for i = 1, #G.hand.highlighted do
            targeted_cards[i] = G.hand.highlighted[i]
        end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                for i = 1, #targeted_cards do
                    local highlighted_card = targeted_cards[i]
                    highlighted_card:set_seal('vtb_follower_seal', nil, true)
                    highlighted_card:juice_up(0.3, 0.5)
                end
                G.hand:unhighlight_all()
                return true
            end
        }))
    end
}
