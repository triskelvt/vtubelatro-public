SMODS.Atlas({
    key = "rashiira_sketch",
    path = "rashiira_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'rashiira_sketch',
    config = { is_vtuber = true, extra = {} },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'rashiira_sketch',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Rashiira', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: Rashiira', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.repetition and not context.individual then
            local eligible = {}
            for _, c in ipairs(G.hand.cards) do
                if not c.edition then
                    eligible[#eligible + 1] = c
                end
            end
            if #eligible > 0 then
                local target = pseudorandom_element(eligible, pseudoseed('rashiira_sketch'))
                local editions = { { foil = true }, { holo = true }, { polychrome = true } }
                local chosen = pseudorandom_element(editions, pseudoseed('rashiira_ed'))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        target:set_edition(chosen, true, true)
                        card:juice_up(0.5, 0.5)
                        return true
                    end
                }))
                return {
                    message = 'Sketch!',
                    colour = G.C.DARK_EDITION
                }
            end
        end
    end
}