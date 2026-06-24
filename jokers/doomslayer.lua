SMODS.Joker{ --Doom Slayer
    key = "doomslayer",
    config = {
        extra = {
            emult = 1.5
        }
    },
    loc_txt = {
        ['name'] = 'Doom Slayer',
        ['text'] = {
            [1] = '{C:attention}Jokers{} give {X:dark_edition,C:white}^#1#{} Mult during Boss Blinds'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 4,
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
        x = 5,
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
    loc_vars = function(self,info_queue,card)
        return{
            vars = {
                card.ability.extra.emult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.other_joker  then
            if G.GAME.blind.boss then
                return {
                    e_mult = card.ability.extra.emult
                }
            end
        end
    end
}