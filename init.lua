-- Luanti Dragon Mod
-- Rrrrr... Welcome, rider!

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

core.log("action", "[Dragon Mod] Loaded! The skies now belong to dragons.")

-- Dragon Egg node
core.register_node("dragon_mod:dragon_egg", {
    description = "Dragon Egg",
    tiles = {"default_stone.png"}, -- TODO: replace with real texture
    groups = {cracky = 3, oddly_breakable_by_hand = 1},
    light_source = 4,
    on_rightclick = function(pos, node, clicker)
        core.chat_send_player(clicker:get_player_name(), "A warm dragon egg... One day it will hatch into a mighty beast!")
    end,
})

-- Dragon Scale item
core.register_craftitem("dragon_mod:dragon_scale", {
    description = "Dragon Scale",
    inventory_image = "default_flint.png", -- placeholder
    groups = {flammable = 1},
})

-- Simple craft for testing
core.register_craft({
    output = "dragon_mod:dragon_scale 2",
    recipe = {
        {"default:diamond", "default:obsidian", "default:diamond"},
        {"default:obsidian", "dragon_mod:dragon_egg", "default:obsidian"},
        {"default:diamond", "default:obsidian", "default:diamond"},
    }
})

-- Placeholder entity registration (will need model later)
--[[
core.register_entity("dragon_mod:dragon", {
    initial_properties = {
        visual = "mesh",
        mesh = "dragon.b3d",
        textures = {"dragon.png"},
        physical = true,
        collide_with_objects = true,
        collisionbox = {-1, -0.5, -1, 1, 1.5, 1},
    },
    on_activate = function(self, staticdata)
        self.object:set_armor_groups({fleshy = 80})
    end,
})
--]]

core.log("action", "[Dragon Mod] Nodes, items and crafts registered.")
