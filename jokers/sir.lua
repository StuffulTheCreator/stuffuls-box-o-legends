SMODS.Joker{ --SIR
    key = "sir",
    config = {
        extra = {
            Xmult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'SIR',
        ['text'] = {
            [1] = '{C:cry_code}Code{} cards held in consumable slot',
            [2] = 'grant {X:mult,C:white} #1#X {} Mult',
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 4
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
        y = 4
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
        return{
            vars = {
                card.ability.extra.Xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.other_consumeable and context.other_consumeable.ability.set == 'Code' then
            return {
                x_mult = card.ability.extra.Xmult,
                message_card = context.other_consumeable
            }
        end   
        end
}