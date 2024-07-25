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
-- Could also be extracted from ifs like the one above.
-- In practice only a few of these are not covered by other rules, and often mod
-- names differ from global names they define, so this list was filled manually.
stds.supported_mods = {
  read_globals = {
    "abstract_dryplants", -- from dryplants
    "armor", -- From 3d_armor
    "df_primordial_items",
    "df_trees",
    "geodes_lib",
    "hb", -- From hudbars
    "hunger_ng",
    "lucky_block",
    "mapgen_helper", -- From dfcaverns
    "mcl_player",
    "mcl_sounds",
    "mobs",
    "moretrees",
    "signs_bot",
    "stairsplus",
    "techage",
    "technic",
    "technic_cnc",
    "toolranks",
  },
}

-- Mods included in Asuna.
-- List generated with:
--   git grep --recurse-submodules -ho "^name =.*" | awk '{ sub("\r",""); print "  \"" $3 "\"," }' | sort
local mod_names = {
  "abdecor",
  "animalia",
  "asuna_awards",
  "asuna_core",
  "asuna_textures",
  "awards",
  "badland",
  "bakedclay",
  "beautiflowers",
  "beds",
  "binoculars",
  "biomes",
  "biomes_leafdecay",
  "boats",
  "bonemeal",
  "bones",
  "bottles",
  "bucket",
  "builtin_item",
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
  "everness",
  "farming",
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
  "item_drop",
  "japaneseforest",
  "keys",
  "leafstride",
  "livingjungle",
  "livingslimes",
  "lootchests",
  "lootchests_default",
  "map",
  "marinara",
  "mtg_craftguide",
  "music_api",
  "naturalbiomes",
  "nightshade",
  "player_api",
  "player_monoids",
  "pl_seaweed",
  "prairie",
  "screwdriver",
  "sethome",
  "sfinv",
  "sfinv_buttons",
  "show_wielded_item",
  "signs_lib",
  "skinsdb",
  "soup",
  "spawn",
  "stairs",
  "stamina",
  "telemosaic",
  "tnt",
  "too_many_stones",
  "tt",
  "tt_base",
  "vessels",
  "walls",
  "weather",
  "wielded_light",
  "wool",
  "worldgate",
  "x_farming",
  "xpanes",
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
  "skins", -- from skinsdb
  table.unpack(mod_names)
}

exclude_files = {
  -- Assets
  "mods/livingjungle/schematics",
  -- Legacy stuff
  "mods/animalia/api/legacy_convert.lua",
  "mods/minetest_game/default/legacy.lua",
}

-- Mod-specific configuration
-----------------------------

-- Import existing .luacheckrc files
-- List generated with:
--   find mods -name .luacheckrc -exec dirname {} \; | xargs -L1 basename | awk '{ sub("\r",""); print "  \"" $1 "\"," }' | sort
local mods_with_luacheckrc = {
  "animalia",
  "awards",
  "creatura",
  "everness",
  "flowerpot",
  "item_drop",
  "plantlife_modpack",
  "player_monoids",
  "signs_lib",
  "skinsdb",
  "stamina",
  "telemosaic",
  "x_farming",
}
for _,modname in ipairs(mods_with_luacheckrc) do
  local modpath = "mods/" .. modname
  files[modpath] = {}
  -- store globals defined in the mod's .luacheckrc in the corresponding files table
  assert(pcall(assert(loadfile(modpath.."/.luacheckrc", nil, files[modpath]))))
  if files[modpath].exclude_files then
    for i,path in ipairs(files[modpath].exclude_files) do
      -- exclude_files only works in the global scope, not in files[]
      table.insert(exclude_files, modpath.."/"..path)
    end
  end
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
