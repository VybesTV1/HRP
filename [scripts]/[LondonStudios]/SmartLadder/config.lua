debugMode = false

setupVehicleCommand = {
    commandName = "setupvehicle",
    commandSuggestion = "Setup this smart vehicle",

    acePermissions = {
        enabled = false,
        -- This enables ace permissions on the setup vehicle command
    },
    -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
    ESX = {
        enabled = false,
        checkJob = {
            enabled = false, -- Enable this to use ESX job check
            jobs = {"fire", "firefighter"} -- A user can have any of the following jobs, allowing you to add multiple
        }
    },
    -- We've added vRP integration. All you need to do is enable it below. Then, configure if you wish to check for groups or permissions, or even both
    vRP = {
        enabled = false,
        checkGroup = {
            enabled = false, -- Enable this to use vRP group check
            groups = {"fire", "admin"}, -- A user can have any of the following groups, meaning you can add different jobs
        },
        checkPermission = {
            enabled = false, -- Enable this to use vRP permission check
            permissions = {"player.kick"} -- A user can have any of the following permissions, allowing you to add multiple
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
            permissions = {"god"}, -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
}

resetVehicleCommand = {
    commandName = "resetvehicle",
    commandSuggestion = "Reset the current smart vehicle",

    acePermissions = {
        enabled = false,
        -- This enables ace permissions on the setup vehicle command
    },
    -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
    ESX = {
        enabled = false,
        checkJob = {
            enabled = false, -- Enable this to use ESX job check
            jobs = {"fire", "firefighter"} -- A user can have any of the following jobs, allowing you to add multiple
        }
    },
    -- We've added vRP integration. All you need to do is enable it below. Then, configure if you wish to check for groups or permissions, or even both
    vRP = {
        enabled = false,
        checkGroup = {
            enabled = false, -- Enable this to use vRP group check
            groups = {"fire", "admin"}, -- A user can have any of the following groups, meaning you can add different jobs
        },
        checkPermission = {
            enabled = false, -- Enable this to use vRP permission check
            permissions = {"player.kick"} -- A user can have any of the following permissions, allowing you to add multiple
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
            permissions = {"god"}, -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
}

promptDistance = 5.0 -- This is the distance you can be from the vehicle to see the prompt to control.
soundEnabled = true 
soundVolume = 0.4

cageCommand = {
    commandName = "entercage",
    exit = "exitcage",
    enterCageSuggestion = "Enter a cage",
    exitCageSuggestion = "Exit a cage",
    enterCageDistance = 20.0, -- This is the distance you can be from the vehicle to enter the cage.
    enterCageCheck = { -- Enable this so that instead of checking distance from vehicle, it checks distance from cage.
        enabled = false,
        distance = 5.0,
        spawnAtCageOnExit = true,
    },

    acePermissions = {
        enabled = false,
        -- This enables ace permissions on the enter cage command
    },
    -- We've added ESX integration. All you need to do is enable it below and configure which jobs can use the command
    ESX = {
        enabled = false,
        checkJob = {
            enabled = false, -- Enable this to use ESX job check
            jobs = {"fire", "firefighter"} -- A user can have any of the following jobs, allowing you to add multiple
        }
    },
    -- We've added vRP integration. All you need to do is enable it below. Then, configure if you wish to check for groups or permissions, or even both
    vRP = {
        enabled = false,
        checkGroup = {
            enabled = false, -- Enable this to use vRP group check
            groups = {"fire", "admin"}, -- A user can have any of the following groups, meaning you can add different jobs
        },
        checkPermission = {
            enabled = false, -- Enable this to use vRP permission check
            permissions = {"player.kick"} -- A user can have any of the following permissions, allowing you to add multiple
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
            permissions = {"god"}, -- A user can have any of the following permissions, allowing you to add multiple
        },
    },
}

translations = {
    press = "Press",
    toControl = "to control",
    noPermission = "~r~Error~w~: You do not have permission.",
    unableToSetup = "~r~Error~w~: You are unable to setup this vehicle.",
    vehicleSetup = "~g~Success~w~: Vehicle setup.",
    vehicleReset = "~g~Success~w~: Vehicle reset.",
    inAVehicle = "~r~Error~w~: You must be in a vehicle.",
    commandParam1 = "Optional - Ladder Type",
    commandParam2 = "Select a ladder type if this vehicle supports multiple ladders",
}