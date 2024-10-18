main = {
    fanCommand = "fan",
    stabilisersCommand = "stabilisers",
    spreadersCommand = "spreaders",
    stabilisersModel = `prop_stabilisers`,
    fanModel = `prop_fan_fire`, -- prop_fan_fire
    spreadersModel = `prop_spreader1`,
    spreadersModel2 = `prop_spreader2`,
    smokeRemovalRadius = 50.0,
    animDict = "weapons@heavy@minigun",
    animName = "idle_2_aim_right_med",
    boneId = 57005,
    delaySmokeRemoval = 20, -- delay smoke removal by 20 seconds
    fanSoundDistance = 30.0,
    spreadersSoundDistance = 25.0,
    spreadersSoundVolume = 0.2,
    fanSoundVolume = 0.2,
    commandFan = "fan",
    acePermissionsEnabled = false,
    offSet = {0.39, 0.2, -0.1},
    rotation = {0.0, 0.0, 220.0},
}

-- These are the job checks for all fire tool commands
jobCheck = {
    itemsEnabled = { -- If set to true, commands will no longer work. Only available for frameworks
        enabled = false,
        oxInventory = false,
        quasarInventory = false, -- Enable QB/ESX below aswell
        coreInventory = false, -- Enable QB/ESX below aswell
        fanItem = "fan",
        spreadersItem = "spreaders",
        stabilisersItem = "stabilisers",
        
    },
    ESX = {
        enabled = false,
        checkJob = {
            enabled = false, -- Enable this to use ESX job check
            jobs = {"firefighter"} -- A user can have any of the following jobs, allowing you to add multiple
        }
    },
    -- We've added vRP integration. All you need to do is enable it below. Then, configure if you wish to check for groups or permissions, or even both
    vRP = {
        enabled = false,
        checkGroup = {
            enabled = false, -- Enable this to use vRP group check
            groups = {"firefighter"}, -- A user can have any of the following groups, meaning you can add different jobs
        },
        checkPermission = {
            enabled = false, -- Enable this to use vRP permission check
            permissions = {"player.firefighter"} -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
    -- We've added QBCore integration. All you need to do is enable it below. Then, configure if you wish to check for jobs or permissions, or even both
    QBCore = {
        enabled = true,
        checkJob = {
            enabled = true, -- Enable this to use QBCore job check
            jobs = {"firefighter"}, -- A user can have any of the following jobs, meaning you can add different jobs
        },
        checkPermission = {
            enabled = true, -- Enable this to use QBCore permission check
            permissions = {"player.firefighter"}, -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
}


translations = {
    returnItemCommand = "returnitems",
    returnItemKey = "G",
    returnItemKeyDescription = "Returns FireTools back to your inventory.",
    fanSuggestion = "Setup and use an extractor fan",
    fanHelp = "Setup or remove an extractor fan",
    stabilisersSuggestion = "Use stabilisers on the nearest vehicle",
    stabilisersHelp = "Setup or remove stabilisers on the nearest vehicle",
    spreadersSuggestion = "Get out and use hydraulic spreaders",
    fanRemoved = "~g~Success~w~: Fan removed",
    noFanFound = "~r~Error~w~: No fan found",
    fanSetup = "~g~Success~w~: Fan setup",
    noVehicleFound = "~r~Error~w~: No vehicle found",
    noStabilisersFound = "~r~Error~w~: No stabilisers found",
    outsideVehicle = "~r~Error~w~: You must not be inside a vehicle",
    stabilisersRemoved = "~g~Success~w~: Stabilisers removed",
    stabilisersSetupAlready = "~r~Error~w~: Stabilisers are already setup on this vehicle",
    vehicleNotFound = "Vehicle ~r~not found",
    vehicleDoorFound = "Vehicle ~g~door found",
    vehicleFound = "Vehicle ~b~found",
    setup = "setup",
    remove = "remove",
    stabilisersError = "~r~Error~w~: Use /stabilisers setup or /stabilisers remove",
    fanError = "~r~Error~w~: Use /fan setup or /fan remove",
    spreadersUsage = "Press ~b~ENTER ~w~to open or ~b~SPACE~w~ to break the vehicle door",
    stabilisersSetup = "~g~Success~w~: Stabilisers setup",
}