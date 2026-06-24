SMODS.Joker{ --Minimoose
    key = "minimoose",
    config = {
        extra = {
            Xmult = 2
        }
    },
    loc_txt = {
        ['name'] = 'Minimoose',
        ['text'] = {
            [1] = '{C:attention}Played{} 2,3,4,5 {C:attention}rank{} cards',
            [2] = 'gain {X:red,C:white} X#1# {} Mult when {C:attention}scored{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
        x = 3,
        y = 3
    },
    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.Xmult
            }
        }
    end,
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_id() == 2 or context.other_card:get_id() == 3 or context.other_card:get_id() == 4 or context.other_card:get_id() == 5) then
                return {
                    Xmult = card.ability.extra.Xmult
                }
            end
        end
    end
}