SMODS.Joker{ --Sylvnite
    key = "sylvnite",
    config = {
        extra = {
            base_denominator = 4,
            repetitions = 1,
            planetsToMake = 3,
            dollars = 3
        }
    },
    loc_txt = {
        ['name'] = 'Sylvnite',
        ['text'] = {
            [1] = '{C:attention}Red Seals{} have a {C:green}#1# in #2#{} chance to',
            [2] = 'activate the effects of other {C:attention}Seals{}',
            [3] = '{C:inactive}Chooses between all vanilla and Cryptid seals{}',
            [4] = '{C:inactive}Does not choose Red Seal{}'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 5,
        y = 5
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
        x = 6,
        y = 5
    },
    loc_vars = function(self, info_queue, card)
        local new_numerator, new_denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.base_denominator, 'sylvnite_roll') -- it is suggested to use an identifier so that effects that modify probabilities can target specific values
        return {vars = {new_numerator,new_denominator}}
    end,
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
            if (context.other_card:get_seal() == "Red") then
                if SMODS.pseudorandom_probability(card, 'seed', 1, card.ability.extra.base_denominator, 'sylvnite_roll') then
                local roll = pseudorandom("seed", 1, 5)
                    if roll == 1 then
                        --Azure Seal
                        local _planet = nil
                        for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                            if v.config.hand_type == G.GAME.last_hand_played then
                                _planet = v.key
                            end
                            end
                            for i = 1, card.ability.extra.planetsToMake do
						        SMODS.add_card{set = _planet, area = G.consumeables, edition = "e_negative"}
					        end
                            return{
                                message = "Azure Seal!",
                                color = G.C.BLUE
                            }
                    
                elseif roll == 2 then
                    --Green Seal
                    if G.consumeables.config.card_limit > #G.consumeables.cards then
						SMODS.add_card{set = "Code", area = G.consumeables}
					end
                    return{
                                message = "Green Seal!",
                                color = G.C.GREEN
                            }

                elseif roll == 3 then
                    --Blue Seal
                    for k, v in pairs(G.P_CENTER_POOLS.Planet) do
                            if v.config.hand_type == G.GAME.last_hand_played then
                                _planet = v.key
                            end
                        end
                        if _planet then
                            SMODS.add_card({ key = _planet })
                        end
                        return{
                                message = "Blue Seal!",
                                color = G.C.ETERNAL
                            }
                    elseif roll == 4 then
                        --Gold Seal
                        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                        return{
                            message  = "Gold Seal!",
                            color = G.C.GOLD,
                            dollars = card.ability.extra.dollars,
                        }
                    elseif roll == 5 then
                        --Purple Seal
                        SMODS.add_card({ set = 'Tarot' })
                        return{
                                message = "Purple Seal!",
                                color = G.C.PURPLE
                            }
                    end
                end
            end
        end
    end
}