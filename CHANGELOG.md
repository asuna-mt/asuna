# Asuna Changelog

This file documents the major changes made in each version of Asuna.

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