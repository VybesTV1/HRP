Config = {}
Config.Locale = 'en'
Config.Debug = false

Config.TargetScript = 'qb-target'  --don't change the name if you are using ox_target
Config.SocietyInManagement = true --enable if your society is inside qb-management

Config.JobNames  = {
    ['ambulance'] = true,
    ['firefighter'] = false,
}

Config.MaxHealth = 200
Config.BleedOutTime = 60 * 4 --seconds
Config.BrainDeadTime = 60 * 10 --seconds
Config.ForceRespawnWait = 60 * 3 --seconds
Config.AutoRespawnAfterBrainDead = false

Config.CrawlEnabled = false --crawl when down
Config.MuteDeadPlayer = true
Config.KeepDeadPlayerInsideVehicle = true

Config.SetCrutchAfterCheckin = false -- require ak47_qb_crutch
Config.CrutchTimer = 5 -- 5 minutes

Config.Blips = {
    {label = 'Pillbox Hospital', pos = vector3(307.06, -595.07, 43.28), sprite = 61, size = 0.7, color = 2},
}

Config.DisableForceRespawnWhenOnlineEms = 5

Config.CombatLogAutoRespawn = true
Config.CombatLogPunishment = { --after relog
    RemoveMoney         = false,
    RemoveItems         = true,
    RemoveWeapons       = true,
    IgnoreItemList = {
        water       = true,
        bread       = true,
        money       = true,
        black_money = true,
    },
    IgnoreLoadoutList = {
        WEAPON_PISTOL = true,
    },
}

Config.ForceRespawnPunishment = { --hold E to respawn
    RemoveMoney         = false,
    RemoveItems         = true,
    RemoveWeapons       = true,
    IgnoreItemList = {
        water       = true,
        bread       = true,
        money       = true,
        black_money = true,
    },
    IgnoreLoadoutList = {
        WEAPON_PISTOL = true,
    },
}

Config.AutoRespawnPunishment = { --after brain dead
    RemoveMoney         = false,
    RemoveItems         = true,
    RemoveWeapons       = true,
    IgnoreItemList = {
        water       = true,
        bread       = true,
        money       = true,
        black_money = true,
    },
    IgnoreLoadoutList = {
        WEAPON_PISTOL = true,
    },
}

Config.RespawnOptions = {
    {
        Name = 'Pillbox Hospital',
        Description = 'Transport Fee: $500 | Medical Fee: $1000',
        TotalCost = 1500,
        Transport = false,
        Vehicle = 'ambulance',
        Offset = vector3(0.0, -2.5, -0.4), --attach offset
        Gps = vector3(363.99, -592.57, 28.68),
        TransportTimeOut = 60 * 5,
    },
    --[[
    {
        Name = 'Central Hospital',
        Description = 'Transport Fee: $800 | Medical Fee: $3000',
        TotalCost = 3800,
        Transport = true,
        Vehicle = 'fordambo',
        Offset = vector3(0.0, -3.0, 0.4), --attach offset
        Gps = vector3(295.49, -1440.09, 29.8),
        TransportTimeOut = 60 * 5,
    },
    ]]
}

Config.PlayForTask = {
    revive      = 1000,
    cpr         = 1000,
    cpradvanced = 500,
    bandage     = 200,
    neckbrace   = 200,
    bodybandage = 200,
    armbrace    = 200,
    legbrace    = 200,
    morphine30  = 200,
    saline      = 100,
    firstaid    = 100,
    medikit     = 100,
}

Config.IgnoreAnims = { --death & down animation will be skiped if player using animations below
    {dir = 'missfinale_c2mcs_1', anim = 'fin_c2_mcs_1_camman'}, --carry
    {dir = 'move_injured_ground', anim = 'front_loop'}, --crawl
}

