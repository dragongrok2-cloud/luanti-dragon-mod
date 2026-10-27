-- Luanti Dragon Mod
-- Rrrrr... Welcome, rider!

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

core.log("action", "[Dragon Mod] Loaded! The skies now belong to dragons.")

-- ======================
-- NODES
-- ======================

core.register_node("dragon_mod:dragon_egg", {
    description = "Dragon Egg",
    tiles = {"default_stone.png"}, -- TODO: real texture
    groups = {cracky = 3, oddly_breakable_by_hand = 1},
    light_source = 6,
    on_rightclick = function(pos, node, clicker)
        core.chat_send_player(clicker:get_player_name(),
            "A warm dragon egg pulses with life... One day a mighty dragon will hatch!")
    end,
})

core.register_node("dragon_mod:dragon_scale_block", {
    description = "Dragon Scale Block",
    tiles = {"default_obsidian.png"}, -- placeholder
    groups = {cracky = 2},
    is_ground_content = false,
})

core.register_node("dragon_mod:dragon_nest", {
    description = "Dragon Nest",
    tiles = {"default_dirt.png^default_grass_side.png"}, -- placeholder
    groups = {choppy = 2, oddly_breakable_by_hand = 1},
    on_construct = function(pos)
        local meta = core.get_meta(pos)
        meta:set_string("infotext", "Dragon Nest - A place where dragons rest")
    end,
})

-- ======================
-- ITEMS
-- ======================

core.register_craftitem("dragon_mod:dragon_scale", {
    description = "Dragon Scale",
    inventory_image = "default_flint.png",
    groups = {flammable = 1},
})

core.register_craftitem("dragon_mod:dragon_tooth", {
    description = "Dragon Tooth",
    inventory_image = "default_stick.png",
})

core.register_tool("dragon_mod:dragon_sword", {
    description = "Dragon Sword",
    inventory_image = "default_tool_steelsword.png",
    tool_capabilities = {
        full_punch_interval = 0.8,
        max_drop_level = 1,
        groupcaps = {
            snappy = {times = {[1] = 1.5, [2] = 0.8, [3] = 0.3}, uses = 60, maxlevel = 2},
        },
        damage_groups = {fleshy = 8},
    },
})

-- ======================
-- CRAFTS
-- ======================

core.register_craft({
    output = "dragon_mod:dragon_scale 2",
    recipe = {
        {"default:diamond", "default:obsidian", "default:diamond"},
        {"default:obsidian", "dragon_mod:dragon_egg", "default:obsidian"},
        {"default:diamond", "default:obsidian", "default:diamond"},
    }
})

core.register_craft({
    output = "dragon_mod:dragon_scale_block",
    recipe = {
        {"dragon_mod:dragon_scale", "dragon_mod:dragon_scale"},
        {"dragon_mod:dragon_scale", "dragon_mod:dragon_scale"},
    }
})

core.register_craft({
    output = "dragon_mod:dragon_sword",
    recipe = {
        {"dragon_mod:dragon_scale"},
        {"dragon_mod:dragon_scale"},
        {"default:stick"},
    }
})

-- ======================
-- ENTITY PLACEHOLDER
-- ======================
--[[
core.register_entity("dragon_mod:dragon", {
    initial_properties = {
        visual = "mesh",
        mesh = "dragon.b3d",
        textures = {"dragon.png"},
        physical = true,
        collide_with_objects = true,
        collisionbox = {-1.2, -0.5, -1.2, 1.2, 1.8, 1.2},
        hp_max = 80,
    },
    on_activate = function(self, staticdata)
        self.object:set_armor_groups({fleshy = 70})
    end,
    on_step = function(self, dtime)
        -- Future AI: fly, breathe fire, follow owner...
    end,
})
--]]

core.log("action", "[Dragon Mod] Fully loaded with nodes, items, tools and crafts!")
