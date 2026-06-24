SMODS.Joker{ --V1
    key = "v1",
    config = {
        extra = {
            odds = 2,
            dollars = 7
        }
    },
    loc_txt = {
        ['name'] = 'V1',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance for scored {C:attention}7s{} to',
            [2] = 'earn {C:money}7${}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 9,
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
        x = 0,
        y = 6
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,
    loc_vars = function(self,info_queue,card)
        local num, denom = SMODS.get_probability_vars(card,1,card.ability.extra.odds,"j_stuffuls_v1")
        return{
            vars = {
                num,
                denom
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if context.other_card:get_id() == 7 then
                if SMODS.pseudorandom_probability(card, 'group_0_29823740', 1, card.ability.extra.odds, 'j_stuffuls_v1', false) then
                    SMODS.calculate_effect({dollars = card.ability.extra.dollars}, card)
                end
            end
        end
    end
}