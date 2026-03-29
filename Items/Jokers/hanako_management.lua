SMODS.Atlas({
    key = "hanako_management",
    path = "hanako_card.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'hanako_management',
    config = { is_vtuber = true },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    atlas = 'hanako_management',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        local count = 0
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.config and
                    G.jokers.cards[i].config.center.config.is_vtuber then
                    count = count + 1
                end
            end
        end
        return { vars = { count } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Hanako', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: ???', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i].config.center.config and
                    G.jokers.cards[i].config.center.config.is_vtuber then
                    count = count + 1
                end
            end
            if count > 0 then
                return {
                    Xmult_mod = count,
                    message = 'X' .. count,
                    colour = G.C.MULT
                }
            end
        end
    end
}
