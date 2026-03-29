SMODS.Atlas({
    key = "daz_graverobber",
    path = "daz_card.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'daz_graverobber',
    config = { is_vtuber = true, extra = { slots_gained = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    atlas = 'daz_graverobber',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.slots_gained } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: DazTheGhost', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: gloomwastaken', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and G.GAME.blind.boss and not context.blueprint then
            card.ability.extra.slots_gained = card.ability.extra.slots_gained + 1
            G.jokers.config.card_limit = G.jokers.config.card_limit + 1
            return {
                message = '+1 Slot!',
                colour = G.C.PURPLE,
                card = card
            }
        end
    end
}
