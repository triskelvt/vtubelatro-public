SMODS.Atlas({
    key = "flaers_ace",
    path = "flaer_card.png",
    px = 71,
    py = 95
})
SMODS.Joker {
    key = 'flaers_ace',
    config = { is_vtuber = true, extra = { mult = 0, mult_mod = 5, odds = 5 } },
    pos = { x = 0, y = 0 },
    rarity = 2,
    cost = 6,
    atlas = 'flaers_ace',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_mod, card.ability.extra.odds, card.ability.extra.mult } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Flaer', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Model by: Meezie & Akizone', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 14 then
                local seals = { 'Red', 'Blue', 'Gold', 'Purple' }
                if not context.other_card.seal and pseudorandom('flaers_ace_seal') < G.GAME.probabilities.normal / card.ability.extra.odds then
                    local chosen_seal = seals[math.random(#seals)]
                    context.other_card:set_seal(chosen_seal, true)
                end
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_mod
                return {
                    mult = card.ability.extra.mult_mod,
                    message = '+' .. card.ability.extra.mult_mod .. ' Mult',
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    mult = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.mult .. ' Mult',
                    colour = G.C.MULT
                }
            end
        end
    end
}
