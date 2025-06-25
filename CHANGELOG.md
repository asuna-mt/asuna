# Asuna Changelog

This file documents the major changes made in each version of Asuna.

## v1.1.5

- Reduce prevalence of slime mold on Mushroom biome shores
- Allow coral to generate at slightly higher depths in tropical oceans
- Update Dungeons Plus from upstream

## v1.1.4

- Use sand for Heath biome seabed
- Improve ocean/shore biome mapgen performance and decoration patterns; beaches will generally be clearer and cleaner!
  - Waterlily: reduce general density, remove from hot/tropical biome shores, and add extra to swampy biomes
  - Reduce floating seaweed density
  - Start algae, oysters, and mussels at slightly deeper depths
  - Code improvements for better mapgen performance
- Remove Ethereal thin ice from mapgen
- Update mods from upstream
  - Minetest Game: added support for Player Monoids
  - Dungeons Plus: miscellaneous feature improvements and additional dungeon room checks

## v1.1.3

- Add Ethereal crystal spikes to Everness crystal forest biome
- Remove sashimi from Japanese forest mod/biome in favor of Ethereal sashimi
- Update Minetest Game from upstream

## v1.1.2

- New mod: [Dungeons Plus](https://content.luanti.org/packages/EmptyStar/dungeonsplus/)
- Update mods from upstream
  - 3D Armor: Russian translations and API crash fix
  - Animalia: prevent log message spam due to node re-registration
  - Astralcraft: reduce star fragment yield from shooting stars
  - Asuna Game Mods: new crying obsidian textures by [JoeEnderman](https://content.luanti.org/users/JoeEnderman/)
  - Filled Bottles: bottles with lighted materials now inherit light levels

## v1.1.1

- Update Minetest Game from upstream to pull in [a hotfix to signs](https://github.com/luanti-org/minetest_game/commit/a6bf9dd526e51b25f1ca08d6d214c5e8442b503b)
- Disable weeds ([for real this time](https://github.com/asuna-mt/farming/commit/f09ca4a0693c11bfed6a35bb7756ee95ca62c679))
- Adjust dungeon nodes for some biomes

## v1.1.0

- New content pack: Stratosphere!
  - Introduces sky islands to Asuna worlds
  - Adds shooting stars + related items via [Astralcraft](https://content.luanti.org/packages/EmptyStar/astralcraft/)
  - Adds tangible clouds + related items via [Cloudcraft](https://content.luanti.org/packages/EmptyStar/cloudcraft/)
- As of this version, the only officially supported mapgen for Asuna is **mapgen v7**; Asuna worlds with other mapgens can still be created, but these worlds will see a warning that can be disabled via settings
- New in-game font: [Montserrat ESR](https://content.luanti.org/packages/EmptyStar/montserrat_esr/)
- New textures from [Baunilha](https://content.luanti.org/packages/Mirtilo/baunilha/), notably including new textures for Ethereal, Baked Clay, and other newly designed mod textures
- Added [Tune JIT](https://content.luanti.org/packages/rudzik8/tune_jit/) for improved server-side performance
- Added [Armor Monoid](https://content.luanti.org/packages/Byakuren/armor_monoid/) for mod compatibility
- Updated all mods from upstream
- Bug fixes
  - Raised height limit of Deciduous Forest biome to 31000
  - Pumpkins now only drop one pumpkin
  - Added missing aliases for certain mod items that were removed/deduplicated
  - Remove all uses of `goto` in the Asuna code base as it isn't officially supported

## v1.0.7

- Effervescence: Use `blend = "clip"` for particles only if it's supported

## v1.0.6

- Disable torch damage
- Remove log message that appears when using a bug net

## v1.0.5

- Fix a crash caused by the Net Worth award
- Researcher: Fix broken research table particle graphics
- Effervescence: Set `blend = "clip"` for most particle effects
- Add `time_speed = 72` to Asuna's minetest.conf file for proper day/night cycles in case the default value changes

## v1.0.4

- Add missing Dorwinion and Nightshade tree saplings
- Make saplings from Biomes modpack more compatible with bonemeal
- Adjust Show Wielded Item text to be bold and to not overlap with the food saturation bar
- Enable raspberries from Farming Redo and add raspberries to mapgen
- Adjust low-yield wild crops to be more mature and thus more likely to drop crops/seeds

## v1.0.3

- Use alternate texture for wool instead of overriding X Farming wool alias tiles
- Add [Carpets](https://content.luanti.org/packages/bell07/carpets/) mod

## v1.0.2

- Removed hemp -> cotton recipe
- X Farming water bottle aliased to Filled Bottles water bottle
- X Farming soup bowl aliased to Farming Redo wooden bowl
- Everness basic farming soils aliased to Farming Redo soils
- Added depth_riverbed to registered biomes which ensures proper riverbeds
- Grass/litter nodes based on nodes other than dirt now decay into the proper node
- Expanded Heath biome to the shoreline
- Generate schematics before ground cover in Natural Biomes mapgen

## v1.0.1

- Added a mod override warning that warns players if they have mods enabled that are already bundled with Asuna
- Removed directional placement of Ethereal planks
- Removed marram grass from sandstone desert shores
- Updated Minetest Game from upstream

## v1.0.0

- Asuna is no longer a work-in-progress! Asuna will continue to see updates; this simply means that Asuna is no longer considered to be in a new/experimental state
- New built-in mods: Researcher, 3D Armor, Find Biome, Effervescence; if you have any of these mods enabled for your existing Asuna worlds, it is recommended to disable them in favor of Asuna's built-in mods
- Gameplay updates are now structured as *content packs* which are configurable via settings -- **CHECK YOUR GAME SETTINGS** to reconfigure any previous changes that you might have made
- Revamped Jumble biome: now features more distinct trees and biome features + fixed missing cave definition to give it proper fungal/mushroom caves
- Set height limit to max for biomes that were unnecessarily limited to lower elevations (Grassland, Plains, Prairie, Birch Forest, Sakura, Jumble, Mushroom, Grove)
- Eight new ambient music tracks by [Sascha Ende](https://filmmusic.io/) (and removed two less fitting nighttime tracks)
- Updated textures based on newer versions of [Baunilha](https://content.luanti.org/packages/Mirtilo/baunilha/) plus some custom textures for crosshairs, giant mushrooms, and select other nodes/items
- New awards
- Upstream updates to all bundled mods that had available updates
- Globally-aligned textures for Minetest Game stairs and slabs
- New overall goal tracker for Awards UI and more consistent award listing
- Lots of bug fixes: possible crash and behavior issues with slimes, beds previously not passing the night, mapgen quirks, missing groups for certain flowers, and so much more!