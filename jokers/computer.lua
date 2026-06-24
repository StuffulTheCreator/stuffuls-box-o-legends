SMODS.Joker{ --Computer
    key = "computer",
    config = {
        extra = {
            odds = 4,
            n = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'Computer',
        ['text'] = {
            [1] = '{C:cry_code}Code{} cards have a {C:green}#1# in #2#{} chance of',
            [2] = 'making a {C:dark_edition}Negative{}',
            [3] = 'random consumable when used'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
        y = 0
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
        y = 0
    },
    in_pool = function(self, args)
          return (
          not args 
          or args.source ~= 'sho' 
          or args.source == 'buf' or args.source == 'jud' or args.source == 'rif' or args.source == 'rta' or args.source == 'sou' or args.source == 'uta' or args.source == 'wra'
          )
          and true
      end,
    loc_vars = function(self, info_queue, card)
		local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "j_stuffuls_computer")
		return {
			vars = {
				num,
				denom,
			},
		}
	end,
    calculate = function(self, card, context)
        if context.using_consumeable and context.consumeable.ability.set == "Code" then
                if SMODS.pseudorandom_probability(card, 'computerplayerwins', 1, card.ability.extra.odds, 'j_stuffuls_computer', false) then
                SMODS.add_card{set = "Consumeables", area = G.consumeables, edition = "e_negative"}
                    return{
                        message = "Okay, fine",
                    }    
                end 
        end
    end
}