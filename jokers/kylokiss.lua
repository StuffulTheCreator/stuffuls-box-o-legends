SMODS.Joker{ --Kylo Kiss
    key = "kylokiss",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Kylo Kiss',
        ['text'] = {
            [1] = '{C:attention}Seals of the Empire{} grant {X:dark_edition,C:white}^1.5{} Mult',
            [2] = 'instead of {X:dark_edition,C:white}^1.25{} Mult',
            [3] = "{C:inactive}Does not stack{}"
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        x = 1,
        y = 3
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