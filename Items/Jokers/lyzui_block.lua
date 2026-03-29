SMODS.Atlas({
    key = "lyzui_block",
    path = "lyzui_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'lyzui_block',
    config = { is_vtuber = true, extra = {
        chips_per_sketch = 8,
        sketches = 0,
        last_discards = 0,
        is_trembling = false,
    }},
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'lyzui_block',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.chips_per_sketch,
            card.ability.extra.sketches,
            card.ability.extra.sketches * card.ability.extra.chips_per_sketch,
        }}
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Lyzui', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: nyukururu', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.discard then
            if not card.ability.extra.is_trembling and card.ability.extra.sketches > 0 then
                card.ability.extra.is_trembling = true
                local eval = function(c)
                    return G.GAME.current_round.discards_used > c.ability.extra.last_discards
                        and c.ability.extra.sketches > 0
                end
                juice_card_until(card, eval, true)
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = 'Active!',
                    colour = G.C.CHIPS,
                    focus = card,
                })
            end
        end

        if context.joker_main then
            local current_discards = G.GAME.current_round.discards_used
            if current_discards > card.ability.extra.last_discards then
                local chips = card.ability.extra.sketches * card.ability.extra.chips_per_sketch
                card.ability.extra.sketches = 0
                card.ability.extra.last_discards = current_discards
                card.ability.extra.is_trembling = false
                if chips > 0 then
                    return {
                        chips = chips,
                        message = '+' .. chips .. ' Chips',
                        colour = G.C.CHIPS
                    }
                end
            else
                card.ability.extra.sketches = card.ability.extra.sketches + 1
                return {
                    extra = { focus = card, message = '+1 Sketch' },
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end

        if context.end_of_round and context.main_eval then
            card.ability.extra.sketches = 0
            card.ability.extra.last_discards = 0
            card.ability.extra.is_trembling = false
        end
    end
}