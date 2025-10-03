--Obtain 4 planks
minetest.register_craft({
	output = "pale:wood 4",
	recipe = {
		{"pale:tree"},
	}
})

--Leaves » Dye
minetest.register_craft({
	output = "dye:white 2",
	recipe = {
		{"pale:leaves"},
	}
})

minetest.register_craft({
	output = "pale:pale_door",
	recipe = {
		{"pale:tree", "pale:tree"},
		{"pale:tree", "pale:tree"},
		{"pale:tree", "pale:tree"}
	}
})

--"Huhuhuh" -The Pyro (TF2)
minetest.register_craft({
	type = "fuel",
	recipe = "pale:tree",
	burntime = 250,
})

minetest.register_craft({
	type = "fuel",
	recipe = "pale:sapling",
	burntime = 35,
})

minetest.register_craft({
	type = "fuel",
	recipe = "pale:leaves",
	burntime = 15,
})

minetest.register_craft({
	type = "fuel",
	recipe = "pale:leaves_white",
	burntime = 15,
})