SMODS.Joker{ --Star Donkey
    key = "stardonkey",
    config = {
        extra = {
            base_denominator = 2
        }
    },
    loc_txt = {
        ['name'] = 'Star Donkey',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance of giving a {C:dark_edition}Negative{} {C:attention}Sol{}',
            [2] = 'whenever a {C:planet}Planet{} card is used',
            [3] = '{C:inactive}excluding Sol{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 1,
        y = 5
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["stuffuls_stuffuls_jokers"] = true },
    soul_pos = {
        x = 2,
        y = 5
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.base_denominator, 'donkey_roll')
        return {vars = {new_numerator,new_denominator}}
    end,
    calculate = function(self, card, context)
        if (context.using_consumeable and context.consumeable.ability.set == 'Planet') and not (context.consumeable.config.center_key == 'c_cry_sunplanet') then
            if SMODS.pseudorandom_probability(card, 'donkishness', 1, card.ability.extra.base_denominator, 'donkey_roll') then
                SMODS.add_card({ set = 'Planet', edition = 'e_negative', key = 'c_cry_sunplanet'}) 
                return{
                    message = "Summoned"
                }
            end
        end
    end
}