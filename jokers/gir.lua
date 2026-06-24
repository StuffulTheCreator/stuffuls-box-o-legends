SMODS.Joker{ --GIR
    key = "gir",
    config = {
        extra = {
            
            odds = 3,
            n = 0,
            y = 0
        }
    },
    loc_txt = {
        ['name'] = 'GIR',
        ['text'] = {
            [1] = '{C:green}#1# in #2#{} chance of granting a {C:dark_edition}Negative{}',
            [2] = '{C:cry_code}Code{} card when opening a booster pack'
        },
        ['unlock'] = {
            [1] = 'Unlocked by default.'
        }
    },
    pos = {
        x = 6,
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
        x = 7,
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
    loc_vars = function(self, info_queue, card)
		local num, denom = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, "j_stuffuls_gir")
		return {
			vars = {
				num,
				denom,
			},
		}
	end,
    calculate = function(self, card, context)
        if context.open_booster  then
            if true then
                if SMODS.pseudorandom_probability(card, 'group_0_d146b55b', 1, card.ability.extra.odds, 'j_stuffuls_gir', false) then
                    SMODS.add_card{set = 'Code', edition = 'e_negative', soulable = true,}
                end
            end
        end
    end
}