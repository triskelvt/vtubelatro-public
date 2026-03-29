SMODS.Atlas({
    key = "gyaru_mixup",
    path = "gyarugarou_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'gyaru_mixup',
    config = { is_vtuber = true, extra = { mult = 10, last_hand = '' } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'gyaru_mixup',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Gyarugarou', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: sueimo', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.joker_main and not context.blueprint then
            local current_hand = context.scoring_name
            local last = card.ability.extra.last_hand
            if last ~= '' and current_hand ~= last then
                card.ability.extra.last_hand = current_hand
                return {
                    mult = card.ability.extra.mult,
                    message = 'Mixup!',
                    colour = G.C.MULT
                }
            end
            card.ability.extra.last_hand = current_hand
        end

        if context.end_of_round and not context.blueprint and not context.repetition and not context.individual then
            card.ability.extra.last_hand = ''
        end
    end
}
