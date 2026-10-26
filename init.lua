-- Luanti Dragon Mod
-- Rrrrr... Welcome, rider!

core.log("action", "[Dragon Mod] Loaded! The skies now belong to dragons.")

-- Placeholder: register a simple dragon-related node for now
core.register_node("dragon_mod:dragon_egg", {
    description = "Dragon Egg",
    tiles = {"default_stone.png"}, -- placeholder texture
    groups = {cracky = 3, oddly_breakable_by_hand = 1},
    on_rightclick = function(pos, node, clicker)
        core.chat_send_player(clicker:get_player_name(), "A dragon egg! One day it will hatch...")
    end,
})

-- Future: register entities, tools, etc.
