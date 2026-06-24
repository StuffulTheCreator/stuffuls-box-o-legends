SMODS.Joker{ --Reddy
    key = "reddy",
    config = {
        extra = {
            retrigs = 1
        }
    },
    loc_txt = {
        ['name'] = 'Reddy',
        ['text'] = {
            [1] = '{C:attention}Retrigger{} all {C:attention}Red{} Seals',
            [2] = 'an extra time'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        x = 7,
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

    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.hand then
            repetition = true
        end
        if context.cardarea == G.play and context.repetition then
            if (context.other_card:get_seal() == "Red") then
                return{repetitions = card.ability.extra.retrigs}
            end
        end
    end
}