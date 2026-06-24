SMODS.Joker{ --Foodio 3000
    key = "foodio3000",
    config = {
        extra = {
            Food = 0,
            ignore = 0
        }
    },
    loc_txt = {
        ['name'] = 'Foodio 3000',
        ['text'] = {
            [1] = 'Create a random {C:dark_edition}Negative{} Food Joker',
            [2] = 'at the end of a shop'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
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
        x = 9,
        y = 1
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.ending_shop then
            SMODS.add_card{set = "Food",area = G.jokers, edition = "e_negative"}
                return{
                    message = "Cooked!",
                    color = G.C.RED
                }
        end      
    end
    
}