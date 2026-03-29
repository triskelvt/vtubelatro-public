SMODS.Atlas({
    key = "smugalana_duality",
    path = "smugalana_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'smugalana_duality',
    config = { is_vtuber = true, extra = { state = 'frost', chips = 8, mult = 5 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'smugalana_duality',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(_, _, card)
        local state = card.ability.extra.state
        local state_label = state == 'frost' and 'Frost' or 'Fire'
        return { vars = { state_label, card.ability.extra.chips, card.ability.extra.mult } }
    end,
    set_badges = function(_, _, badges)
        badges[#badges + 1] = create_badge('Vtuber: SmugAlana', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: akAgi', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(_, card, context)
        local state = card.ability.extra.state

        if context.individual and context.cardarea == G.play and state == 'frost' then
            local suit = context.other_card
            if suit:is_suit('Spades') or suit:is_suit('Clubs') then
                return {
                    chips = card.ability.extra.chips,
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                    colour = G.C.CHIPS
                }
            end
        end

        if context.joker_main and state == 'fire' then
            return {
                mult = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                colour = G.C.MULT
            }
        end

        if context.end_of_round and context.main_eval and not context.blueprint then
            local new_state = state == 'frost' and 'fire' or 'frost'
            card.ability.extra.state = new_state
            local label = new_state == 'frost' and 'Frost!' or 'Fire!'
            local col = new_state == 'frost' and G.C.CHIPS or G.C.MULT
            return {
                message = label,
                colour = col,
                card = card
            }
        end
    end
}
