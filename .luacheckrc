-- Global configuration
-----------------------

std = "luajit+minetest+supported_mods"

max_line_length = false

-- Ignore warnings that are not necessarily problematic,
-- as fixing those will only make it diffifult to update from upstream.
-- Ideally this should be fixed upstream and the warnings enabled again.
ignore = {
  "211", -- unused variable
  "212", -- unused argument
  "213", -- unused loop variable
  -- whitespace
  "611", -- line contains only whitespace
  "612", -- trailing whitespace
  "614", -- trailing whitespace in comment
  "621", -- inconsistent indentation
}

stds.minetest = {
  read_globals = {
    -- tables
    "minetest",
    "vector",
    -- utility functions
    "dump",
    "dump2",
    math = { fields = { "hypot", "sign", "factorial", "round" } },
    string = { fields = { "split", "trim" } },
    table = { fields = { "copy", "indexof" } },
    -- constructors
    "ItemStack",
    "PcgRandom",
    "PseudoRandom",
    "VoxelArea",
    "VoxelManip",
    -- legacy
    "core", -- alias of minetest
    "nodeupdate",
  },
}

-- Mods that are potentially supported but not included in Asuna.
-- The relevant code must be gated by `if minetest.get_modpath("...")` or similar.
-- Could be extracted from optional_depends, but in practice not all mods declare it.
stds.supported_mods = {
  read_globals = {
    "armor", -- From 3d_armor
    "awards",
    "bonemeal",
    "geodes_lib",
    "hunger_ng",
    "intllib",
    "lucky_block",
    "mcl_player",
    "stairsplus",
    "techage",
    "technic_cnc",
    "toolranks",
  },
}

-- Mods included in Asuna.
-- List generated with:
--   git grep -ho "^name =.*" | awk '{ sub("\r",""); print "  \"" $3 "\"," }' | sort
local mod_names = {
  "abdecor",
  "animalia",
  "asuna_core",
  "asuna_textures",
  "badland",
  "bakedclay",
  "bambooforest",
  "beautiflowers",
  "beds",
  "better_farming",
  "binoculars",
  "biomes",
  "boats",
  "bones",
  "bottles",
  "bucket",
  "bushes",
  "butterflies",
  "carts",
  "caverealms",
  "colorful_beds",
  "creative",
  "creatura",
  "default",
  "doors",
  "dorwinion",
  "dungeon_loot",
  "dye",
  "env_sounds",
  "ethereal",
  "farming",
  "ferns",
  "fire",
  "fireflies",
  "flowerpot",
  "flowers",
  "frost_land",
  "game_commands",
  "geodes",
  "give_initial_stuff",
  "herbs",
  "japaneseforest",
  "keys",
  "leafstride",
  "livingjungle",
  "lootchests",
  "lootchests_default",
  "map",
  "marinara",
  "mtg_craftguide",
  "music_api",
  "naturalbiomes",
  "nightshade",
  "plantlife_modpack",
  "player_api",
  "player_monoids",
  "pl_seaweed",
  "pl_sunflowers",
  "prairie",
  "screwdriver",
  "sethome",
  "sfinv",
  "sfinv_buttons",
  "show_wielded_item",
  "soup",
  "spawn",
  "stairs",
  "stamina",
  "terracotta",
  "tnt",
  "too_many_stones",
  "vessels",
  "walls",
  "weather",
  "wielded_light",
  "wool",
  "xpanes",
  "youngtrees",
}

-- Globals defined by Asuna.
-- Ideally this should be equal to mod_names + "asuna", but some mods define
-- additional globals, so we add them here.
globals = {
  "asuna",
  "abstract_bushes", -- from bushes
  "abstract_ferns", -- from ferns
  "abstract_youngtrees", -- from youngtrees
  "music", -- from music_api
  table.unpack(mod_names)
}

-- Mod-specific configuration
-----------------------------

-- Import existing .luacheckrc files
local mods_with_luacheckrc = {
  "creatura",
  "flowerpot",
  "player_monoids",
  "stamina",
}
for _,modname in ipairs(mods_with_luacheckrc) do
  files["mods/"..modname] = {}
  -- store globals defined in the mod's .luacheckrc in the corresponding files table
  assert(pcall(assert(loadfile("mods/"..modname.."/.luacheckrc", nil, files["mods/"..modname]))))
end

-- Used variable "_foo" with unused hint.
-- Creatura and animalia use a _ prefix to avoid shadowing self/this/min/max.
files["mods/animalia"] = { ignore = { "214" } }
files["mods/creatura"] = { ignore = { "214" } }

-- We tightly control mods that can override the engine.
files["mods/asuna/asuna_core"] = { globals = { minetest = { fields = { "register_biome", "register_decoration" } } } }
files["mods/minetest_game/creative"] = { globals = { minetest = { fields = { "creative" } } } }
files["mods/minetest_game/player_api"] = { globals = { minetest = { fields = { "calculate_knockback" } } } }
files["mods/ethereal/crystal.lua"] = { globals = { minetest = { fields = { "handle_node_drops" } } } }

exclude_files = {
  -- Legacy stuff
  "mods/animalia/api/legacy_convert.lua",
  "mods/minetest_game/default/legacy.lua",
}
