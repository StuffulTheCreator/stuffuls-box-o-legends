SMODS.Joker{ --Immortal Snail
    key = "immortalsnail",
    config = {
        extra = {
            retriggers = 1
        }
    },
    loc_txt = {
        ['name'] = 'Immortal Snail',
        ['text'] = {
            [1] = 'Convert all cards played to Eternal',
            [2] = 'Retrigger all Eternal cards once.'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 8,
        y = 2
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    pools = { ["stuffuls_stuffuls_jokers"] = true },
    soul_pos = {
        x = 9,
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
        if context.before then
            repetition = true
        end
        if context.individual and context.cardarea == G.play  then
            context.other_card.ability.eternal = true
            context.other_card:juice_up()
        end
        if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
            if context.other_card.ability.eternal == true then
                return {
                    message = localize("k_again_ex"),
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            end
        end
        if context.repetition and context.cardarea == G.play then
            if context.other_card.ability.eternal == true then
                return {
                    message = localize("k_again_ex"),
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            end
    end
end
}