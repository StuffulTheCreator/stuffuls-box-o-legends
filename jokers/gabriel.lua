SMODS.Joker{ --Gabriel
    key = "gabriel",
    config = {
        extra = {
            retrigs = 1
        }
    },
    loc_txt = {
        ['name'] = 'Gabriel',
        ['text'] = {
            [1] = 'Retrigger all Light Cards'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
        y = 2
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
        y = 2
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
        if context.repetition and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card,"m_cry_light") then
                return {
                    repetitions = card.ability.extra.retrigs,
                }
            end
        end
    end
}