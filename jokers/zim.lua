SMODS.Joker{ --Zim
    key = "zim",
    config = {
        extra = {
            retrigs = 1
        }
    },
    loc_txt = {
        ['name'] = 'Zim',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} all Irken Seals {C:attention}#1#{} time',
            [2] = 'that are {C:attention}in hand{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 3,
        y = 6
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
        x = 4,
        y = 6
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.retrigs
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
    calculate = function(self,card,context)
        if context.main_scoring and context.cardarea == G.hand then
            repetition = true
        end
        if context.cardarea == G.hand and context.repetition then
            if playing_card.seal == "stuffuls_irkenseal" then
                return{repetitions = card.ability.extra.retrigs}
            end
        end
    end
}