
minetest.register_node("paleragi:tree", {
	description = "Pale Garden Tree",
	tiles = {"paleragi_tree_top.png", "paleragi_tree_top.png", "paleragi_tree.png"},
	paramtype2 = "facedir",
	is_ground_content = false,
	groups = {tree=1,choppy=2,oddly_breakable_by_hand=1,flammable=2},
	sounds = default.node_sound_wood_defaults(),
	on_place = minetest.rotate_node
})

minetest.register_node("paleragi:wood", {
	description = "Pale Garden Wood Planks",
	tiles = {"paleragi_wood.png"},
	groups = {choppy=2,oddly_breakable_by_hand=2,flammable=10,wood=1},
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("paleragi:sapling", {
	description = "Pale Garden Tree Sapling",
	drawtype = "plantlike",
	visual_scale = 1.0,
	tiles = {"paleragi_sapling.png"},
	inventory_image = "paleragi_sapling.png",
	wield_image = "paleragi_sapling.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
	},
	groups = {snappy=2,dig_immediate=3,flammable=10,attached_node=1,sapling=1},
	sounds = default.node_sound_leaves_defaults(),
})

minetest.register_node("paleragi:leaves", {
	description = "Pale Garden Leaves",
	drawtype = "allfaces",
	waving = 1,
	tiles = {"paleragi_leaves.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=3, leafdecay=3, flammable=10, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {"paleragi:sapling"},
				rarity = 20,
			},
			{
				items = {"paleragi:leaves"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = paleragi.after_place_leaves,
})

minetest.register_node("paleragi:leaves_white", {
	description = "White Pale Garden Leaves",
	drawtype = "allfaces",
	waving = 1,
	tiles = {"paleragi_leaves_white.png"},
	paramtype = "light",
	is_ground_content = false,
	groups = {snappy=3, leafdecay=3, flammable=10, leaves=1},
	drop = {
		max_items = 1,
		items = {
			{
				items = {"paleragi:sapling"},
				rarity = 20,
			},
			{
				items = {"paleragi:leaves_white"},
			}
		}
	},
	sounds = default.node_sound_leaves_defaults(),
	after_place_node = paleragi.after_place_leaves,
})

default.register_leafdecay({
    trunks = {"paleragi:tree"},
    leaves = {"paleragi:leaves", "paleragi:leaves_white"},
    radius = 3,
})
		
doors.register_door("paleragi:pale_door", {
		tiles = {{ name = "paleragi_door_full.png", backface_culling = true }},
		description = "Pale Wooden Door",
		inventory_image = "paleragi_door.png",
		protected = true,
		groups = { snappy = 1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2 },
		recipe = {
			{"paleragi:tree", "paleragi:tree"},
			{"paleragi:tree", "paleragi:tree"},
			{"paleragi:tree", "paleragi:tree"}
		}
})
default.register_fence("paleragi:fence", {
	description = "Pale Garden Wood Fence",
	texture = "paleragi_wood.png",
	material = "paleragi:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
	sounds = default.node_sound_wood_defaults()
})
doors.register_fencegate("paleragi:fencegate", {
	description = "Pale Garden Wood Fence Gate",
	texture = "paleragi_wood.png",
	material = "paleragi:wood",
	groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2}
})
