SMODS.Atlas({
    key = "bloody_aki",
    path = "aki_card.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'bloody_aki',
    config = { is_vtuber = true, extra = { mult = 0, mult_mod = 2, money = 5, seal_odds = 2, destroy_odds = 4 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'bloody_aki',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        local current_mult = 0
        if card and card.ability and card.ability.extra then
            current_mult = card.ability.extra.mult
        elseif self.config and self.config.extra then
            current_mult = self.config.extra.mult
        end
        return { vars = { current_mult } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Aki', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Model by: ???', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit('Hearts') and context.other_card:get_id() == 14 then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                return {
                    extra = { focus = card, message = 'Up!' },
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
        if context.joker_main then
            local hand_name = context.scoring_name or ''
            local is_flush_hand = hand_name:find('Flush') ~= nil
            if is_flush_hand then
                local is_hearts = true
                for i = 1, #context.scoring_hand do
                    if not context.scoring_hand[i]:is_suit('Hearts') then
                        is_hearts = false
                        break
                    end
                end
                if is_hearts then
                    ease_dollars(card.ability.extra.money)
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            attention_text({
                                text = '$' .. card.ability.extra.money,
                                scale = 1.3,
                                hold = 1.4,
                                color = G.C.MONEY,
                                align = 'cm',
                                offset = { x = 0, y = -2.7 },
                                nodes = { G.play }
                            })
                            return true
                        end
                    }))
                end
            end
            if card.ability.extra.mult > 0 then
                return {
                    mult_mod = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.mult .. ' Mult'
                }
            end
        end
    end
}
