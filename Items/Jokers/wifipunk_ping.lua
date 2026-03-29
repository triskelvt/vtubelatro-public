SMODS.Atlas({
    key = "wifipunk_ping",
    path = "wifipunk_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'wifipunk_ping',
    config = { is_vtuber = true, extra = {
        chips = 15,
        last_hand = '',
    } },
    pos = { x = 0, y = 0 },
    rarity = 1,
    cost = 4,
    atlas = 'wifipunk_ping',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.last_hand ~= '' and card.ability.extra.last_hand or 'None',
            }
        }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: WiFiPunk', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: Natsuki Snow', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local current = context.scoring_name
            local last = card.ability.extra.last_hand
            card.ability.extra.last_hand = current
            if last ~= '' and last == current then
                return {
                    chips = card.ability.extra.chips,
                    message = '+' .. card.ability.extra.chips .. ' Chips',
                    colour = G.C.CHIPS
                }
            end
        end

        if context.end_of_round and context.main_eval then
            card.ability.extra.last_hand = ''
        end
    end
}
