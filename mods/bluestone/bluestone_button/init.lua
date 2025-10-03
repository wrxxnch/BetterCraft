-- Wall Button
-- A button that when pressed emits power for 1 second
-- and then turns off again

local S = mesecon.S

local function button_turnoff(pos)
	local node = minetest.get_node(pos)
	local rules = mesecon.rules.buttonlike_get(node)
	minetest.sound_play("mesecons_button_pop", {pos = pos})
	mesecon.flipstate(pos, node)
	mesecon.receptor_off(pos, rules)
end

local function on_place(itemstack, placer, pointed_thing)
	if pointed_thing.type == "node" then
		local under = pointed_thing.under
		local node = minetest.get_node(under)
		local node_def = minetest.registered_nodes[node.name]
		if node_def and node_def.on_rightclick and
				not (placer and placer:is_player() and
						placer:get_player_control().sneak) then
			return node_def.on_rightclick(under, node, placer, itemstack,
					pointed_thing) or itemstack
		end

		if not node_def or not node_def.walkable then
			return itemstack -- Place on walkable node not allowed
		end

		if pointed_thing.under.y == pointed_thing.above.y then
			itemstack = minetest.item_place(itemstack, placer, pointed_thing)
		end
	end
	return itemstack
end

local function press(pos, node)
	minetest.sound_play("mesecons_button_push", {pos = pos})
	mesecon.flipstate(pos, node)
	mesecon.receptor_on(pos, mesecon.rules.buttonlike_get(node))
	minetest.get_node_timer(pos):start(1)
end

local boxes_off = {-1/4, -1/8, 0.5, 1/4, 1/8, 6/16}
local boxes_on  = {-1/4, -1/8, 0.5, 1/4, 1/8, 7/16}

local mesecons_off = {
	receptor = {
		state = mesecon.state.off,
		rules = mesecon.rules.buttonlike_get
	}
}

local mesecons_on = {
	receptor = {
		state = mesecon.state.on,
		rules = mesecon.rules.buttonlike_get
	}
}

-- Stone Button
mesecon.register_node("bluestone_button:button_stone", {
	drawtype = "nodebox",
	tiles = {"default_stone.png"},
	use_texture_alpha = "opaque",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	sunlight_propagates = true,
	sounds = default.node_sound_stone_defaults(),
	on_blast = mesecon.on_blastnode
}, {
	description = S("Stone Button"),
	on_rotate = mesecon.buttonlike_onrotate,
	node_box = {
		type = "fixed",
		fixed = boxes_off
	},
	groups = {dig_immediate = 2, attached_node2 = 1},
	node_placement_prediction = "",
	on_place = on_place,
	on_rightclick = press,
	mesecons = mesecons_off
}, {
	on_rotate = false,
	node_box = {
		type = "fixed",
		fixed = boxes_on
	},
	groups = {dig_immediate = 2, attached_node2 = 1, not_in_creative_inventory = 1},
	mesecons = mesecons_on,
	on_timer = button_turnoff
})

minetest.register_craft({
	output = "bluestone_button:button_stone_off 2",
	recipe = {{"default:cobble"}}
})

-- Wood Button
mesecon.register_node("bluestone_button:button_wood", {
	drawtype = "nodebox",
	tiles = {"default_wood.png"},
	use_texture_alpha = "opaque",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	sunlight_propagates = true,
	sounds = default.node_sound_stone_defaults(),
	on_blast = mesecon.on_blastnode
}, {
	description = S("Wood Button"),
	on_rotate = mesecon.buttonlike_onrotate,
	node_box = {
		type = "fixed",
		fixed = boxes_off
	},
	groups = {dig_immediate = 2, attached_node2 = 1},
	node_placement_prediction = "",

	on_place = on_place,
	on_rightclick = press,
	mesecons = mesecons_off
}, {
	on_rotate = false,
	node_box = {
		type = "fixed",
		fixed = boxes_on
	},
	groups = {dig_immediate = 2, attached_node2 = 1, not_in_creative_inventory = 1},
	mesecons = mesecons_on,
	on_timer = button_turnoff
})

minetest.register_craft({
	output = "bluestone_button:button_wood_off 2",
	recipe = {{"group:wood"}}
})
