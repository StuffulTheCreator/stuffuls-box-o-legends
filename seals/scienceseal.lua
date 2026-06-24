SMODS.Seal {
    key = 'scienceseal',
    pos = { x = 1, y = 0 },
    config = {
        extra = {
        }
    },
    badge_colour = HEX('45B7D1'),
   loc_txt = {
        name = 'Science Seal',
        label = 'Science Seal',
        text = {
        [1] = '{C:green}1 in 4 chance {}of granting a random',
        [2] = 'Negative {C:attention}consumable{} when scored',
        [3] = "{C:inactive} This chance cannot be increased{}"
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
        if next(SMODS.find_card("j_stuffuls_dib")) then
            local roll = pseudorandom("seed",1,3)
            if roll == 3 then
                SMODS.add_card{set = "Consumeables", area = G.consumeables, edition = "e_negative"}
                return{
                    message = "SCIENCE!",
                    color = G.C.BLUE
                }    
                end
        else
            local roll = pseudorandom("seed",1,4)
            if roll == 4 then
                SMODS.add_card{set = "Consumeables", area = G.consumeables, edition = "e_negative"}
                return{
                    message = "SCIENCE!",
                    color = G.C.BLUE
                }    
                end 
            end
        end
    end
}