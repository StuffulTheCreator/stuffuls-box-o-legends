SMODS.Seal {
    key = 'sealoftheempire',
    pos = { x = 2, y = 0 },
    config = {
        extra = {
            exp_mult_k = 1.5,
            exp_mult_n = 1.25,
            empireCountdown = 5,
        }
    },
    badge_colour = HEX('000000'),
   loc_txt = {
        name = 'Seal of the Empire',
        label = 'Seal of the Empire',
        text = {
        [1] = 'When this card is scored 5 times with this seal',
        [2] = 'in 1 hand, {X:dark_edition,C:white}^1.25{} Mult'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            if card.ability.seal.extra.empireCountdown == 0 then
            if next(SMODS.find_card("j_stuffuls_darthcuddles")) == true then
                card.ability.seal.extra.empireCountdown = 3
            else
                card.ability.seal.extra.empireCountdown = 5
            end
            if next(SMODS.find_card("j_stuffuls_kylokiss")) == true then
            return {
                emult = card.ability.seal.extra.exp_mult_k
            }
            else
            return {
                emult = card.ability.seal.extra.exp_mult_n
            }
            end
        end
        if context.main_scoring and context.cardarea == G.play then
            if card.seal == "stuffuls_sealoftheempire" then
                card.ability.seal.extra.empireCountdown = (card.ability.seal.extra.empireCountdown) - 1
                return{
                    message = "Remaining: " .. card.ability.seal.extra.empireCountdown
                }
            end
        end
         
        end
        if context.final_scoring_step then
            if next(SMODS.find_card("j_stuffuls_darthcuddles")) == true then
                card.ability.seal.extra.empireCountdown = 3
            else
                card.ability.seal.extra.empireCountdown = 5
            end
        end
    end
}