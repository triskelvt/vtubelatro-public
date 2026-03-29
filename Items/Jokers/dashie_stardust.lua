SMODS.Atlas({
    key = "dashie_stardust",
    path = "dashie_card.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'dashie_stardust',
    config = { is_vtuber = true, extra = { xmult_per_edition = 0.5 } },
    pos = { x = 0, y = 0 },
    rarity = 4,
    cost = 20,
    atlas = 'dashie_stardust',
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    soul_pos = { x = 1, y = 0 },

    loc_vars = function(self, info_queue, card)
        local edition_count = 0
        for _, area in ipairs({ G.hand, G.play, G.deck, G.discard }) do
            if area and area.cards then
                for _, c in ipairs(area.cards) do
                    if c.edition and c.edition.key == 'e_vtb_hyped' then edition_count = edition_count + 1 end
                end
            end
        end
        local total = 1 + (card.ability.extra.xmult_per_edition * edition_count)
        return { vars = { card.ability.extra.xmult_per_edition, string.format("%.1f", total) } }
    end,

    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Dashie', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: Kleimann', HEX('3a86ff'), G.C.white, 1.2)
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local edition_count = 0
            for _, area in ipairs({ G.hand, G.play, G.deck, G.discard }) do
                if area and area.cards then
                    for _, c in ipairs(area.cards) do
                        if c.edition and c.edition.key == 'e_vtb_hyped' then edition_count = edition_count + 1 end
                    end
                end
            end
            if edition_count > 0 then
                local total = 1 + (card.ability.extra.xmult_per_edition * edition_count)
                return {
                    Xmult_mod = total,
                    message = 'X' .. string.format("%.1f", total),
                    colour = G.C.MULT
                }
            end
        end
    end
}
