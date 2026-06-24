--Main.lua
SMODS.Atlas({
    key = "modicon", 
    path = "ModIcon.png", 
    px = 34,
    py = 34,
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "balatro", 
    path = "balatro.png", 
    px = 333,
    py = 216,
    prefix_config = { key = false },
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomJokers", 
    path = "CustomJokers.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})

SMODS.Atlas({
    key = "CustomConsumables", 
    path = "CustomConsumables.png", 
    px = 71,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
})


SMODS.Atlas({
    key = "CustomSeals", 
    path = "CustomSeals.png", 
    px = 62,
    py = 95, 
    atlas_table = "ASSET_ATLAS"
}):register()

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
    post_trigger = true,
    quantum_enhancements = true,
    cardareas = {
        discard = true,
        deck = true
    }
}

local NFS = require("nativefs")
to_big = to_big or function(a) return a end
lenient_bignum = lenient_bignum or function(a) return a end

local jokerIndexList = {5,9,6,16,24,11,33,30,14,13,7,17,23,18,19,8,10,2,28,29,20,26,27,22,3,31,32,1,12,15,21,25,4}

local function load_jokers_folder()
    local mod_path = SMODS.current_mod.path
    local jokers_path = mod_path .. "/jokers"
    local files = NFS.getDirectoryItemsInfo(jokers_path)
    for i = 1, #jokerIndexList do
        local file_name = files[jokerIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("jokers/" .. file_name))()
        end
    end
end


local consumableIndexList = {2,3,1}

local function load_consumables_folder()
    local mod_path = SMODS.current_mod.path
    local consumables_path = mod_path .. "/consumables"
    local files = NFS.getDirectoryItemsInfo(consumables_path)
    local set_file_number = #files + 1
    for i = 1, #files do
        if files[i].name == "sets.lua" then
            assert(SMODS.load_file("consumables/sets.lua"))()
            set_file_number = i
        end
    end    
    for i = 1, #consumableIndexList do
        local j = consumableIndexList[i]
        if j >= set_file_number then 
            j = j + 1
        end
        local file_name = files[j].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("consumables/" .. file_name))()
        end
    end
end



local sealIndexList = {3,1,2}

local function load_seals_folder()
    local mod_path = SMODS.current_mod.path
    local seals_path = mod_path .. "/seals"
    local files = NFS.getDirectoryItemsInfo(seals_path)
    for i = 1, #sealIndexList do
        local file_name = files[sealIndexList[i]].name
        if file_name:sub(-4) == ".lua" then
            assert(SMODS.load_file("seals/" .. file_name))()
        end
    end
end

load_jokers_folder()
load_consumables_folder()
load_seals_folder()

SMODS.ObjectType({
    key = "stuffuls_stuffuls_jokers",
    cards = {
        ["j_stuffuls_bloaty"] = true,
        ["j_stuffuls_clembrane"] = true,
        ["j_stuffuls_climbey"] = true,
        ["j_stuffuls_computer"] = true,
        ["j_stuffuls_cutietootie"] = true,
        ["j_stuffuls_darthcuddles"] = true,
        ["j_stuffuls_dib"] = true,
        ["j_stuffuls_doomslayer"] = true,
        ["j_stuffuls_firstorder"] = true,
        ["j_stuffuls_foodio3000"] = true,
        ["j_stuffuls_freindy"] = true,
        ["j_stuffuls_gabriel"] = true,
        ["j_stuffuls_gaz"] = true,
        ["j_stuffuls_gir"] = true,
        ["j_stuffuls_immortalsnail"] = true,
        ["j_stuffuls_kylokiss"] = true,
        ["j_stuffuls_minimoose"] = true,
        ["j_stuffuls_minosprime"] = true,
        ["j_stuffuls_newjoker2"] = true,
        ["j_stuffuls_nharghok"] = true,
        ["j_stuffuls_planetjacker"] = true,
        ["j_stuffuls_poopdawg"] = true,
        ["j_stuffuls_profmembrane"] = true,
        ["j_stuffuls_reddy"] = true,
        ["j_stuffuls_sir"] = true,
        ["j_stuffuls_spacebaby"] = true,
        ["j_stuffuls_stardonkey"] = true,
        ["j_stuffuls_swordsmachine"] = true,
        ["j_stuffuls_sylvnite"] = true,
        ["j_stuffuls_tak"] = true,
        ["j_stuffuls_v1"] = true,
        ["j_stuffuls_v2"] = true,
        ["j_stuffuls_zim"] = true
    },
})
