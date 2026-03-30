SMODS.Atlas({
    key = "reina_clock",
    path = "reina_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'reina_clock',
    config = { is_vtuber = true, extra = { odds = 4, fractures = 0, fracture_active = false } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'reina_clock',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.odds, card.ability.extra.fractures } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: ReinaTakahara', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: King__Apollyon', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            card.ability.extra.fracture_active = false
            if pseudorandom('reina_clock') < G.GAME.probabilities.normal / card.ability.extra.odds then
                card.ability.extra.fracture_active = true
                card.ability.extra.fractures = card.ability.extra.fractures + 1
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil,
                            { message = 'Fracture!', colour = G.C.PURPLE })
                        return true
                    end
                }))
            end
        end
        if context.repetition and context.cardarea == G.play then
            if card.ability.extra.fracture_active then
                return {
                    message = 'Echo!',
                    repetitions = 1,
                    colour = G.C.PURPLE
                }
            end
        end
    end
}
