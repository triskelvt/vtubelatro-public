SMODS.Atlas({
    key = "enzio_card",
    path = "enzio_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'enzio_card',
    config = { is_vtuber = true, extra = { dollars_per_discard = 1 } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    atlas = 'enzio_card',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.dollars_per_discard } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Enzio Argento', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: suttoko_mgmg', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            local discards_left = G.GAME.current_round.discards_left or 0
            if discards_left > 0 then
                ease_dollars(discards_left * card.ability.extra.dollars_per_discard)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
                return {
                    message = 'On the House!',
                    colour = G.C.MONEY
                }
            end
        end
    end
}
