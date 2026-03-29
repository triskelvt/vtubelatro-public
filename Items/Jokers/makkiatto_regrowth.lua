SMODS.Atlas({
    key = "makkiatto_regrowth",
    path = "makkiatto_regrowth.png",
    px = 71,
    py = 95
})

SMODS.Joker {
    key = 'makkiatto_regrowth',
    config = { is_vtuber = true, extra = { mult = 0, mult_gain = 4 } },
    pos = { x = 0, y = 0 },
    rarity = 3,
    cost = 9,
    atlas = 'makkiatto_regrowth',
    blueprint_compat = false,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    effect = nil,
    soul_pos = nil,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult_gain, card.ability.extra.mult } }
    end,
    set_badges = function(self, card, badges)
        badges[#badges + 1] = create_badge('Vtuber: Makkiatto', HEX('ff006e'), G.C.white, 1.2)
        badges[#badges + 1] = create_badge('Image by: Jellunaa', HEX('3a86ff'), G.C.white, 1.2)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if card.ability.extra.mult > 0 then
                return {
                    mult_mod = card.ability.extra.mult,
                    message = '+' .. card.ability.extra.mult .. ' Mult',
                    colour = G.C.MULT
                }
            end
        end
    end
}

local function makkiatto_trigger(self)
    if self.base and self.base.suit and G.jokers then
        for _, joker_card in ipairs(G.jokers.cards) do
            if joker_card.config.center and joker_card.config.center.key == 'j_vtb_makkiatto_regrowth' then
                joker_card.ability.extra.mult = joker_card.ability.extra.mult + joker_card.ability.extra.mult_gain
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(joker_card, 'extra', nil, nil, nil,
                            { message = 'Regrowth!', colour = G.C.GREEN })
                        return true
                    end
                }))
            end
        end
    end
end

local orig_shatter = Card.shatter
Card.shatter = function(self, ...)
    makkiatto_trigger(self)
    self._makkiatto_shattered = true
    return orig_shatter(self, ...)
end

local orig_start_dissolve = Card.start_dissolve
Card.start_dissolve = function(self, ...)
    if not self._makkiatto_shattered then
        makkiatto_trigger(self)
    end
    self._makkiatto_shattered = nil
    return orig_start_dissolve(self, ...)
end