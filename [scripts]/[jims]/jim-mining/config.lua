print("^2Jim-Mining ^7v^4"..GetResourceMetadata(GetCurrentResourceName(), 'version', nil):gsub("%.", "^7.^4").."^7 - ^2Mining Script by ^1Jimathy^7")

Loc = {}

Config = {
	Debug = false, -- enable debug mode
	img = "qb-inventory/html/images/", --Set this to the image directory of your inventory script or "nil" if using newer qb-menu

	Lan = "en", -- Pick your language here

	JimShops = false, 		-- Set this to true if using jim-shops

	Inv = "qb",				--"qb" or "ox"
	Menu = "qb",			--"qb" or "ox"
	ProgressBar = "qb",		--"qb" or "ox"
	Notify = "qb",			--"qb" or "ox"

	DrillSound = true,		-- disable drill sounds

	MultiCraft = true,		-- Enable multicraft
	MultiCraftAmounts = { [1], [5], [10] },

	K4MB1Prop = false, -- Enable this to make use of K4MB1's ore props provided with their Mining Cave MLO

	Timings = { -- Time it takes to do things
		["Cracking"] = math.random(5000, 10000),
		["Washing"] = math.random(10000, 12000),
		["Panning"] = math.random(25000, 30000),
		["Pickaxe"] = math.random(15000, 18000),
		["Mining"] = math.random(10000, 15000),
		["Laser"] = math.random(7000, 10000),
		["OreRespawn"] = math.random(55000, 75000),
		["Crafting"] = 5000,
	},

	CrackPool = { -- Rewards from cracking stone
		"carbon",
		"copperore",
		"ironore",
		"metalscrap",
	},

	WashPool = {	-- Rewards from washing stone
		"goldore",
		"uncut_ruby",
		"uncut_emerald",
		"uncut_diamond",
		"uncut_sapphire",
		"goldore",
	},

	PanPool = {		-- Rewards from panning
		"can",
		"goldore",
		"can",
		"goldore",
		"bottle",
		"stone",
		"goldore",
		"bottle",
		"can",
		"silverore",
		"can",
		"silverore",
		"bottle",
		"stone",
		"silverore",
		"bottle",
	},

------------------------------------------------------------
	OreSell = { -- List of ores you can sell to the buyer npc
		"goldingot",
		"silveringot",
		"copperore",
		"ironore",
		"goldore",
		"silverore",
		"carbon",
	},

	SellingPrices = { -- Selling Prices
		['copperore'] = 25,
		['goldore'] = 25,
		['silverore'] = 25,
		['ironore'] = 25,
		['carbon'] = 25,

		['goldingot'] = 50,
		['silveringot'] = 50,

		['uncut_emerald'] = 20,
		['uncut_ruby'] = 20,
		['uncut_diamond'] = 20,
		['uncut_sapphire'] = 20,

		['emerald'] = 50,
		['ruby'] = 50,
		['diamond'] = 50,
		['sapphire'] = 50,

		['diamond_ring'] = 75,
		['emerald_ring'] = 75,
		['ruby_ring'] = 75,
		['sapphire_ring'] = 75,
		['diamond_ring_silver'] = 75,
		['emerald_ring_silver'] = 75,
		['ruby_ring_silver'] = 75,
		['sapphire_ring_silver'] = 75,

		['diamond_necklace'] = 100,
		['emerald_necklace'] = 100,
		['ruby_necklace'] = 100,
		['sapphire_necklace'] = 100,
		['diamond_necklace_silver'] = 100,
		['emerald_necklace_silver'] = 100,
		['ruby_necklace_silver'] = 100,
		['sapphire_necklace_silver'] = 100,

		['diamond_earring'] = 45,
		['emerald_earring'] = 45,
		['ruby_earring'] = 45,
		['sapphire_earring'] = 45,
		['diamond_earring_silver'] = 45,
		['emerald_earring_silver'] = 45,
		['ruby_earring_silver'] = 45,
		['sapphire_earring_silver'] = 45,

		['gold_ring'] = 55,
		['goldchain'] = 55,
		['goldearring'] = 55,
		['silver_ring'] = 55,
		['silverchain'] = 55,
		['silverearring'] = 55,

	},
------------------------------------------------------------
--Mining Store Items
	Items = {
		label = "Mining Store",  slots = 5,
		items = {
			{ name = "goldpan", price = 150, amount = 100, info = {}, type = "item", slot = 1, },
			{ name = "pickaxe",	price = 275, amount = 100, info = {}, type = "item", slot = 2, },
			{ name = "miningdrill",	price = 15000, amount = 50, info = {}, type = "item", slot = 3, },
			{ name = "mininglaser",	price = 45000, amount = 5, info = {}, type = "item", slot = 4, },
			{ name = "drillbit", price = 25, amount = 100, info = {}, type = "item", slot = 5, },
		},
	},
}
Crafting = {
	SmeltMenu = {
		{ ["copper"] = { ["copperore"] = 5 } },
		{ ["goldingot"] = { ["goldore"] = 5 } },
		{ ["goldingot"] = { ["goldchain"] = 5 } },
		{ ["goldingot"] = { ["gold_ring"] = 5 } },
		{ ["silveringot"] = { ["silverore"] = 5 } },
		{ ["silveringot"] = { ["silverchain"] = 5 } },
		{ ["silveringot"] = { ["silver_ring"] = 5 } },
		{ ["iron"] = { ["ironore"] = 5 } },
		{ ["steel"] = { ["ironore"] = 5, ["carbon"] = 5 } },
		{ ["aluminum"] = { ["can"] = 5, }, ['amount'] = 5 },
		{ ["glass"] = { ["bottle"] = 5, }, ['amount'] = 5 },
	},
	GemCut = {
		{ ["emerald"] = { ["uncut_emerald"] = 1, } },
		{ ["diamond"] = { ["uncut_diamond"] = 1}, },
		{ ["ruby"] = { ["uncut_ruby"] = 1 }, },
		{ ["sapphire"] = { ["uncut_sapphire"] = 1 }, },
	},
	RingCut = {
		{ ["gold_ring"] = { ["goldingot"] = 1 }, ['amount'] = 3 },
		{ ["silver_ring"] = { ["silveringot"] = 1 }, ['amount'] = 3 },
		{ ["diamond_ring"] = { ["gold_ring"] = 1, ["diamond"] = 1 }, },
		{ ["emerald_ring"] = { ["gold_ring"] = 1, ["emerald"] = 1 }, },
		{ ["ruby_ring"] = { ["gold_ring"] = 1, ["ruby"] = 1 }, },
		{ ["sapphire_ring"] = { ["gold_ring"] = 1, ["sapphire"] = 1 }, },

		{ ["diamond_ring_silver"] = { ["silver_ring"] = 1, ["diamond"] = 1 }, },
		{ ["emerald_ring_silver"] = { ["silver_ring"] = 1, ["emerald"] = 1 }, },
		{ ["ruby_ring_silver"] = { ["silver_ring"] = 1, ["ruby"] = 1 }, },
		{ ["sapphire_ring_silver"] = { ["silver_ring"] = 1, ["sapphire"] = 1 }, },
	},
	NeckCut = {
		{ ["goldchain"] = { ["goldingot"] = 1 }, ['amount'] = 3  },
		{ ["silverchain"] = { ["silveringot"] = 1 }, ['amount'] = 3  },
		{ ["diamond_necklace"] = { ["goldchain"] = 1, ["diamond"] = 1 }, },
		{ ["ruby_necklace"] = { ["goldchain"] = 1, ["ruby"] = 1 }, },
		{ ["sapphire_necklace"] = { ["goldchain"] = 1, ["sapphire"] = 1 }, },
		{ ["emerald_necklace"] = { ["goldchain"] = 1, ["emerald"] = 1 }, },

		{ ["diamond_necklace_silver"] = { ["silverchain"] = 1, ["diamond"] = 1 }, },
		{ ["ruby_necklace_silver"] = { ["silverchain"] = 1, ["ruby"] = 1 }, },
		{ ["sapphire_necklace_silver"] = { ["silverchain"] = 1, ["sapphire"] = 1 }, },
		{ ["emerald_necklace_silver"] = { ["silverchain"] = 1, ["emerald"] = 1 }, },
	},
	EarCut = {
		{ ["goldearring"] = { ["goldingot"] = 1 }, ['amount'] = 3  },
		{ ["silverearring"] = { ["silveringot"] = 1 }, ['amount'] = 3  },
		{ ["diamond_earring"] = { ["goldearring"] = 1, ["diamond"] = 1 }, },
		{ ["ruby_earring"] = { ["goldearring"] = 1, ["ruby"] = 1 }, },
		{ ["sapphire_earring"] = { ["goldearring"] = 1, ["sapphire"] = 1 }, },
		{ ["emerald_earring"] = { ["goldearring"] = 1, ["emerald"] = 1 }, },

		{ ["diamond_earring_silver"] = { ["silverearring"] = 1, ["diamond"] = 1 }, },
		{ ["ruby_earring_silver"] = { ["silverearring"] = 1, ["ruby"] = 1 }, },
		{ ["sapphire_earring_silver"] = { ["silverearring"] = 1, ["sapphire"] = 1 }, },
		{ ["emerald_earring_silver"] = { ["silverearring"] = 1, ["emerald"] = 1 }, },
	},
}
