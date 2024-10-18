Config.Locations = Config.Locations or {}

Config.Locations[#Config.Locations+1] = { --[[ GABZ ALTA STREET BENNYS ]]--
	Enabled = true,
	job = "queenbee",
	zones = {
		vec2(2765.5346679688, 3506.3024902344),
		vec2(2687.0441894531, 3540.8635253906),
		vec2(2671.93359375,   3505.4375),
		vec2(2657.2563476562, 3511.9497070312),
		vec2(2643.5556640625, 3473.9645996094),
		vec2(2735.0197753906, 3433.0856933594)
	},
	autoClock = { enter = false, exit = false, },
	stash = {
		{ coords = vec4(2707.59, 3497.63, 55.97, 63.54), w = 3.6, d = 0.8, },
	},
	store = {
		{ coords = vec4(-228.64, -1314.19, 31.3, 90.0), w = 3.60, d = 0.8 },
	},
	crafting = {
		{ coords = vec4(2713.06, 3477.29, 55.67, 66.63), w = 2.8, d = 1.5 },
		{ coords = vec4(2715.24, 3482.83, 55.67, 69.08), w = 2.8, d = 1.5 },
		{ coords = vec4(2717.67, 3488.47, 55.67, 66.51), w = 2.8, d = 1.5 },
		{ coords = vec4(2721.26, 3497.06, 55.67, 43.96), w = 2.8, d = 1.5 },
		{ coords = vec4(2723.61, 3502.71, 55.67, 64.28), w = 2.8, d = 1.5 },
		{ coords = vec4(2725.77, 3507.81, 55.67, 66.62), w = 2.8, d = 1.5 },
	},
	clockin = {
		{ coords = vec4(2716.53, 3457.94, 55.67, 312.47), prop = false },
	},
	manualRepair = {
		{ coords = vec4(-200.28, -1311.62, 31.3, 0.0), prop = true, },
	},
	garage = {
		spawn = vec4(-182.74, -1317.61, 30.63, 357.23),
		out = vec4(-190.62, -1311.57, 31.3, 0.0),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(2727.46, 3457.17, 55.67, 68.38), prop = true },
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