-- ======================
--   GEODES + AMETHYST
-- ======================

geodes = {}
local geode_types = {}

-- ======================
-- Sons da Ametista
-- ======================
local amethyst_sounds_block = {
    dug = { name = {"Amethyst_Cluster_break1","Amethyst_Cluster_break2"}, gain = 1.0 },
    place = { name = {"Amethyst_Cluster_place1","Amethyst_Cluster_place2"}, gain = 1.0 },
    footstep = {name = "default_glass_footstep", gain = 0.3},
    dig = {name = "default_glass_footstep", gain = 0.4},
}

local amethyst_sounds_crystal = {
    dug = { name = {"Amethyst_Cluster_break3","Amethyst_Cluster_break4"}, gain = 1.0 },
    place = { name = {"Amethyst_Cluster_place3","Amethyst_Cluster_place4"}, gain = 1.0 },
    footstep = {name = "default_glass_footstep", gain = 0.2},
    dig = {name = "default_glass_footstep", gain = 0.3},
}

-- ======================
-- Nodes Geodes
-- ======================
minetest.register_node("gs_amethyst:calcite", {
    description = "Calcite",
    tiles = {"calcite.png"},
    groups = {cracky = 3},
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gs_amethyst:block", {
    description = "Amethyst Block",
    tiles = {"gs_amethyst_block.png"},
    groups = {cracky = 3},
    sounds = amethyst_sounds_block,
})

minetest.register_node("gs_amethyst:basalt", {
    description = "Basalt",
    tiles = {"basalt.png"},
    groups = {cracky = 3},
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("gs_amethyst:polished_basalt", {
    description = "Polished Basalt",
    tiles = {
        "default_polished_basalt_top.png",  
        "default_polished_basalt_top.png",  
        "default_polished_basalt_side.png", 
    },
    groups = {cracky = 2, stone = 1},
    sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
    output = "gs_amethyst:polished_basalt 4",
    recipe = {
        {"gs_amethyst:basalt", "gs_amethyst:basalt"},
        {"gs_amethyst:basalt", "gs_amethyst:basalt"},
    }
})

-- ======================
-- Crafts de Amethyst
-- ======================

-- 9 Cristais -> 1 Bloco
minetest.register_craft({
    output = "gs_amethyst:block",
    recipe = {
        {"gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst"},
        {"gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst"},
        {"gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst"},
    }
})

-- 1 Bloco -> 9 Cristais
minetest.register_craft({
    output = "gs_amethyst:gs_amethyst 9",
    recipe = {
        {"gs_amethyst:block"},
    }
})

-- ======================
-- Itens base
-- ======================

minetest.register_craftitem("gs_amethyst:gs_amethyst", {
    description = "Amethyst Gem",
    inventory_image = "gs_amethyst.png",
})

-- -- craft: 1 cristal -> 1 gema refinada
-- minetest.register_craft({
--     output = "gs_amethyst:gs_amethyst",
--     recipe = {
--         {"gs_amethyst:crystal"},
--     }
-- })

minetest.register_node("gs_amethyst:crystal", {
    description = "Amethyst Crystal",
    tiles = {"gs_amethyst_crystal.png"},
    inventory_image = "gs_amethyst_crystal.png",
    drawtype = "plantlike",
    paramtype = "light",
    sunlight_propagates = true,
    paramtype2 = "wallmounted",
    light_source = 8,
    groups = {cracky = 3},
    sounds = amethyst_sounds_crystal,
    drop = "gs_amethyst:gs_amethyst", -- 🔹 dropa a gema ao quebrar
    node_box = {
        type = "fixed",
        fixed = {-5/16, -0.5, -5/16, 5/16, 5/16, 5/16}
    },
    selection_box = {
        type = "fixed",
        fixed = {-5/16, -0.5, -5/16, 5/16, 5/16, 5/16}
    },
})

-- ======================
-- Armaduras de Amethyst
-- ======================

minetest.register_craftitem("gs_amethyst:helmet", {
    description = "Amethyst Helmet",
    inventory_image = "gs_amethyst_helmet_inv.png",
})

minetest.register_craftitem("gs_amethyst:chestplate", {
    description = "Amethyst Chestplate",
    inventory_image = "gs_amethyst_chestplates_inv.png",
})

minetest.register_craftitem("gs_amethyst:leggings", {
    description = "Amethyst Leggings",
    inventory_image = "gs_amethyst_leggings_inv.png",
})

minetest.register_craftitem("gs_amethyst:boots", {
    description = "Amethyst Boots",
    inventory_image = "gs_amethyst_boots_inv.png",
})

minetest.register_craftitem("gs_amethyst:shield", {
    description = "Amethyst Shield",
    inventory_image = "gs_amethyst_shield_inv.png",
})





-- ======================
-- Ferramentas
-- ======================

minetest.register_tool("gs_amethyst:pickaxe", {
    description = "Amethyst Pickaxe",
    inventory_image = "gs_amethyst_pickaxe.png",
    tool_capabilities = {
        full_punch_interval = 1.0,
        max_drop_level = 3,
        groupcaps = {
            cracky = {times={[1]=2.0,[2]=1.0,[3]=0.5}, uses=60, maxlevel=3},
        },
        damage_groups = {fleshy=6},
    },
})

minetest.register_tool("gs_amethyst:shovel", {
    description = "Amethyst Shovel",
    inventory_image = "gs_amethyst_shovel.png",
    tool_capabilities = {
        full_punch_interval = 1.1,
        max_drop_level = 1,
        groupcaps = {
            crumbly = {times={[1]=1.5,[2]=0.8,[3]=0.4}, uses=60, maxlevel=3},
        },
        damage_groups = {fleshy=4},
    },
})

minetest.register_tool("gs_amethyst:axe", {
    description = "Amethyst Axe",
    inventory_image = "gs_amethyst_axe.png",
    tool_capabilities = {
        full_punch_interval = 1.1,
        max_drop_level = 1,
        groupcaps = {
            choppy = {times={[1]=2.0,[2]=1.0,[3]=0.6}, uses=60, maxlevel=3},
        },
        damage_groups = {fleshy=7},
    },
})

minetest.register_tool("gs_amethyst:sword", {
    description = "Amethyst Sword",
    inventory_image = "gs_amethyst_sword.png",
    tool_capabilities = {
        full_punch_interval = 0.9,
        max_drop_level = 1,
        groupcaps = {
            snappy = {times={[1]=1.8,[2]=0.6,[3]=0.2}, uses=70, maxlevel=3},
        },
        damage_groups = {fleshy=8},
    },
})

-- Crafts das ferramentas
minetest.register_craft({
    output = "gs_amethyst:pickaxe",
    recipe = {
        {"gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst"},
        {"", "default:stick", ""},
        {"", "default:stick", ""},
    }
})

minetest.register_craft({
    output = "gs_amethyst:shovel",
    recipe = {
        {"gs_amethyst:gs_amethyst"},
        {"default:stick"},
        {"default:stick"},
    }
})

minetest.register_craft({
    output = "gs_amethyst:axe",
    recipe = {
        {"gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst"},
        {"gs_amethyst:gs_amethyst", "default:stick"},
        {"", "default:stick"},
    }
})

minetest.register_craft({
    output = "gs_amethyst:sword",
    recipe = {
        {"gs_amethyst:gs_amethyst"},
        {"gs_amethyst:gs_amethyst"},
        {"default:stick"},
    }
})

-- ======================
-- Recipes usando gs_amethyst:gs_amethyst
-- ======================

-- Helmet
minetest.register_craft({
    output = "gs_amethyst:helmet",
    recipe = {
        {"gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst"},
        {"gs_amethyst:gs_amethyst", "", "gs_amethyst:gs_amethyst"},
        {"", "", ""}
    }
})

-- Chestplate
minetest.register_craft({
    output = "gs_amethyst:chestplate",
    recipe = {
        {"gs_amethyst:gs_amethyst", "", "gs_amethyst:gs_amethyst"},
        {"gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst"},
        {"gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst"}
    }
})

-- Leggings
minetest.register_craft({
    output = "gs_amethyst:leggings",
    recipe = {
        {"gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst"},
        {"gs_amethyst:gs_amethyst", "", "gs_amethyst:gs_amethyst"},
        {"gs_amethyst:gs_amethyst", "", "gs_amethyst:gs_amethyst"}
    }
})

-- Boots
minetest.register_craft({
    output = "gs_amethyst:boots",
    recipe = {
        {"gs_amethyst:gs_amethyst", "", "gs_amethyst:gs_amethyst"},
        {"gs_amethyst:gs_amethyst", "", "gs_amethyst:gs_amethyst"},
        {"", "", ""}
    }
})

-- Shield
minetest.register_craft({
    output = "gs_amethyst:shield",
    recipe = {
        {"gs_amethyst:gs_amethyst", "", "gs_amethyst:gs_amethyst"},
        {"gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst", "gs_amethyst:gs_amethyst"},
        {"", "gs_amethyst:gs_amethyst", ""}
    }
})

-- ======================
-- Armaduras (requires 3d_armor)
-- ======================

if minetest.get_modpath("3d_armor") then
	armor:register_armor("amethyst:helmet_amethyst", {
		description = ("Amethyst Helmet"),
		inventory_image = "gs_amethyst_helmet_inv.png",
		groups = {armor_head=1, armor_heal=16, armor_use=70},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=1, level=6},
    })

	armor:register_armor("amethyst:leggings_amethyst", {
		description = ("Amethyst Leggings"),
		inventory_image = "gs_amethyst_leggings_inv.png",
		groups = {armor_legs=1, armor_heal=16, armor_use=70},
		armor_groups = {fleshy=30},
		damage_groups = {cracky=2, snappy=1, level=6},
	})

	armor:register_armor("amethyst:chestplate_amethyst", {
		description = ("Amethyst Chestplate"),
		inventory_image = "gs_amethyst_chestplates_inv.png",
		groups = {armor_torso=1, armor_heal=16, armor_use=70},
		armor_groups = {fleshy=30},
		damage_groups = {cracky=2, snappy=1, level=6},
	})

		armor:register_armor("amethyst:boots_amethyst", {
		description = ("Amethyst Boots"),
		inventory_image = "gs_amethyst_boots_inv.png",
		groups = {armor_feet=1, armor_heal=16, armor_use=70, physics_speed=1,
				physics_jump=0.5},
		armor_groups = {fleshy=10},
		damage_groups = {cracky=2, snappy=1, level=6},
	})

		armor:register_armor("amethyst:shield_amethyst", {
			description = ("Amethyst Shield"),
			inventory_image = "gs_amethyst_shield_inv.png",
			groups = {armor_shield=1, armor_heal=12, armor_use=70},
			armor_groups = {fleshy=10},
			damage_groups = {cracky=2, snappy=1, level=6},
	})

end



minetest.register_node("gs_amethyst:crystal", {
    description = "Amethyst Crystal",
    tiles = {"gs_amethyst_crystal.png"},
    inventory_image = "gs_amethyst_crystal.png",
    drawtype = "plantlike",
    paramtype = "light",
    sunlight_propagates = true,
    paramtype2 = "wallmounted",
    light_source = 8,
    groups = {cracky = 3},
    sounds = amethyst_sounds_crystal,
    node_box = {
        type = "fixed",
        fixed = {-5/16, -0.5, -5/16, 5/16, 5/16, 5/16}
    },
    selection_box = {
        type = "fixed",
        fixed = {-5/16, -0.5, -5/16, 5/16, 5/16, 5/16}
    },
})

-- Núcleo da geoda
minetest.register_node("gs_amethyst:geode_core", {
    groups = {not_in_creative_inventory = 1},
})

-- ======================
-- Geração das geodas
-- ======================
minetest.register_ore({
    ore_type       = "scatter",
    ore            = "gs_amethyst:geode_core",
    wherein        = "default:stone",
    clust_scarcity = 64 * 64 * 64,
    clust_num_ores = 1,
    clust_size     = 1,
    y_max          = -40,
    y_min          = -31000,
})

minetest.register_lbm({
    label = "make_geode",
    name = "gs_amethyst:create_geode",
    nodenames = {"gs_amethyst:geode_core"},
    run_at_every_load = true,
    action = function(pos, node)
        if (#geode_types == 0) then
            minetest.log("warning", "[geodes] Nenhum tipo de geode registrado.")
            return
        end

        local outer, middle, inner, crystal, fill, size_min, size_max =
            unpack(geode_types[math.random(1, #geode_types)])
        local size = math.random(size_min, size_max)

        for x = -size, size do
        for y = -size, size do
        for z = -size, size do
            if minetest.get_node(pos + vector.new(x, y, z)).name ~= "air" then
                if vector.distance(vector.new(x, y, z), vector.new()) < size then
                    minetest.set_node(pos + vector.new(x, y, z), {name = outer})
                if vector.distance(vector.new(x, y, z), vector.new()) < size - 1 then
                    minetest.set_node(pos + vector.new(x, y, z), {name = middle})
                if vector.distance(vector.new(x, y, z), vector.new()) < size - 2 then
                    minetest.set_node(pos + vector.new(x, y, z), {name = inner})
                if vector.distance(vector.new(x, y, z), vector.new()) < size - 3 then
                    minetest.set_node(pos + vector.new(x, y, z), {name = fill})
                end end end end
            end
        end end end

        -- Cristais
        if crystal ~= fill then
        for x = -size+4, size-4 do
        for y = -size+4, size-4 do
        for z = -size+4, size-4 do
            if math.random(0, 10) == 0 and vector.distance(vector.new(x,y,z), vector.new()) >= size-4 and vector.distance(vector.new(x,y,z), vector.new()) < size-3 then
                local pos2 = pos + vector.new(x,y,z)
                if minetest.get_node(pos2 + vector.new(0,1,0)).name == inner then
                    minetest.set_node(pos2, {name = crystal, param2 = 0})
                elseif minetest.get_node(pos2 + vector.new(0,-1,0)).name == inner then
                    minetest.set_node(pos2, {name = crystal, param2 = 1})
                elseif minetest.get_node(pos2 + vector.new(1,0,0)).name == inner then
                    minetest.set_node(pos2, {name = crystal, param2 = 2})
                elseif minetest.get_node(pos2 + vector.new(-1,0,0)).name == inner then
                    minetest.set_node(pos2, {name = crystal, param2 = 3})
                elseif minetest.get_node(pos2 + vector.new(0,0,1)).name == inner then
                    minetest.set_node(pos2, {name = crystal, param2 = 4})
                elseif minetest.get_node(pos2 + vector.new(0,0,-1)).name == inner then
                    minetest.set_node(pos2, {name = crystal, param2 = 5})
                end
            end
        end end end
        end
    end,
})

function geodes.register_geode(outer, middle, inner, crystal, fill, size_min, size_max)
    table.insert(geode_types, {outer, middle, inner, crystal or "air", fill or "air", size_min or 6, size_max or 11})
end

-- ======================
-- Registrar Geodo Padrão
-- ======================
geodes.register_geode(
    "gs_amethyst:basalt",      -- externa
    "gs_amethyst:calcite",     -- intermediária
    "gs_amethyst:block",       -- interna
    "gs_amethyst:crystal",     -- cristais
    "air",                     -- centro oco
    6, 11                      -- tamanho min/max
)
