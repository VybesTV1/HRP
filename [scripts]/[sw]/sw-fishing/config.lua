Locale = {}
Config = {

	Debug = false,
	Target = 'qb-target',										-- 'qb-target' | 'ox_target'
	Skillbar = 'ox',											-- 'qb' (qb-minigames) | 'ps' (ps-ui) | 'ox' (ox_lib) | Add more in shared.lua
	ProgressBar = 'qb',											-- 'qb' (progressbar) | 'ox' (ox_lib)
	Link = 'qb-inventory/html/images/',							-- Link to your inventory images folder
	Language = 'en',											-- Language locale file you want to use
	SellMoneyType = 'cash',										-- Type of money you receive for selling items
	BuyMoneyType = 'bank',										-- Type of money you receive for buying items
	Animations = 'rpemotes',									-- 'rpemotes' | Add more in shared.lua

	Dispatch = { name = 'ps-dispatch', chance = 20 },			-- Dispatch resource name and percentage chance for police to be called when illegal fish are caught
	
	FishingAnimation = 'fishing1',								-- Animation used for fishing
	DigAnimation = 'dig',										-- Animation used for digging
	SoilDigTime = 8,											-- How long in seconds to dig up soil
	BaitRespawnTime = 60,										-- How long until you can dig in an area you've already dug
	FishWaitTime = {20, 45},									-- Seconds it takes for a fish to bite
	XPIncrease = { legal = 2, exotic = 4 },						-- How much XP is gained for catching legal and exotic fish

	RiverFish = {												-- Prices are (price + weight). You can set a base price for all fish, then adjust fish weight accordingly
		[1] = { name = 'bream', price = 20, weight = {1, 8} },
		[2] = { name = 'pike', price = 300, weight = {2, 60} },
		[3] = { name = 'rainbowtrout', price = 20, weight = {6, 8} },
		[4] = { name = 'salmon', price = 20, weight = {3, 50} },
		[5] = { name = 'smallmouthbass', price = 20, weight = {2, 10} },
	},
	LakeFish = {
		[1] = { name = 'bullhead', price = 20, weight = {2, 20} },
		[2] = { name = 'carp', price = 20, weight = {4, 30} },
		[3] = { name = 'chub', price = 20, weight = {1, 5} },
		[4] = { name = 'largemouthbass', price = 20, weight = {2, 20} },
		[5] = { name = 'sturgeon', price = 300, weight = {6, 310} },
	},
	OceanFish = {
		[1] = { name = 'clam', price = 20, weight = {1, 1} },
		[2] = { name = 'clownfish', price = 20, weight = {1, 7} },
		[3] = { name = 'cod', price = 20, weight = {11, 26} },
		[4] = { name = 'crab', price = 20, weight = {1, 5} },
		[5] = { name = 'flounder', price = 20, weight = {1, 7} },
		[6] = { name = 'mackerel', price = 20, weight = {1, 5} },
		[7] = { name = 'mussel', price = 20, weight = {1, 1} },
	},
	ExoticFish = {
		[0] = { xp = 0, chance = 10, name = 'stingray', price = 100, weight = {25, 75} },
		[1] = { xp = 50, chance = 10, name = 'dolphin', price = 100, weight = {150, 225} },
		[2] = { xp = 200, chance = 10, name = 'hammerheadshark', price = 100, weight = {200, 400} },
		[3] = { xp = 350, chance = 10, name = 'tigershark', price = 100, weight = {425, 875} },
		[4] = { xp = 500, chance = 5, name = 'killerwhale', price = 100, weight = {1850, 2750} },
	},
	EquipmentTypes = {
		[1] = { name = 'fishingrod', price = 125 },
		[2] = { name = 'fishingbait', price = 10 },
		[3] = { name = 'shovel', price = 75 },
		[4] = { name = 'anchor', price = 350 },
	},
	IllegalFishingZones = {
		vector3(-2228.04, -1868.32, -0.2),
	}
}

Fishery = {
	[1] = { name = 'Fishery', location = vector4(-1816.63, -1193.36, 14.3, 330.93), seller = 'legal', model = `s_m_y_busboy_01`, scenario = "WORLD_HUMAN_CLIPBOARD", sprite = 68, colour = 3, enableBlip = true },
	[2] = { name = 'Fishery', location = vector4(-3275.45, 964.59, 8.35, 312.12), seller = 'legal', model = `s_m_y_busboy_01`, scenario = "WORLD_HUMAN_CLIPBOARD", sprite = 68, colour = 3, enableBlip = true },
	[3] = { name = 'Fishery', location = vector4(-1593.06, 5203.02, 4.31, 346.59), seller = 'legal', model = `s_m_y_busboy_01`, scenario = "WORLD_HUMAN_CLIPBOARD", sprite = 68, colour = 3, enableBlip = true },
	[4] = { name = 'Exotic Fishery', location = vector4(-1597.16, -937.93, 8.78, 51.58), seller = 'exotic', model = `cs_tom`, scenario = "WORLD_HUMAN_CLIPBOARD", sprite = 68, colour = 1, enableBlip = false },
}

Bait = {
	[1] = { location = vector3(-1718.36, -1053.03, 2.05), },
	[2] = { location = vector3(-1740.19, -1043.86, 1.6), },
	[3] = { location = vector3(-1760.38, -1017.67, 2.13), },
	[4] = { location = vector3(-1795.36, -1002.54, 1.53), },
	[5] = { location = vector3(-1807.72, -971.87, 2.28), },
	[6] = { location = vector3(-1813.71, -938.87, 2.31), },
	[7] = { location = vector3(-1833.39, -910.48, 1.61), },
	[8] = { location = vector3(-1837.93, -883.34, 2.8), },
	[9] = { location = vector3(-1861.85, -867.32, 1.74), },
	[10] = { location = vector3(-1869.22, -847.03, 2.82), },
	[11] = { location = vector3(-1890.03, -832.11, 1.76), },
	[12] = { location = vector3(-1896.7, -813.26, 2.9), },
	[13] = { location = vector3(-1916.68, -794.75, 2.11), },
	[14] = { location = vector3(-1926.18, -771.76, 2.87), },
	[15] = { location = vector3(-1949.52, -755.22, 1.89), },
	[16] = { location = vector3(-1956.12, -735.58, 2.88), },
	[17] = { location = vector3(-1988.26, -705.48, 2.15), },
	[18] = { location = vector3(-2003.72, -674.22, 2.76), },
	[19] = { location = vector3(-2034.42, -649.48, 2.08), },
	[20] = { location = vector3(-2055.75, -617.15, 2.9), },
	[21] = { location = vector3(-2082.1, -599.27, 2.14), },
	[22] = { location = vector3(-2091.39, -584.06, 2.8), },
	[23] = { location = vector3(-2109.65, -566.3, 2.72), },
	[24] = { location = vector3(-1626.08, -1135.17, 1.56), },
	[25] = { location = vector3(-1611.59, -1148.8, 1.46), },
	[26] = { location = vector3(-1601.9, -1175.97, 1.4), },
	[27] = { location = vector3(-1584.67, -1200.57, 1.62), },
	[28] = { location = vector3(-1566.61, -1232.03, 1.39), },
	[29] = { location = vector3(-1540.09, -1261.59, 1.87), },
	[30] = { location = vector3(-1532.74, -1302.4, 1.5), },
	[31] = { location = vector3(-1514.27, -1335.31, 2.05), },
	[32] = { location = vector3(-1506.32, -1386.86, 1.65), },
	[33] = { location = vector3(-1485.99, -1431.39, 1.87), },
	[34] = { location = vector3(-1492.06, -1465.11, 1.72), },
	[35] = { location = vector3(-1466.44, -1496.5, 1.64), },
	[36] = { location = vector3(-1442.22, -1518.2, 1.93), },
	[37] = { location = vector3(-1431.5, -1557.46, 1.55), },
	[38] = { location = vector3(-1409.73, -1581.37, 2.05), },
	[39] = { location = vector3(-1406.43, -1615.22, 1.27), },
	[40] = { location = vector3(-1376.65, -1644.49, 1.98), },
	[41] = { location = vector3(-1359.41, -1681.87, 1.66), },
	[42] = { location = vector3(-1337.31, -1704.72, 1.96), },
	[43] = { location = vector3(-1317.97, -1749.96, 1.33), },
	[44] = { location = vector3(-1288.45, -1775.68, 1.84), },
	[45] = { location = vector3(-1276.27, -1810.99, 1.44), },
	[46] = { location = vector3(-1246.62, -1850.31, 1.82), },
	[47] = { location = vector3(-3303.22, 957.74, 2.06), },
	[48] = { location = vector3(-3301.08, 948.81, 2.04), },
	[49] = { location = vector3(-3296.65, 941.62, 2.02), },
	[50] = { location = vector3(-3290.2, 934.4, 2.06), },
	[51] = { location = vector3(-3283.92, 926.07, 2.01), },
	[52] = { location = vector3(-3303.41, 987.84, 2.02), },
	[53] = { location = vector3(-3300.96, 997.55, 2.03), },
	[54] = { location = vector3(-3298.67, 1007.3, 1.7), },
	[55] = { location = vector3(-3297.33, 1021.5, 2.31), },
	[56] = { location = vector3(-3299.23, 1035.72, 2.49), },
	[57] = { location = vector3(-1409.22, 5213.74, 2.91), },
	[58] = { location = vector3(-1403.39, 5226.14, 3.65), },
	[59] = { location = vector3(-1396.5, 5237.23, 3.75), },
	[60] = { location = vector3(-1389.73, 5252.93, 3.43), },
	[61] = { location = vector3(-1385.41, 5271.61, 3.4), },
	[62] = { location = vector3(-1383.22, 5292.28, 2.64), },
	[63] = { location = vector3(-1382.47, 5307.71, 2.27), },
	[64] = { location = vector3(-1384.25, 5324.76, 2.41), },
	[65] = { location = vector3(-1389.12, 5342.05, 2.22), },
}