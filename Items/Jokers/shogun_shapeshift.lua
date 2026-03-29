SMODS.Atlas({
    key = "shogun_shapeshift",
    path = "shogun_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'shogun_shapeshift',
    config = { is_vtuber = true, extra = {} },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 8,
    atlas = 'shogun_shapeshift',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = false,
    discovered = false,
    effect = nil,
    soul_pos = nil,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: IshogunGamer', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: IshogunGamer', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.setting_blind then
            local edition_pool = {}
            for k, v in pairs(G.P_CENTERS) do
                if v.set == 'Edition' and k ~= 'e_negative' and k ~= 'e_base' then
                    edition_pool[#edition_pool + 1] = k:sub(3)
                end
            end
            if #edition_pool > 0 then
                local chosen = edition_pool[math.random(#edition_pool)]
                card:set_edition({ [chosen] = true }, true, true)
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = 'Shift!',
                    colour = G.C.DARK_EDITION,
                    focus = card,
                })
            end
        end

        if context.end_of_round and context.main_eval then
            card:set_edition(nil, true, true)
        end
    end
}
