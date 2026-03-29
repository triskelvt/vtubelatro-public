local debut_shader = {
    key = 'debut',
    path = 'debut.fs',
}

local debut = {
    key = 'debut',
    in_shop = true,
    weight = 3,
    extra_cost = 4,
    discovered = true,
    unlocked = true,
    shader = 'debut',
    calculate = function(self, card, context)
        if context.pre_joker or (context.main_scoring and context.cardarea == G.play) then
            return {
                chips = -5,
                mult = 5,
                message = '-5C +5M',
                colour = G.C.MULT
            }
        end
    end
}

SMODS.Shader(debut_shader)
SMODS.Edition(debut)
