SMODS.Atlas({
    key = "mimi_seal",
    path = "mimi_seal.png",
    px = 71,
    py = 95
})

SMODS.Seal {
    key = 'mimi_seal',
    atlas = 'mimi_seal',
    pos = { x = 0, y = 0 },
    config = { extra = { money = 1, chance = 4 } },
    badge_colour = HEX('e58b74'),

    loc_vars = function(self, info_queue, card)
        local money = 1
        if card and card.ability and card.ability.mimi_money then
            money = card.ability.mimi_money
        end
        return { vars = { money, (G.GAME and G.GAME.probabilities.normal or 1) } }
    end,

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if not card.ability.mimi_money then card.ability.mimi_money = self.config.extra.money end

            local current_money = card.ability.mimi_money
            card.ability.mimi_money = card.ability.mimi_money + 1

            ease_dollars(current_money)

            if pseudorandom('mimi_break') < G.GAME.probabilities.normal / self.config.extra.chance then
                card.destroyed = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card.shattered = true
                        card:start_dissolve()
                        return true
                    end
                }))
                return {
                    message = 'Broken!',
                    colour = G.C.RED
                }
            else
                return {
                    message = '$' .. current_money,
                    colour = G.C.MONEY
                }
            end
        end
    end
}
