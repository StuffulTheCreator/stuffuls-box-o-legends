SMODS.Joker{ --Planet Jacker
    key = "planetjacker",
    config = {
        extra = {
            repetitions = 2,
            levels = 1
        }
    },
    loc_txt = {
        ['name'] = 'Planet Jacker',
        ['text'] = {
            [1] = 'Whenever a {C:planet}Planet{} card is used',
            [2] = 'level up {C:attention}#1#{} random hands'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 0,
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
        x = 1,
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
    loc_vars = function(self,info_queue,center)
        return{
            vars = {
                center.ability.extra.repetitions
            }
        }
    end,
    calculate = function(self, card, context)
        if context.using_consumeable  then
            if context.consumeable and context.consumeable.ability.set == 'Planet' then
                for i = 1, card.ability.extra.repetitions do
              local available_hands = {}
        for hand, value in pairs(G.GAME.hands) do
          if value.visible and value.level >= to_big(1) then
            table.insert(available_hands, hand)
          end
        end
        local target_hand = #available_hands > 0 and pseudorandom_element(available_hands, pseudoseed('level_up_hand')) or "High Card"
                        SMODS.calculate_effect({level_up = card.ability.extra.levels,
      level_up_hand = target_hand}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_level_up_ex'), colour = G.C.RED})
          end
            end
        end
    end
}