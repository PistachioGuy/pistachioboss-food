minetest.register_craftitem("mexican:salsa", {
	description = "Salsa",
	inventory_image="mexican_salsa.png",
	on_use = minetest.item_eat(2, "farming:bowl 1")
})
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
minetest.register_craft({
	type = "shapeless",
	output = "mexican:salsa 1",
	recipe = {"farming:bowl", farming.recipe_items.mortar_pestle, "farming:chili_pepper", "farming:onion", "farming:garlic", "farming:tomato", "farming:salt"},
	replacements = {{"farming:mortar_pestle", "farming:mortar_pestle"}}
})
print("Loaded mexican food mod! Made with love by pistachioguy and Da_boss23.")
