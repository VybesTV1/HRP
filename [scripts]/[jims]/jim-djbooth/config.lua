print("^2Jim^7-^2DJBooth ^7v^41^7.^43^7.^42 ^2by ^1Jimathy^7")

Config = {
	Lan = "en",
	Debug = false, -- Set to true to show target locations

	Core = "qb-core",
	Menu = "qb",
	Notify = "qb",

	Locations = {
		{ -- Sisyphus Theater
			job = "public", -- "public" makes it so anyone can add music.
			enableBooth = true,
			DefaultVolume = 0.10,
			radius = 200,
			coords = vec3(206.81, 1167.8, 227.39),
			soundLoc = vec3(206.81, 1167.8, 227.39), -- Add sound origin location if you don't want the music to play from the dj booth
		},
	},
}

Loc = {}