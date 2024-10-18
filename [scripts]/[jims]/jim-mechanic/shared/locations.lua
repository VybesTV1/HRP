Config.Locations = Config.Locations or {}

Config.Locations[#Config.Locations+1] = { --[[ GABZ ALTA STREET BENNYS ]]--
	Enabled = true,
	job = "mechanic",
	zones = {
		vec2(-263.99075317382, -1349.6701660156),
		vec2(-263.5015258789, -1298.9702148438),
		vec2(-229.94024658204, -1299.089477539),
		vec2(-229.81985473632, -1291.589477539),
		vec2(-216.73846435546, -1288.9470214844),
		vec2(-193.63221740722, -1294.155883789),
		vec2(-174.24346923828, -1293.1431884766),
		vec2(-151.77659606934, -1300.6693115234),
		vec2(-151.88639831542, -1311.1921386718),
		vec2(-177.41833496094, -1311.566772461),
		vec2(-177.5919342041, -1351.1942138672)
	},
	autoClock = { enter = true, exit = true, },
	stash = {
		{ coords = vec4(-226.48, -1316.17, 31.27, 0.0), w = 3.6, d = 0.8, },
	},
	store = {
		{ coords = vec4(-228.64, -1314.19, 31.3, 90.0), w = 3.60, d = 0.8 },
	},
	crafting = {
		{ coords = vec4(-214.82, -1339.74, 31.46, 90.0), w = 2.8, d = 1.5 },
		{ coords = vec4(-214.82, -1339.74, 31.46, 90.0), w = 2.8, d = 1.5 },
		{ coords = vec4(-214.82, -1339.74, 31.46, 90.0), w = 2.8, d = 1.5 },
		{ coords = vec4(-214.82, -1339.74, 31.46, 90.0), w = 2.8, d = 1.5 },
		{ coords = vec4(-214.82, -1339.74, 31.46, 90.0), w = 2.8, d = 1.5 },
		{ coords = vec4(-214.82, -1339.74, 31.46, 90.0), w = 2.8, d = 1.5 },
	},
	clockin = {
		{ coords = vec4(-195.55, -1316.46, 31.2, 181.72), prop = false },
	},
	manualRepair = {
		{ coords = vec4(-200.28, -1311.62, 31.3, 0.0), prop = true, },
	},
	carLift = {
        { coords = vec4(-201.85, -1319.65, 31.3, 19.36), useMLOLift = true },
        { coords = vec4(-221.27, -1318.71, 31.3, 352.67), useMLOLift = true },
    },
	garage = {
		spawn = vec4(-182.74, -1317.61, 30.63, 357.23),
		out = vec4(-190.62, -1311.57, 31.3, 0.0),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(-192.21, -1316.34, 31.10, 285.83), prop = true },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(-211.55, -1324.55, 30.9),
		label = "Bennys Original Motorworks",
		color = 1,
		sprite = 446,
		disp = 6,
		scale = 0.7,
		cat = nil,
		previewImg = "https://i.imgur.com/kKC2Mw2.png",
	},
	discord = {
		link = "",
		color = 16711680,
	}
}