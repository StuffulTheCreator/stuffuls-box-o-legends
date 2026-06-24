SMODS.Joker{ --Bloaty
    key = "bloaty",
    config = {
        extra = {
            bloatyMult = 1,
            bloatyMultGain = 1
        }
    },
    loc_txt = {
        ['name'] = 'Bloaty',
        ['text'] = {
            [1] = 'This Joker gains {X:red,C:white}X1{} Mult every time a',
            [2] = 'Food Joker is sold.',
            [3] = '{C:inactive}Currently {X:mult,C:white}x #1# {} Mult{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        x = 1,
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
        
        return {vars = {card.ability.extra.bloatyMult}}
    end,

    calculate = function(self, card, context)
        if context.selling_card then
            if context.card.config.center.pools and context.card:has_attribute("food") then
                card.ability.extra.bloatyMult = card.ability.extra.bloatyMult + card.ability.extra.bloatyMultGain
                return {
                    message = "Eaten!",
                    color = G.C.RED
                }
            end
        end
    end
}