Config.Locations = Config.Locations or {}

Config.Locations[#Config.Locations+1] = { --[[ GABZ ALTA STREET BENNYS ]]--
	Enabled = true,
	job = "queenbee",
	zones = {
		vec2(2765.5346679688, 3506.3024902344),
		vec2(2687.0441894531, 3540.8635253906),
		vec2(2671.93359375, 3505.4375),
		vec2(2657.2563476562, 3511.9497070312),
		vec2(2643.5556640625, 3473.9645996094),
		vec2(2735.0197753906, 3433.0856933594)
	},
	autoClock = { enter = false, exit = false, },
	stash = {

	},
	store = {

	},
	crafting = {
		{ coords = vec4(2712.34, 3477.66, 55.67, 90.0), w = 3.0, d = 0.5 },
		{ coords = vec4(2714.71, 3483.17, 55.67, 90.0), w = 3.0, d = 0.5 },
		{ coords = vec4(2717.02, 3488.66, 55.67, 90.0), w = 3.0, d = 0.5 },
		{ coords = vec4(2720.67, 3497.43, 55.67, 90.0), w = 3.0, d = 0.5 },
		{ coords = vec4(2722.94, 3502.91, 55.67, 90.0), w = 3.0, d = 0.5 },
		{ coords = vec4(2725.28, 3508.42, 55.67, 90.0), w = 3.0, d = 0.5 },
	},
	clockin = {
		{ coords = vec4(2726.15, 3456.25, 55.67, 181.72), prop = false },
	},
	manualRepair = {
		{ coords = vec4(2757.24, 3485.21, 55.55, 249.07), prop = true, },
	},
	carLift = {

    },
	garage = {
		spawn = vec4(-182.74, -1317.61, 30.63, 357.23),
		out = vec4(-190.62, -1311.57, 31.3, 0.0),
		list = { "towtruck", "panto", "slamtruck", "cheburek", "utillitruck3" },
		prop = true
	},
	payments = {
		img = "https://static.wikia.nocookie.net/gtawiki/images/b/be/BennysOriginalMotorWorks-GTAO-Logo.png",
		{ coords = vec4(2726.85, 3457.5, 55.59, 90), prop = true },
	},
	Restrictions = {
		Vehicle = { "Compacts", "Sedans", "SUVs", "Coupes", "Muscle", "Sports Classics", "Sports", "Super", "Motorcycles", "Off-road", "Industrial", "Utility", "Vans", "Cycles", "Service", "Emergency", "Commercial", },
		Allow = { "tools", "cosmetics", "repairs", "nos", "perform" },
	},
	blip = {
		coords = vec3(2725.13, 3489.09, 55.67),
		label = "Queen Bee Mechanics",
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