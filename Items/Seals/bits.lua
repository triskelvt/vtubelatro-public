SMODS.Atlas({
    key = "bits_seal",
    path = "bits_seal.png",
    px = 71,
    py = 95
})

SMODS.Seal {
    key = "bits_seal",
    atlas = "bits_seal",
    pos = { x = 0, y = 0 },
    config = { extra = { chips = 5, mult = 1, dollars = 1 } },
    badge_colour = HEX('c88bee'),

    loc_vars = function(self, info_queue, card)
        return { vars = { self.config.extra.chips, self.config.extra.mult, self.config.extra.dollars } },
            { key = self.key, set = 'Seal' }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local vtuber_count = 0
            if G.jokers and G.jokers.cards then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.config and G.jokers.cards[i].config.center.config.is_vtuber then
                        vtuber_count = vtuber_count + 1
                    end
                end
            end

            if vtuber_count > 0 then
                ease_dollars(vtuber_count * self.config.extra.dollars)
                return {
                    chips = vtuber_count * self.config.extra.chips,
                    mult = vtuber_count * self.config.extra.mult,
                    card = card,
                    message = "Bits!"
                }
            end
        end
    end
}
