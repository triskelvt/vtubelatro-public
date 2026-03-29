SMODS.Atlas({
    key = "beefquake_bonk",
    path = "beefquake_card.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'beefquake_bonk',
    config = { is_vtuber = true },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'beefquake_bonk',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: BeefQuake', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Model by: Saski', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand then
            if context.other_card and SMODS.has_enhancement(context.other_card, 'm_steel') then
                return {
                    message = "Again!",
                    repetitions = 1,
                    card = card
                }
            end
        end
    end
}
