SMODS.Atlas({
    key = "hype_train",
    path = "hype_train.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'hype_train',
    config = { extra = { x_mult_per_joker = 0.5 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 10,
    atlas = 'hype_train',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        local vtuber_count = 0
        if G.jokers and G.jokers.cards then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then break end
                if G.jokers.cards[i].config.center.config.is_vtuber then
                    vtuber_count = vtuber_count + 1
                end
            end
        end
        local total_x = 1 + (vtuber_count * card.ability.extra.x_mult_per_joker)
        return { vars = { 1 + card.ability.extra.x_mult_per_joker, total_x } }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local vtuber_count = 0
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then break end
                if G.jokers.cards[i].config.center.config.is_vtuber then
                    vtuber_count = vtuber_count + 1
                end
            end

            local total_x_mult = 1 + (vtuber_count * card.ability.extra.x_mult_per_joker)
            if total_x_mult > 1 then
                return {
                    message = 'X' .. total_x_mult,
                    Xmult_mod = total_x_mult
                }
            end
        end
    end
}
