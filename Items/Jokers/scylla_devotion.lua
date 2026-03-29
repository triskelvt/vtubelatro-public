SMODS.Atlas({
    key = "scylla_devotion",
    path = "scylla_card.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'scylla_devotion',
    config = { is_vtuber = true, extra = { xmult_per_left = 0.10, chips_per_right = 10 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'scylla_devotion',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        local left_count = 0
        local right_count = 0
        if G.jokers then
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    left_count = i - 1
                    right_count = #G.jokers.cards - i
                    break
                end
            end
        end
        local Xmult = 1 + (left_count * card.ability.extra.xmult_per_left)
        local chips = right_count * card.ability.extra.chips_per_right
        return {
            vars = {
                card.ability.extra.xmult_per_left,
                card.ability.extra.chips_per_right,
                string.format("%.2f", Xmult),
                chips
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Scylla', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: IxMingming', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            local scylla_pos = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    scylla_pos = i
                    break
                end
            end
            if scylla_pos then
                local left_count = scylla_pos - 1
                local right_count = #G.jokers.cards - scylla_pos
                local Xmult = 1 + (left_count * card.ability.extra.xmult_per_left)
                local chips = right_count * card.ability.extra.chips_per_right
                local result = {}
                if Xmult > 1 then
                    result.Xmult_mod = Xmult
                end
                if chips > 0 then
                    result.chips = chips
                end
                if Xmult > 1 and chips > 0 then
                    result.message = 'X' .. string.format("%.2f", Xmult) .. ' +' .. chips
                elseif Xmult > 1 then
                    result.message = 'X' .. string.format("%.2f", Xmult)
                elseif chips > 0 then
                    result.message = '+' .. chips .. ' Chips'
                end
                result.colour = G.C.MULT
                if next(result) then
                    return result
                end
            end
        end
    end
}
