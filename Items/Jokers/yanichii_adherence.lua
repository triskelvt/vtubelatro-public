SMODS.Atlas({
    key = "yanichii_adherence",
    path = "yanichii_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'yanichii_adherence',
    config = { is_vtuber = true, extra = {
        mult = 0,
        progress = 0,
        cards_per_mult = 5,
    } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    atlas = 'yanichii_adherence',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.cards_per_mult,
                card.ability.extra.progress,
            }
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Yanichii', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: lilianna849951', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            card.ability.extra.progress = card.ability.extra.progress + 1
            if card.ability.extra.progress >= card.ability.extra.cards_per_mult then
                card.ability.extra.progress = 0
                card.ability.extra.mult = card.ability.extra.mult + 1
                return {
                    extra = { focus = card, message = '+1 Mult!' },
                    colour = G.C.MULT,
                    card = card
                }
            end
        end

        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    mult_mod = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.mult .. ' Mult',
                    colour = G.C.MULT
                }
            end
        end
    end
}
