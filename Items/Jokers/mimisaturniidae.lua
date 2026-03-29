SMODS.Atlas({
    key = "mimi_card",
    path = "mimi_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'mimi_card',
    config = { is_vtuber = true, extra = { x_mult_gain = 0.25 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'mimi_card',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,

    loc_vars = function(self, info_queue, card)
        local count = 0
        if G.playing_cards then
            for _, v in pairs(G.playing_cards) do
                if v.seal == 'vtb_mimi_seal' then count = count + 1 end
            end
        end
        local gain = self.config.extra.x_mult_gain
        return { vars = { gain, 1 + (count * gain) } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Mimi', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Model by: Biotari', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            for _, v in pairs(G.playing_cards) do
                if v.seal == 'vtb_mimi_seal' then count = count + 1 end
            end

            local total_x_mult = 1 + (count * self.config.extra.x_mult_gain)

            if total_x_mult > 1 then
                return {
                    message = 'X' .. total_x_mult,
                    Xmult_mod = total_x_mult
                }
            end
        end
    end
}
