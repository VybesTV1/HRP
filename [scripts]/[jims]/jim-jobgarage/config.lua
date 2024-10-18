print("^2Jim^7-^2JobGarage ^7v^41^7.^44^7.^43 ^7- ^2Job Garage Script by ^1Jimathy^7")

Loc = {}

--[[	LIST OF POSSIBLE VEHICLE MODIFIERS   ]]--
-- Using these will change how each vehicle spawns
-- This can be used for making sure the vehicles comes out exactly how you want it to

-- CustomName = "Police Car", this will show a custom override name for your vehicles so you don't need to add them to your vehicles.lua
-- rank = { 2, 4 }, -- This specifes which grades can see it, and only these grades
-- grade = 4, -- This specifies the lowest grade and above that can see the vehicle
-- colors = { 136, 137 }, -- This is the colour index id of the vehicle, Primary and Secondary in that order
-- bulletproof = true, -- This determines if the tyres are bullet proof (don't ask me why, I was asked to add this)
-- livery = 1, -- This sets the livery id of the vehicle, (most mod menus would number them or have them in number order) 0 = stock
-- extras = { 1, 5 }, -- This enables the selected extras on the vehicle
-- performance = "max", this sets the stats to max if available
-- performance = { 2, 3, 3, 2, 4, true }, -- This allows more specific settings for each upgrade level, in order: engine, brakes, suspension, transmission, armour, turbo
-- trunkItems = { }, -- Use this to add items to the trunk of the vehicle when it is spawned

-- ANY VEHICLE, BOATS, POLICE CARS, EMS VEHICLES OR EVEN PLANES CAN BE ADDED.

Config = {
	Debug = false,  -- Enable to use debug features
	Lan = "en",

	Core = "qb-core",
	Menu = "qb",
	Notify = "qb",

	Fuel = "cdn-fuel", -- Set this to your fuel script folder

	CarDespawn = true, -- Sends the vehicle to hell (removal animation)

	DistCheck = false, -- Require the vehicle to be near by to remove it

	Locations = {
		{ 	zoneEnable = true,
			job = "firefighter",
			garage = {
				spawn = vec4(-1035.44, -1383.96, 5.15, 75.20),
				out = vec4(-1027.32, -1385.08, 4.99, 85.81),
				list = {
					["rearmount"] = {
						CustomName = "rearmount"
					},
					["lsfd"] = {
						CustomName = "lsfd"
					},
					["lsfd2"] = {
						CustomName = "lsfd2"
					},
					["lsfd4"] = {
						CustomName = "lsfd4"
					},
					["lsfd5"] = {
						CustomName = "lsfd5"
					},
					["lsfdtruck"] = {
						CustomName = "lsfdtruck"
					},
					["lsfdtruck2"] = {
						CustomName = "lsfdtruck2"
					},
					["lsfdtruck3"] = {
						CustomName = "lsfdtruck3"
					},
				},
			},
		},
	},
}
