SMODS.Joker{ --Freindy
    key = "freindy",
    config = {
        extra = {
            FreindyMult = 1,
            FreindyMultGain = 0.1
        }
    },
    loc_txt = {
        ['name'] = 'Freindy',
        ['text'] = {
            [1] = 'Adds {X:red,C:white} X #1# {} Mult for every',
            [2] = 'unique rank in played hand',
            [3] = '{C:inactive}Currently {X:red,C:white} X #2# {}{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        x = 1,
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
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.FreindyMultGain,
                center.ability.extra.FreindyMult
            }
        }
    end,
    calculate = function(self,card,context)
            if context.joker_main then
                local unique_ranks = {}
                for _, scored_card in ipairs(context.full_hand) do
                    unique_ranks[scored_card.base.value] = true
                end

            local unique_count = 0
            for _ in pairs(unique_ranks) do
                unique_count = unique_count + 1
            end

            local mult_gain = unique_count * card.ability.extra.FreindyMultGain
            card.ability.extra.FreindyMult = card.ability.extra.FreindyMult + mult_gain

            return {
                message = "X" .. card.ability.extra.FreindyMult,
                colour = G.C.MULT,
                x_mult = card.ability.extra.FreindyMult
            }
        end
    end
}