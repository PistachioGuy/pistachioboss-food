-- Salsa
minetest.register_craftitem("mexican:salsa", {
	description = "Salsa",
	inventory_image="mexican_salsa.png",
	on_use = minetest.item_eat(2, "farming:bowl 1")
})
minetest.register_craft({
	type = "shapeless",
	output = "mexican:salsa 1",
	recipe = {"farming:bowl", farming.recipe_items.mortar_pestle, "farming:chili_pepper", "farming:onion", "farming:garlic", "farming:tomato", "farming:salt"},
	replacements = {{"farming:mortar_pestle", "farming:mortar_pestle"}}
})



-- Diced Tomato
minetest.register_craftitem("mexican:diced_tomato", {
	description = "Diced Tomato",
	inventory_image="mexican_diced_tomato.png",
})
minetest.register_craft({
	type = "shapeless",
	output = "mexican:diced_tomato",
	recipe = {"farming:cutting_board", "farming:tomato"},
	replacements = {{"farming:cutting_board", "farming:cutting_board"}}
})


-- Masa Harina
minetest.register_craftitem("mexican:masa_harina_flour", {
	description = "Masa Harina",
	inventory_image="mexican_masa_harina_flour.png",
	groups = {food_flour = 1, flammable = 1}
})
minetest.register_craft({
	output = "mexican:masa_harina_flour 1",
	recipe = {
		{"farming:corn", "farming:corn", "farming:corn"},
		{"farming:corn", "farming:mortar_pestle", ""}
	},
	replacements = {{"farming:mortar_pestle", "farming:mortar_pestle"}}
})


-- Raw Tortilla
minetest.register_craftitem("mexican:raw_tortilla", {
	description = "Raw Tortilla",
	inventory_image="mexican_raw_tortilla.png"
})
minetest.register_craft({
	type = "shapeless",
	output = "mexican:raw_tortilla", 
	recipe = {"mexican:masa_harina_flour", "bucket:bucket_water", "farming:salt"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})
minetest.register_craftitem("mexican:raw_wheat_tortilla", {
	description = "Raw Wheat Tortilla",
	inventory_image="mexican_raw_tortilla.png"
})
minetest.register_craft({
	type = "shapeless",
	output = "mexican:raw_wheat_tortilla", 
	recipe = {"farming:flour", "bucket:bucket_water", "farming:salt"},
	replacements = {{"bucket:bucket_water", "bucket:bucket_empty"}}
})


-- Tortilla
minetest.register_craftitem("mexican:tortilla", {
	description = "Tortilla",
	inventory_image="mexican_tortilla.png",
	on_use = minetest.item_eat(1)
})
minetest.register_craftitem("mexican:wheat_tortilla", {
	description = "Wheat Tortilla",
	inventory_image="mexican_tortilla.png",
	on_use = minetest.item_eat(1)
})
minetest.register_craft({
	type = "cooking",
	output = "mexican:tortilla",
	recipe = "mexican:raw_tortilla",
	cooktime = 7
})
minetest.register_craft({
	type = "cooking",
	output = "mexican:wheat_tortilla",
	recipe = "mexican:raw_wheat_tortilla",
	cooktime = 7
})
print("Loaded mexican food mod! Made with love by pistachioguy and Da_boss23.")

-- Ground Meat

minetest.register_craftitem("mexican:ground_meat", {
	description = "Ground Meat",
	inventory_image="mexican_ground_meat.png",
})
minetest.register_craft({
	type = "shapeless",
	output = "mexican:ground_meat",
	recipe = {"group:food_meat", "farming:cutting_board"},
	replacements = {{"farming:cutting_board", "farming:cutting_board"}}
})
-- Comal pan
fireanim = {
	name="fire_basic_flame_animated.png",
	animation = {
		type = "vertical_frames",
		aspect_w = 16,
		aspect_h = 16,
		length = 1,
	}
}
minetest.register_node("mexican:comal_pan_fire", {
	description = "Comal on Fireplace",
	drawtype = "mesh",
	mesh = "fire.b3d",
	use_texture_alpha = true,
	backface_culling = false,
	light_source = 14,
	groups = {dig_immediate=3, flammable=0},
	tiles = {
		"mexican_comal.png",
		fireanim,
		"default_tree.png"
		--[["mexican_comal.png",
		fireanim,
		fireanim,
		"default_tree.png",
		"default_tree.png",
		"default_tree.png",
		"default_tree.png" --]]
	},
	-- Credit to the item frames mod for everything under on_rightclick
	on_rightclick = function(pos, node, clicker, itemstack)

		if not itemstack
		or minetest.is_protected(pos, clicker:get_player_name()) then
			return
		end

		local meta = minetest.get_meta(pos)

		if not meta then return end

		if meta:get_string("item") ~= "" then

			show_msg(clicker:get_player_name()
				.. " removed " .. meta:get_string("comal_pan_fire")
				.. " from Pedestal at " .. minetest.pos_to_string(pos))

			if should_return_item then
				return return_item(pos, "comal_pan_fire", meta, clicker, itemstack)
			else
				drop_item(pos, "comal_pan_fire", meta)
			end
		else

			local s = itemstack:take_item()

			meta:set_string("item", s:to_string())

			update_item(pos, "comal_pan_fire", node)

			show_msg(clicker:get_player_name()
				.. " inserted " .. meta:get_string("item")
				.. " into Pedestal at " .. minetest.pos_to_string(pos))

			return itemstack
		end
	end,
})
