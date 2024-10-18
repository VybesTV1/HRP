print("^2Jim^7-^2HenHouse ^7v^42^7.^40^7.^45 ^7- ^2HenHouse Script by ^1Jimathy^7")

-- If you need support I now have a discord available, it helps me keep track of issues and give better support.

-- https://discord.gg/xKgQZ6wZvS

Config = {
	Debug = false, -- false to remove green boxes
	Lan = "en",
	img = "qb-inventory/html/images/", -- Change this to your inventory's name and image folder (SET TO "" IF YOU HAVE DOUBLE IMAGES)

	Core = "qb-core", -- set this to your core folder
	Inv = "qb", -- set to "ox" if using OX Inventory
	Menu = "qb", -- set to "ox" if using ox_lib context menus
	Notify = "qb",
	ProgressBar = "qb", -- set to "ox" if using ox_lib progressbar

	MLO = "SM", 	-- "GN" = GN Mods BlackWater Saloon	-- https://fivem.gnstud.io/package/5029845
					-- "SM" = Smokeys Free HenHouse MLO	-- https://www.youtube.com/watch?v=1h-XbJFLa_k
					-- "PR" = Prentiss Henhouse 		-- https://prentiss.tebex.io/package/4742885

	MultiCraft = true,
	MultiCraftAmounts = { [1], [5], [10] },

	JimConsumables = false, -- Enable this to disable this scripts control of food/drink items
	JimShop = false, -- Enable this to use jim-shops for buying ingredients

	--Simple Toy Reward Support
	RewardItem = "", --Set this to the name of an item eg "tille"
	RewardPool = { -- Set this to the list of items to be given out as random prizes when the item is used - can be more or less items in the list
		"",
		"",
		"",
	},
}
Location =	{
	zoneEnable = true,
	job = "henhouse", -- Set this to the required job
	label = "HenHouse",
	autoClock = { enter = false, exit = true },
	zones = {
		vec2(-304.70892333984, 6240.8828125),
		vec2(-269.72567749023, 6275.8076171875),
		vec2(-293.95980834961, 6300.6220703125),
		vec2(-329.74240112305, 6264.58203125)
	},
	blip = vec3(-301.86, 6257.68, 31.48), blipcolor = 5, blipsprite = 80, blipscale = 0.7, blipdisp = 6, blipcat = nil,
	garage = { -- Requires (https://github.com/jimathy/jim-jobgarage)
		spawn = vec4(-319.16, 6256.92, 31.0, 225.23),
		out = vec4(-317.12, 6263.83, 31.49, 135.54),
		list = {
			["cheburek"] = { colors = { 38, 38 }, },
			["burrito3"] = { colors = { 38, 38 }, },
		}
	},
	Booth = { -- Requires (https://github.com/jimathy/jim-djbooth)
		enableBooth = true, -- Set false to disable this djbooth
		DefaultVolume = 0.1, -- 0.01 is lowest, 1.0 is max
		radius = 30, -- The radius of the sound from the booth
		soundLoc = vector3(-304.01, 6262.52, 32.56),
	},
}

Ingredients = {
	DrinkItems = {
		label = "Drinks Store",
		slots = 16,
		items = {
			{ name = "cranberry", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "schnapps", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "gin", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "scotch", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "rum", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "icream", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "amaretto", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "curaco", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "vodka", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "sprunk", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "ecola", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
			{ name = "ecolalight", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
			{ name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
			{ name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 15, },
			{ name = "lime", price = 0, amount = 50, info = {}, type = "item", slot = 16, },
			},
		},
	FoodItems = {
		label = "Food Fridge Store",
		slots = 12,
		items = {
			{ name = "meat", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
			{ name = "pasta", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
			{ name = "pickle", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "fish", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
			{ name = "nachos", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
			{ name = "potato", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
			{ name = "lettuce", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
			{ name = "cheddar", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
			{ name = "chocolate", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
			{ name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
			{ name = "lime", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
			{ name = "crisps", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
		},
	},
}
Crafting = {
	Cocktails = {
		{ ['tillie'] = { ['vodka'] = 1, ['lime'] = 1,	} },
		{ ['b52'] = {	['coffee'] = 1,	['icream'] = 1,	['orange'] = 1,	} },
		{ ['brussian'] = { ['coffee'] = 1, ['vodka'] = 1,	} },
		{ ['bkamikaze'] = { ['curaco'] = 1, ['lime'] = 1, ['vodka'] = 1, } },
		{ ['cappucc'] = {	['coffee'] = 1,	['chocolate'] = 1,	} },
		{ ['ccookie'] = { ['amaretto'] = 1, ['cranberry'] = 1, } },
		{ ['iflag'] = { ['icream'] = 1, ['orange'] = 1, } },
		{ ['kamikaze'] = { ['vodka'] = 1, ['orange'] = 1, ['lime'] = 1, } },
		{ ['sbullet'] = { ['gin'] = 1, ['lime'] = 1, ['scotch'] = 1, } },
		{ ['voodoo'] = { ['coffee'] = 1, ['rum'] = 1, } },
		{ ['woowoo'] = { ['cranberry'] = 1, ['schnapps'] = 1, ['vodka'] = 1, } },
	},
	Food = {
		{ ['friedpick'] = { ['pickle'] = 1, ['cheddar'] = 1, } },
		{ ['maccheese'] = { ['pasta'] = 1, ['cheddar'] = 1, } },
		{ ['bplate'] = { ['meat'] = 1, ['pasta'] = 1, } },
		{ ['cplate'] = { ['fish'] = 1, ['potato'] = 1, } },
		{ ['splate'] = { ['meat'] = 1, ['potato'] = 1, } },
		{ ['rplate'] = { ['meat'] = 1, ['lettuce'] = 1, } },
		{ ['nplate'] = { ['nachos'] = 1, ['cheddar'] = 1, } },
		{ ['wings'] = { ['meat'] = 1, } },
	},
	Beer = {
		{ ['ambeer'] = { } },
		{ ['dusche'] = { } },
		{ ['logger'] = { } },
		{ ['pisswasser'] = { } },
		{ ['pisswasser2'] = { } },
		{ ['pisswasser3'] = { } },
	},
	Coffee = {
		{ ['coffee'] = { } },
	},
}

Loc = {}