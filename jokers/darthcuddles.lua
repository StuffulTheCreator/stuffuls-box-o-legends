SMODS.Joker{ --Darth Cuddles
    key = "darthcuddles",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Darth Cuddles',
        ['text'] = {
            [1] = 'Instead of {C:attention}5{} triggers, it takes',
            [2] = '{C:attention}3{} triggers to trigger {C:attention}Seals of the',
            [3] = 'Empire{}',
            [4] = "{C:inactive}Does not stack{}"
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
        y = 1
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
        x = 1,
        y = 1
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end
}