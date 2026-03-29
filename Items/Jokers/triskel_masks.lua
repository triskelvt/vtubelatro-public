SMODS.Atlas({
    key = "triskel_card",
    path = "triskel_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'triskel_masks',
    config = { is_vtuber = true, extra = {
        mask = 0,
        chips = 35,
        xmult = 1.5,
        jester_min = 1,
        jester_max = 20,
    } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'triskel_card',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        local mask_names = { 'Jester', 'Plague Doctor', 'Demon' }
        return {
            vars = {
                card.ability.extra.jester_min,
                card.ability.extra.jester_max,
                card.ability.extra.chips,
                card.ability.extra.xmult,
                mask_names[card.ability.extra.mask + 1],
            }
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Triskel', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: lynxlab', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local mask = card.ability.extra.mask
            card.ability.extra.mask = (mask + 1) % 3

            if mask == 0 then
                local rand_mult = math.random(
                    card.ability.extra.jester_min,
                    card.ability.extra.jester_max
                )
                return {
                    mult_mod = rand_mult,
                    message = '+' .. rand_mult .. ' Mult',
                    colour = G.C.MULT
                }
            elseif mask == 1 then
                return {
                    chips = card.ability.extra.chips,
                    message = '+' .. card.ability.extra.chips .. ' Chips',
                    colour = G.C.CHIPS
                }
            else
                if G.GAME.dollars >= 1 then
                    ease_dollars(-1)
                end
                return {
                    Xmult_mod = card.ability.extra.xmult,
                    message = 'X' .. card.ability.extra.xmult,
                    colour = G.C.MULT
                }
            end
        end
    end
}
