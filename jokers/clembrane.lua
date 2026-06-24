SMODS.Joker{ --Clembrane
    key = "clembrane",
    config = {
        extra = {
            odds = 3,
            repetitions = 1
        }
    },
    loc_txt = {
        ['name'] = 'Clembrane',
        ['text'] = {
            [1] = 'Converts all {C:attention}Science Seals{} in hand and played',
            [2] = 'to {C:attention}Irken Seals{} when hand is scoring',
            [3] = '{C:green}#1# in #2#{} chance to retrigger played Irken Seals'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 0
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
        x = 3,
        y = 0
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
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'j_stuffuls_clembrane')
        return {vars = {new_numerator,new_denominator}}
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play  then
            if context.other_card.seal == "Stuffuls_irkenseal" then
                if SMODS.pseudorandom_probability(card, 'group_0_4d537f72', 1, card.ability.extra.odds, 'j_stuffuls_clembrane', false) then
              return {repetitions = card.ability.extra.repetitions}
                        
          end
            end
        end
        if context.individual and context.cardarea == G.play  then
            if context.other_card.seal == "Stuffuls_scienceseal" then
                context.other_card:set_seal("stuffuls_irkenseal", true)
                return {
                    message = "Hur, durr!"
                }
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  then
            if context.other_card.seal == "Stuffuls_scienceseal" then
                return {
                    func = function()
                context.other_card:set_seal("stuffuls_irkenseal", true)
                    end,
                    message = "Hur, durr!"
                }
            end
        end
    end
}