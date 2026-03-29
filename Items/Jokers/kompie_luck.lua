SMODS.Atlas({
    key = "kompie",
    path = "kompie_card.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'kompie',
    config = { is_vtuber = true, extra = { odds = 2 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'kompie',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.odds } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Kaien', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: Kaien', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand then
            if context.other_card and (
                    SMODS.has_enhancement(context.other_card, 'm_steel') or
                    context.other_card:is_suit('Clubs')
                ) then
                if pseudorandom('kompie') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    return {
                        message = localize('k_again_ex'),
                        repetitions = 1,
                        card = card
                    }
                end
            end
        end
    end
}
