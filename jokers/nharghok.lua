SMODS.Joker{ --Nhar Ghok
    key = "nharghok",
    config = {
        extra = {
            repetitions = 3,
            xmult = 2,
            xchips = 2
        }
    },
    loc_txt = {
        ['name'] = 'Nhar Ghok',
        ['text'] = {
            [1] = 'When bought, create 3 Negative Space Babies',
            [2] = 'Space Babies give',
            [3] = '{X:chips,C:white} x #2#{} Chips {X:mult,C:white} x #1#{} Mult'
        },
    },
    pos = {
        x = 8,
        y = 3
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
        x = 9,
        y = 3
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.xmult,
                center.ability.extra.xchips,
            }
        }
    end,

    calculate = function(self, card, context)             
            if context.other_joker and context.other_joker.config.center.key == "j_stuffuls_spacebaby" then
                return{
                    xmult = card.ability.extra.xmult,
                    xchips = card.ability.extra.xchips
                }
            end
    end,
    add_to_deck = function(self,card,from_debuff)
            for i = 1, card.ability.extra.repetitions do
                SMODS.add_card{key = "j_stuffuls_spacebaby", area = G.jokers, edition = "e_negative"}
                end
        end
}