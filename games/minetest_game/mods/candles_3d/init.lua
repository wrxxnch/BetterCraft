local modname = core.get_current_modname()
local basename
local S = core.get_translator(modname)
local candle_recipes = 0
local creative_server = core.is_creative_enabled("")

local DEFAULT_LEADER_COLOR = "orange" -- Arbitrary decision
local leader_color = core.settings:get("candles_3d-leader_color") or DEFAULT_LEADER_COLOR
local candle_count = core.settings:get("candles_3d-candles_per_node")
candle_count = tonumber(candle_count) or 5
candle_count = math.max(candle_count, 1)
candle_count = math.min(candle_count, 5)
candle_count = math.floor(candle_count)
local deprecated = core.settings:get_bool("candles_3d-deprecated_nodes", false)

local candle_boxes = {
	{ type = "fixed", fixed = {-0.1, -0.5, -0.2, 0.25, -0.1, 0.15}},
	{ type = "fixed", fixed = { {-0.4, -0.5, 0, -0.1, 0.1, 0.25},
								{0, -0.5, -0.35, 0.35, -0.15, 0.0},}},
	{ type = "fixed", fixed = { {-0.45, -0.5, -0.05, -0.15, 0, 0.3},
								{-0.2, -0.5, -0.35, 0.1, 0.1, -0.1},
								{0.05, -0.5, 0.1, 0.4, 0, 0.4},}},
	{ type = "fixed", fixed = { {-0.3, -0.5, -0.35, -0.05, 0.1, -0.1},
								{0.05, -0.5, 0.05, 0.4, -0.1, 0.4},
								{0.15, -0.5, -0.4, 0.45, 0, -0.15},
								{-0.45, -0.5, -0.05, -0.15, 0.05, 0.3},
							}},
	{ type = "fixed", fixed = { {-0.25, -0.5, -0.45, 0.0, 0, -0.2},
								{0.2, -0.5, 0.2, 0.45, 0.1, 0.45},
								{-0.15, -0.5, -0.15, 0.25, -0.1, 0.25},
								{0.15, -0.5, -0.4, 0.45, 0, -0.15},
								{-0.45, -0.5, -0.05, -0.15, 0.05, 0.3},
							}},
}
local mcl
if core.get_modpath("mcl_fire") then
	basename = "mcl_candles"
	mcl = true
else
	basename = modname
end

local supported_colors = {}

if mcl then
	supported_colors["white"] = S("White")
	supported_colors["lightgrey"] = S("Light Grey")
	supported_colors["grey"] = S("Grey")
	supported_colors["darkgrey"] = S("Dark Grey")
	supported_colors["black"] = S("Black")
	supported_colors["red"] = S("Red")
	supported_colors["orange"] = S("Orange")
	supported_colors["yellow"] = S("Yellow")
	supported_colors["lime"] = S("Lime")
	supported_colors["green"] = S("Green")
	supported_colors["aqua"] = S("Aqua")
	supported_colors["cyan"] = S("Cyan")
	--supported_colors["sky_blue"] = S("sky_blue")
	supported_colors["blue"] = S("Blue")
	supported_colors["violet"] = S("Violet")
	supported_colors["magenta"] = S("Magenta")
	--supported_colors["red_violet"] = S("red_violet")
elseif core.get_modpath("dye") then
	for _, color in ipairs(dye.dyes) do
		color[1] = color[1]:gsub("_","")
		supported_colors[color[1]] = S(color[2])
	end
end

-- `leader_color` got from config can contains any string
-- Check if `leader_color` from config is right (exists), else use DEFAULT_LEADER_COLOR
(function()
	for color,_ in pairs(supported_colors) do
		if leader_color == color then return end
	end
	core.log("warning",
		"[ Candles 3D ]: unknown value '" .. leader_color .. "' for `candles_3d-leader_color` setting; use default: '" .. DEFAULT_LEADER_COLOR .. "'"
	)
	leader_color = DEFAULT_LEADER_COLOR
end)()


local is_candle = function(stack)
	return stack:get_name():sub(1,#basename+1) == basename .. ":"
end

local is_supported_color = function(strings)
	if not strings or ( strings[1] ~= "dye"
		and strings[1] ~= "mcl_dye" ) then
		return false
	end
	for color,_ in pairs(supported_colors) do
		if color == strings[2] then
			return true
		end
	end
	return false
end

local ignite = function(pos, igniter)
	local node = core.get_node(pos)
	core.swap_node(pos,
		{ param2 = node.param2,
		name = node.name:gsub("unlit_", "")
	})
end

local mcl_candle_ignite = function(player, pointed_thing)
	ignite(pointed_thing.under, player)
	return true
end

local candle_same_color = function(nodename, stackname)
	local nodecolor, stackcolor
	stackcolor = stackname:gsub(basename .. ":unlit_", "")
	stackcolor = stackcolor:gsub("_.*","")
	nodecolor = nodename:gsub(basename .. ":", "")
	nodecolor = nodecolor:gsub("unlit_", "")
	nodecolor = nodecolor:gsub("_.*","")
	return nodecolor == stackcolor
end

local register_candle = function(color, count)
	-- Initialize candle definition
	local def = {
		drawtype = "mesh",
		paramtype = "light",
		tiles = {{
			name = "candles_3d.png^(candles_3d-wax.png^[colorize:" .. color .. ":127)",
			animation = {
				type = "vertical_frames",
				aspect_w = 48,
				aspect_h = 16,
				length = 3.0,
			},
		}},
		mesh = "candles_3d_" .. count .. ".obj",
		walkable = false,
		floodable = true,
		groups = {dig_immediate=3, attached_node=1},
		paramtype2 = "facedir",
		light_source = count + 3,
		use_texture_alpha = "blend",
		selection_box = candle_boxes[count],
	}
	if mcl then
		def.groups.dig_immediate = 2
	end
	local action = function(pos, node, clicker, itemstack, pointed_thing)
		local pn = clicker:get_player_name()
		if core.is_protected(pos, pn) then
			return
		end

		if mcl then
			pointed_thing = itemstack
			itemstack = clicker:get_wielded_item()
		end

		if itemstack:get_name() == "" then
			return
		end

		local unlit = ""
		if node.name:find("unlit_") then
			unlit = "unlit_"
		end

		-- When player holds a candle_3d increase candle counts in node
		if is_candle(itemstack) then
			if count < candle_count and
				(not mcl or candle_same_color(node.name, itemstack:get_name())) then
				core.swap_node(pos, { param2 = node.param2,
					name = basename .. ":" .. unlit .. color .. "_" .. count + 1 })
				if creative_server or
					core.check_player_privs(pn, "creative") then
					return
				end
				itemstack:take_item()
				if mcl then
					clicker:set_wielded_item(itemstack)
				else
					return itemstack
				end
			end
			return
		end

		-- When player holds a dye change the color of the node
		local mi_split = itemstack:get_name():split(":")
		if mi_split then
			mi_split[2] = mi_split[2]:gsub("dark_","dark")
		end
		if is_supported_color(mi_split) and color ~= mi_split[2]
			and ( not mcl or count == 1 ) then
			core.swap_node(pos, { param2 = node.param2,
				name = basename .. ":" .. unlit ..  mi_split[2] .. "_" .. count })
			if creative_server or
				core.check_player_privs(pn, "creative") then
				return
			end
			itemstack:take_item()
			if mcl then
				clicker:set_wielded_item(itemstack)
			else
				return itemstack
			end
		end

		-- Light up candles with torches when not mineclone
		if not mcl and unlit ~= "" and itemstack:get_name() == "default:torch" then
			core.swap_node(pos, { param2 = node.param2,
				name = basename .. ":" .. color .. "_" .. count })
		end
	end

	if mcl then
		def.on_punch = action
	else
		def.on_rightclick = action
	end

	if mcl then
		def.drop = basename .. ":unlit_" .. color .. "_1 " .. count
	else
		def.drop = basename .. ":unlit_" .. leader_color .. "_1 " .. count
	end

	if count > 1 then
		-- Take candles from node one by one
		def.on_dig = function(pos, node, digger)
			local pn = digger:get_player_name()
			if core.is_protected(pos, pn) then
				return
			end
			local name = basename .. ":"
			if node.name:find("unlit_") then
				name = name .. "unlit_"
			end
			name = name .. color .. "_" .. count - 1

			core.swap_node(pos, { param2 = node.param2, name = name})
			if creative_server or
				core.check_player_privs(pn, "creative") then
				return
			end
			local stack
			if mcl then
				stack = core.get_node_drops(node)[1]:split(" ")[1]
			else
				stack = ItemStack(basename .. ":unlit_" .. leader_color .. "_1")
				local inv = digger:get_inventory()
			end
			core.handle_node_drops(pos,{stack},digger)
		end
	end
	if not creative_server then
		def.on_flood = function(pos, oldnode, newnode)
			core.add_item(pos, ItemStack(def.drop))
			return false
		end
	end
	if core.get_modpath("screwdriver") then
		def.on_rotate = screwdriver.rotate_simple
	end

	-- Register illuminated candle node
	if mcl then
		core.register_node(":" .. basename .. ":" .. color .. "_" .. count, def)
	else
		local nn = basename .. ":" .. color .. "_" .. count
		core.register_node(nn, def)
		if deprecated then
			core.register_alias(basename .. ":candle_" .. color .. "_" .. count, nn)
		end
	end

	-- Adapt unlit candles definition
	def = table.copy(def)
	def.mesh = "candles_3d_unlit_" .. count .. ".obj"
	def.light_source = nil
	def.tiles = {{ name = "candles_3d.png^(candles_3d-wax.png^[colorize:" .. color .. ":127)" }}

	-- Register an entry in creative iventory
	if count == 1 and ( mcl or creative_server or color == leader_color ) then
		def.description = S("A placeable @1 candle", supported_colors[color])
		def.on_construct = function(pos)
			local param2 = math.random(4) - 1 -- Always on floor
			local node = core.get_node(pos)
			core.swap_node(pos, { name = node.name, param2 = param2 })
		end
	end

	-- Register unlit node
	if mcl then
		def._on_ignite = mcl_candle_ignite
		core.register_node(":" .. basename .. ":unlit_" .. color .. "_" .. count, def)
	else
		def.on_ignite = ignite
		local nn = basename .. ":unlit_" .. color .. "_" .. count
		core.register_node(nn, def)
	end
end

for color,_ in pairs(supported_colors) do
	for i = 1, candle_count do
		register_candle(color, i)
	end
end

if mcl then -- Recipe in mineclone
	core.register_craft({
		output = basename .. ":unlit_" .. leader_color .. "_1",
		recipe = {
			{"mcl_mobitems:string","", ""},
			{"mcl_honey:honeycomb",  "", "",},
			{"",  "", "",},
		}
	})
	for c1,_ in pairs(supported_colors) do
		for c2,_ in pairs(supported_colors) do
			if c1 ~= c2 then
				core.register_craft({
					type = "shapeless",
					output = basename .. ":unlit_" .. c1 .. "_1",
					recipe = { basename .. ":unlit_" .. c2 .. "_1" ,
								"mcl_dye:" .. c1 },
				})
			end
		end
	end
	candle_recipes = candle_recipes + 1
elseif core.registered_items["farming:string"] then
	-- Recipe with bees + farming
	if core.get_modpath("bees") then
		core.register_craft({
			output = basename .. ":unlit_" .. leader_color .. "_1",
			recipe = {
				{'' , '', 'farming:string'},
				{'' ,  'bees:wax'    , '',},
				{'bees:wax' ,  ''    , '',},
			}
		})
		candle_recipes = candle_recipes + 1
	end
	-- Recipe with petz + farming
	if core.get_modpath("petz") then
		core.register_craft({
			type = "shapeless",
			output = basename .. ":unlit_" .. leader_color .. "_1",
			recipe = { "petz:beeswax_candle" }
		})
		candle_recipes = candle_recipes + 1
	end
	-- Recipe when only farming
	if candle_recipes == 0 then
		core.register_craft({
			output = basename .. ":unlit_" .. leader_color .. "_1",
			recipe = {
				{'','farming:string','',},
				{'','group:leaves'  ,'',},
				{'','group:leaves'  ,'',},
			}
		})
		candle_recipes = candle_recipes + 1
	end
end

if candle_recipes == 0 and not creative_server then
	core.log("warning", "[ Candles 3D ]: no recipe available: install bees and/or petz")
	core.log("warning", "[ Candles 3D ]: do it or use this mod via give privilege")
end

if mcl or not core.get_modpath("pie") then
	return
end

local pies = {
	pie = "Cake",
	choc = "Chocolate Cake",
	scsk = "Strawberry Cheesecake",
	coff = "Coffee Cake",
	rvel = "Red Velvet Cake",
	meat = "Meat Cake",
	bana = "Banana Cake",
	brpd = "Bread Pudding",
	orange = "Orange Pie",
}

local pie_box = {
	type = "fixed",
	fixed = {
		{-0.45, -0.5, -0.45, 0.45, 0, 0.45},
		{ -0.1, 0, -0.1, 0.1, 0.45, 0.1 }
	}
}

for pie, desc in pairs(pies) do
	for color,_ in pairs(supported_colors) do
		local pie_def = {
			drawtype = "mesh",
			paramtype = "light",
			description = desc .. " " .. S("with candle"),
			groups = { not_in_creative_inventory = 1 },
			tiles = {{ name = "candles_3d.png^(candles_3d-wax.png^[colorize:" .. color .. ":127)" },
				{ name = pie .. "_top.png" },
				{ name = pie .. "_bottom.png" },
				{ name = pie .. "_side.png" }
			},
			mesh = "candles_3d-pie_unlit.obj",
			paramtype2 = "facedir",
			collision_box = pie_box,
			selection_box = pie_box,
			use_texture_alpha = "blend",
		}
		pie_def.on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
			local itemname = itemstack:get_name()
			if itemname:sub(1,4) ~= "dye:" then
				return
			end
			local dyecolor = itemname:sub(5)
			core.swap_node(pos,
				{ param2 = node.param2,
				name = node.name:gsub(color, dyecolor)
			})
			itemstack:take_item()
			return itemstack
		end

		pie_def.on_ignite = function(pos, igniter)
			local node = core.get_node(pos)
			core.swap_node(pos,
				{ param2 = node.param2,
				name = node.name:gsub("_unlit", "")
			})
		end
		pie_def.on_punch = function(pos, node, puncher, pointed_thing)
			local pie_node = node.name:gsub(basename, "pie") .. "_0"
			pie_node = pie_node:gsub("_unlit","")
			pie_node = pie_node:gsub("_" .. color,"")
			core.swap_node(pos,
				{ param2 = node.param2,
				name = pie_node
			})
			core.handle_node_drops(pos, { basename .. ":unlit_" .. leader_color .. "_1" } , puncher)
		end
		pie_def.on_rotate = core.get_modpath("screwdriver") and screwdriver.rotate_simple,

		core.register_node(basename .. ":" .. pie .. "_unlit" .. "_" .. color, pie_def)

		pie_def = table.copy(pie_def)
		pie_def.mesh = "candles_3d-pie.obj"
		pie_def.light_source = 4
		pie_def.on_ignite = nil
		pie_def.description = desc .. " " .. S("with lighten candle")
		pie_def.tiles = {
			{	name = "candles_3d.png^(candles_3d-wax.png^[colorize:" .. color .. ":127)",
				animation = {
					type = "vertical_frames",
					aspect_w = 48,
					aspect_h = 16,
					length = 3.0,
			}},
			{ name = pie .. "_top.png" },
			{ name = pie .. "_bottom.png" },
			{ name = pie .. "_side.png" },
		}

		core.register_node(basename .. ":" .. pie .. "_" .. color, pie_def)
	end

	core.override_item("pie:" .. pie .. "_0", { on_rightclick =
		function(pos, node, clicker, itemstack, pointed_thing)
			if itemstack:get_name() ~= basename .. ":unlit_" .. leader_color .. "_1" then
				return itemstack
			end

			core.swap_node(pos,
				{ param2 = node.param2,
				name = basename .. ":" .. pie .. "_unlit_" .. leader_color })

			itemstack:take_item()
			return itemstack
		end
	})
end

-- vim: ai:noet:ts=4:sw=4:fdm=indent:syntax=lua
