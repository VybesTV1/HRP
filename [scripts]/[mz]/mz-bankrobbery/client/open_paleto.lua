local inBankCardAZone = false
local currentLocker = 0
local copsCalled = false

-- Functions

--- This will load an animation dictionary so you can play an animation in that dictionary
--- @param dict string
--- @return nil
local function loadAnimDict(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(0)
    end
end

-- Events

CreateThread(function()
    exports[Config.TargetEx]:AddBoxZone("letosafedoor", vector3(-105.95, 6472.12, 31.63), 0.4, 0.2, {
        name = "letosafedoor",
        heading = 315,
        debugPoly = false,
        minZ = 28.23,
        maxZ = 32.23,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-bankrobbery:client:BreachSafe",
                icon = 'fas fa-laptop',
                label = 'Access Mainframe'
            },
        },
        distance = 1.2,
     })
end)

--------------
--INNER DOOR--
--------------

CreateThread(function()
    exports[Config.TargetEx]:AddBoxZone("letoinnerdoorframe", vector3(-105.91, 6475.61, 31.63), 1.8, 0.6, {
        name = "letoinnerdoorframe",
        heading = 45,
        debugPoly = false,
        minZ = 29.03,
        maxZ = 33.03,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-bankrobbery:client:AccessLetoInnerChamber",
                icon = 'fas fa-laptop',
                label = 'Breach door'
            },
        },
        distance = 1.2,
     })
end)

-- Threads

CreateThread(function()
    for k in pairs(Config.BigBanks["paleto"]["lockers"]) do
        if Config.UseTarget then
            exports[Config.TargetEx]:AddBoxZone('paleto_coords_locker_'..k, Config.BigBanks["paleto"]["lockers"][k]["coords"], 1.0, 1.0, {
                name = 'paleto_coords_locker_'..k,
                heading = Config.BigBanks["paleto"]["heading"].closed,
                minZ = Config.BigBanks["paleto"]["lockers"][k]["coords"].z - 1,
                maxZ = Config.BigBanks["paleto"]["lockers"][k]["coords"].z + 1,
                debugPoly = false
            }, {
                options = {
                    {
                        action = function()
                            SkillCheckopenLocker("paleto", k)
                        end,
                        canInteract = function()
                            return not IsDrilling and Config.BigBanks["paleto"]["isOpened"] and not Config.BigBanks["paleto"]["lockers"][k]["isBusy"] and not Config.BigBanks["paleto"]["lockers"][k]["isOpened"]
                        end,
                        icon = 'fa-solid fa-vault',
                        label = Lang:t("general.break_safe_open_option_target"),
                    },
                },
                distance = 1.5
            })
        else
            local lockerZone = BoxZone:Create(Config.BigBanks["paleto"]["lockers"][k]["coords"], 1.0, 1.0, {
                name = 'paleto_coords_locker_'..k,
                heading = Config.BigBanks["paleto"]["heading"].closed,
                minZ = Config.BigBanks["paleto"]["lockers"][k]["coords"].z - 1,
                maxZ = Config.BigBanks["paleto"]["lockers"][k]["coords"].z + 1,
                debugPoly = false
            })
            lockerZone:onPlayerInOut(function(inside)
                if inside and not IsDrilling and Config.BigBanks["paleto"]["isOpened"] and not Config.BigBanks["paleto"]["lockers"][k]["isBusy"] and not Config.BigBanks["paleto"]["lockers"][k]["isOpened"] then
                    exports[Config.CoreEx]:DrawText(Lang:t("general.break_safe_open_option_drawtext"), 'right')
                    currentLocker = k
                else
                    if currentLocker == k then
                        currentLocker = 0
                        exports[Config.CoreEx]:HideText()
                    end
                end
            end)
        end
    end
    if not Config.UseTarget then
        while true do
            local sleep = 1000
            if isLoggedIn then
                if currentLocker ~= 0 and not IsDrilling and Config.BigBanks["paleto"]["isOpened"] and not Config.BigBanks["paleto"]["lockers"][currentLocker]["isBusy"] and not Config.BigBanks["paleto"]["lockers"][currentLocker]["isOpened"] then
                    sleep = 0
                    if IsControlJustPressed(0, 38) then
                        exports[Config.CoreEx]:KeyPressed()
                        Wait(500)
                        exports[Config.CoreEx]:HideText()
                        if CurrentCops >= Config.MinimumPaletoPolice then
                            SkillCheckopenLocker("paleto", currentLocker)
                        else
                            if Config.NotifyType == 'qb' then
                                QBCore.Functions.Notify(Lang:t("error.minimum_police_required", {police = Config.MinimumPacificPolice}), "error", 3500)
                            elseif Config.NotifyType == "okok" then
                                exports['okokNotify']:Alert("NEED MORE COPS", Lang:t("error.minimum_police_required", {police = Config.MinimumPacificPolice}), 3500, "error")
                            end
                        end
                        sleep = 1000
                    end
                end
            end
            Wait(sleep)
        end
    end
end)