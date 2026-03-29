SMODS.Atlas({
    key = "sarbi_projection",
    path = "sarbi_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'sarbi_projection',
    config = { is_vtuber = true, extra = { odds = 4 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'sarbi_projection',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.odds } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Sarbi', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: skelaxo', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local c = context.other_card
            if c and not c.edition and pseudorandom('sarbi_proj') < G.GAME.probabilities.normal / card.ability.extra.odds then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        c:set_edition({ polychrome = true }, true, true)
                        return true
                    end
                }))
                return { message = 'Polychrome!', colour = G.C.FILTER }
            end
        end
    end
}
