SMODS.Joker{ --Dib
    key = "dib",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Dib',
        ['text'] = {
            [1] = '{C:attention}Convert{} all {C:attention}Irken Seals{} in hand',
            [2] = 'and played to {C:attention}Science Seals{}',
            [3] = '{C:attention}Science Seals{} now have a {C:green}1 in 3{} chance',
            [4] = 'of triggering'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 2,
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
        x = 3,
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
        if context.individual and context.cardarea == G.play  and not context.blueprint then
            if context.other_card.seal ~= nil then
                context.other_card:set_seal("stuffuls_scienceseal", true)
                return {
                    message = "SCIENCE!"
                }
            end
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round  and not context.blueprint then
            if context.other_card.seal == "Stuffuls_irkenseal" then
                return {
                    func = function()
                context.other_card:set_seal("stuffuls_scienceseal", true)
                    end,
                    message = "ZIM!"
                }
            end
        end
    end
}