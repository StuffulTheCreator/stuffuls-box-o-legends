SMODS.Joker{ --Gaz
    key = "gaz",
    config = {
        extra = {
            base_numerator = 1,
            gazMultGain = 1,
            gazMult = 1,
            sliceodds = 2,
            zaodds = 8,
            respect = 0
        }
    },
    loc_txt = {
        ['name'] = 'Gaz',
        ['text'] = {
            [1] = '{C:green}#2# in #3#{} chance of making a',
            [2] = '{C:dark_edition}Negative{} {C:attention}Pizza Slice{} at the end of a shop',
            [3] = '{C:green}#4# in #5#{} chance of making a {C:dark_edition}Negative{}',
            [4] = '{C:attention}Pizza {}at the end of a shop',
            [5] = 'When a {C:attention}Pizza Slice{} or {C:attention}Pizza{} is sold',
            [6] = 'this Joker gains {X:mult,C:white} x#6#{} Mult',
            [7] = '{C:inactive}Currently {X:mult,C:white}x#1#{}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 4,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["stuffuls_stuffuls_jokers"] = true },
    soul_pos = {
        x = 5,
        y = 2
    },

    loc_vars = function(self, info_queue, card)
        
        local base_numerator, base_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.sliceodds, 'j_stuffuls_gazslice')
        local base_numerator2, base_denominator2 = SMODS.get_probability_vars(card, 1, card.ability.extra.zaodds, 'j_stuffuls_gazza')
        return {vars = {card.ability.extra.gazMult, base_numerator, base_denominator, base_numerator2, base_denominator2, card.ability.extra.gazMultGain}}
    end,

    calculate = function(self, card, context)
        if context.ending_shop  then
            if SMODS.pseudorandom_probability(card,"iamseed",card.ability.extra.base_numerator,card.ability.extra.sliceodds,"stuf_gaz_slice_roll") then
                SMODS.add_card{key = "j_cry_pizza_slice",area = G.jokers, edition = "e_negative"}
                return{
                    message = "Ordered!",
                    color = G.C.RED
                }
            end
            if SMODS.pseudorandom_probability(card,"gotthatzainme",card.ability.extra.base_numerator,card.ability.extra.zaodds,"stuf_gaz_za_roll") then
                SMODS.add_card{key = "j_cry_pizza",area = G.jokers, edition = "e_negative"}
                return{
                    message = "Ordered!",
                    color = G.C.RED
                }
            end
        end
        if context.joker_main then
            return{
                xmult = card.ability.extra.gazMult
            }
        end
        if context.selling_card and not context.blueprint then
            if context.card.config.center.key == "j_cry_pizza_slice" then
                card.ability.extra.gazMult = card.ability.extra.gazMult + card.ability.extra.gazMultGain
                return{
                    message = "Eaten!",
                    color = G.C.RED
                }
            end
        end
    end

}