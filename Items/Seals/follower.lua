SMODS.Atlas({
    key = "follower_seal",
    path = "follower_seal.png",
    px = 71,
    py = 95
})

SMODS.Seal {
    key = 'follower',
    atlas = 'follower_seal',
    pos = { x = 0, y = 0 },
    config = { extra = { chips = 10 } },
    badge_colour = HEX('4d9de0'),

    loc_vars = function(self, info_queue, card)
        local chips = self.config.extra.chips
        if card and card.ability and card.ability.follower_chips then
            chips = card.ability.follower_chips + self.config.extra.chips
        end
        return { vars = { chips } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if not card.ability.follower_chips then card.ability.follower_chips = 0 end
            card.ability.follower_chips = card.ability.follower_chips + self.config.extra.chips

            return {
                chips = card.ability.follower_chips,
                card = card,
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.follower_chips } }
            }
        end
    end
}
