SMODS.Atlas({
    key = "chinchillada_stash",
    path = "chinchillada_card.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'chinchillada_stash',
    config = { is_vtuber = true, extra = { stash = 0 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'chinchillada_stash',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.stash } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Chinchilladas', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: Chinchilladas', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.selling_card and not context.blueprint then
            local sell_value = context.card.sell_cost or 0
            if sell_value > 0 then
                card.ability.extra.stash = card.ability.extra.stash + sell_value
                return {
                    message = '+' .. sell_value .. ' Stash!',
                    colour = G.C.MONEY,
                    card = card
                }
            end
        end
        if context.joker_main then
            if card.ability.extra.stash > 0 then
                return {
                    mult = card.ability.extra.stash,
                    message = '+' .. card.ability.extra.stash .. ' Mult',
                    colour = G.C.MULT
                }
            end
        end
    end
}
