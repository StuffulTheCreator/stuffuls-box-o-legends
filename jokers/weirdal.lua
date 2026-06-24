SMODS.Joker{ --Weird Al
    key = "weirdal",
    config = {
        extra = {
            play_size = 3,
            play_size2 = 3
        }
    },
    loc_txt = {
        ['name'] = 'Weird Al',
        ['text'] = {
            [1] = '{C:attention}Randomizes{} suits and ranks of',
            [2] = 'cards scored.',
            [3] = '{C:attention}+3{} card selection limit'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 3
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
        y = 3
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
            --Script done by Sigma(the greek letter)
                    for i, c in ipairs(G.play.cards) do
                    local _card = G.play.cards[i]

                    local rank = pseudorandom_element(SMODS.Ranks, pseudoseed('rankedmatch')).key -- get a random rank
                    local suit = pseudorandom_element(SMODS.Suits, pseudoseed('suityourself')).key -- get a random suit

                    SMODS.change_base(_card, suit, rank)
        end
                
        
        if context.selling_self  and not context.blueprint then
                return {
                    func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.play_size).." Play Size", colour = G.C.RED})
                SMODS.change_play_limit(-card.ability.extra.play_size)
                return true
            end,
                    extra = {
                        func = function()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "-"..tostring(card.ability.extra.play_size).." Play Size", colour = G.C.RED})
                SMODS.change_discard_limit(-card.ability.extra.play_size)
                return true
            end,
                        colour = G.C.BLUE
                        }
                }
        end
    end
    end,
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(3)
        SMODS.change_discard_limit(3)
    end,

    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-3)
        SMODS.change_discard_limit(-3)
    end

}