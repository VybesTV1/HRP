local inBankCardBZone = false
local inElectronickitZone = false
local currentLocker = 0
local copsCalled = false
local FirstDoorUnlocked = false 

-- Functions

--- This will be triggered once the hack in the pacific bank is done
--- @param success boolean
--- @return nil
local function OnHackPacificDone(success)
    Config.OnHackDone(success, "pacific")
end

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

-------------------------
--FIRST DOOR - LOCKPICK--
-------------------------

CreateThread(function()
    exports[Config.TargetEx]:AddBoxZone("pacificfirstdoor", vector3(256.89, 220.42, 106.29), 2, 1, {
        name = "pacificfirstdoor",
        heading = 70,
        debugPoly = false,
        minZ = 103.49,
        maxZ = 107.49,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-bankrobbery:client:OpenFirstDoor",
                icon = 'fas fa-lock',
                label = 'Unlock Security Gate'
            },
        },
        distance = 1.2,
     })
end)

----------------------
--SECURITY CLEARANCE--
----------------------

CreateThread(function()
    exports[Config.TargetEx]:AddBoxZone("verifysecuritycard", vector3(249.99, 227.34, 106.29), 1, 1, {
        name = "verifysecuritycard",
        heading = 340,
        debugPoly = false,
        minZ = 104.89,
        maxZ = 106.89,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-bankrobbery:VerifySecCard2",
                icon = 'fas fa-laptop',
                label = 'Upload credentials'
            },
        },
        distance = 1.2,
     })
end)

--------------------
--SEC CARD 02 DOOR--
--------------------

CreateThread(function()
    exports[Config.TargetEx]:AddBoxZone("securitycardhack", vector3(262.33, 223.11, 106.28), 0.2, 1, {
        name = "securitycardhack",
        heading = 71,
        debugPoly = false,
        minZ = 103.68,
        maxZ = 107.68,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-bankrobbery:UseBankcardB",
                icon = 'fas fa-laptop-code',
                label = 'Bypass Security'
            },
        },
        distance = 1.5,
     })
end)

----------------
--TRIGGER SAFE--
----------------

CreateThread(function()
    exports[Config.TargetEx]:AddBoxZone("pacificsecondpc", vector3(265.6, 220.27, 101.68), 0.6, 1, {
        name = "pacificsecondpc",
        heading = 290,
        debugPoly = false,
        minZ = 98.28,
        maxZ = 102.28,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-bankrobbery:client:OverrideProtocol",
                icon = 'fas fa-laptop',
                label = 'Override Security'
            },
        },
        distance = 1.2,
     })
end)

-------------------
--HACK VAULT DOOR--
-------------------

CreateThread(function()
    exports[Config.TargetEx]:AddBoxZone("electronickitpacificpass", vector3(252.84, 228.57, 101.68), 0.2, 0.5, {
        name = "electronickitpacificpass",
        heading = 71,
        debugPoly = false,
        minZ = 98.48,
        maxZ = 102.48,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-bankrobbery:client:Pacific_UseElectronickit",
                icon = 'fas fa-laptop-code',
                label = 'Hack Terminal'
            },
        },
        distance = 1.5,
     })
end)

----------------------
--THERMITE PLACEMENT--
----------------------

-----------------------
--FIRST INTERNAL GATE--
-----------------------

CreateThread(function()
    if not firstdoorblown then 
        exports[Config.TargetEx]:AddBoxZone("firstvaultdoorpac", vector3(252.5, 220.88, 101.68), 1.4, 1, {
            name = "firstvaultdoorpac",
            heading = 70,
            debugPoly = false,
            minZ = 98.88,
            maxZ = 102.88,
            }, {
                options = { 
                {
                    type = "client",
                    event = "mz-bankrobbery:client:PlantExplosive",
                    icon = 'fas fa-laptop',
                    label = 'Plant Explosive'
                },
            },
            distance = 1.2,
        })
    end
end)

------------------------
--SECOND INTERNAL GATE--
------------------------

CreateThread(function()
    exports[Config.TargetEx]:AddBoxZone("secondvaultdoorpac", vector3(261.32, 215.18, 101.68), 1.4, 1.2, {
        name = "secondvaultdoorpac",
        heading = 341,
        debugPoly = false,
        minZ = 98.88,
        maxZ = 102.8,
        }, {
            options = { 
            {
                type = "client",
                event = "mz-bankrobbery:client:PlantExplosive",
                icon = 'fas fa-laptop',
                label = 'Plant Explosive'
            },
        },
        distance = 1.2,
     })
end)

-- Threads

CreateThread(function()
    local bankCardBZone = BoxZone:Create(Config.BigBanks["pacific"]["coords"][1], 1.0, 1.0, {
        name = 'pacific_coords_bankcardb',
        heading = Config.BigBanks["pacific"]["heading"].closed,
        minZ = Config.BigBanks["pacific"]["coords"][1].z - 1,
        maxZ = Config.BigBanks["pacific"]["coords"][1].z + 1,
        debugPoly = false
    })
    bankCardBZone:onPlayerInOut(function(inside)
        inBankCardBZone = inside
        -- if inside and not Config.BigBanks["pacific"]["isOpened"] then
        --     Config.ShowRequiredItems({
        --         [1] = {name = QBCore.Shared.Items["security_card_02"]["name"], image = QBCore.Shared.Items["security_card_02"]["image"]}
        --     }, true)
        -- else
        --     Config.ShowRequiredItems({
        --         [1] = {name = QBCore.Shared.Items["security_card_02"]["name"], image = QBCore.Shared.Items["security_card_02"]["image"]}
        --     }, false)
        -- end
    end)
    local electronickitZone = BoxZone:Create(Config.BigBanks["pacific"]["coords"][2], 1.0, 1.0, {
        name = 'pacific_coords_electronickit',
        heading = Config.BigBanks["pacific"]["heading"].closed,
        minZ = Config.BigBanks["pacific"]["coords"][2].z - 1,
        maxZ = Config.BigBanks["pacific"]["coords"][2].z + 1,
        debugPoly = false
    })
    electronickitZone:onPlayerInOut(function(inside)
        inElectronickitZone = inside
        -- if inside and not Config.BigBanks["pacific"]["isOpened"] then
        --     Config.ShowRequiredItems({
        --         [1] = {name = QBCore.Shared.Items["electronickit"]["name"], image = QBCore.Shared.Items["electronickit"]["image"]},
        --         [2] = {name = QBCore.Shared.Items["trojan_usb"]["name"], image = QBCore.Shared.Items["trojan_usb"]["image"]},
        --     }, true)
        -- else
        --     Config.ShowRequiredItems({
        --         [1] = {name = QBCore.Shared.Items["electronickit"]["name"], image = QBCore.Shared.Items["electronickit"]["image"]},
        --         [2] = {name = QBCore.Shared.Items["trojan_usb"]["name"], image = QBCore.Shared.Items["trojan_usb"]["image"]},
        --     }, false)
        -- end
    end)
    for k in pairs(Config.BigBanks["pacific"]["lockers"]) do
        if Config.UseTarget then
            exports[Config.TargetEx]:AddBoxZone('pacific_coords_locker_'..k, Config.BigBanks["pacific"]["lockers"][k]["coords"], 1.0, 1.0, {
                name = 'pacific_coords_locker_'..k,
                heading = Config.BigBanks["pacific"]["heading"].closed,
                minZ = Config.BigBanks["pacific"]["lockers"][k]["coords"].z - 1,
                maxZ = Config.BigBanks["pacific"]["lockers"][k]["coords"].z + 1,
                debugPoly = false
            }, {
                options = {
                    {
                        action = function()
                            SkillCheckopenLocker("pacific", k)
                        end,
                        canInteract = function()
                            return not IsDrilling and Config.BigBanks["pacific"]["isOpened"] and not Config.BigBanks["pacific"]["lockers"][k]["isBusy"] and not Config.BigBanks["pacific"]["lockers"][k]["isOpened"]
                        end,
                        icon = 'fa-solid fa-vault',
                        label = Lang:t("general.break_safe_open_option_target"),
                    },
                },
                distance = 1.5
            }) 
        else
            local lockerZone = BoxZone:Create(Config.BigBanks["pacific"]["lockers"][k]["coords"], 1.0, 1.0, {
                name = 'pacific_coords_locker_'..k,
                heading = Config.BigBanks["pacific"]["heading"].closed,
                minZ = Config.BigBanks["pacific"]["lockers"][k]["coords"].z - 1,
                maxZ = Config.BigBanks["pacific"]["lockers"][k]["coords"].z + 1,
                debugPoly = false
            })
            lockerZone:onPlayerInOut(function(inside)
                if inside and not IsDrilling and Config.BigBanks["pacific"]["isOpened"] and not Config.BigBanks["pacific"]["lockers"][k]["isBusy"] and not Config.BigBanks["pacific"]["lockers"][k]["isOpened"] then
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
                if currentLocker ~= 0 and not IsDrilling and Config.BigBanks["pacific"]["isOpened"] and not Config.BigBanks["pacific"]["lockers"][currentLocker]["isBusy"] and not Config.BigBanks["pacific"]["lockers"][currentLocker]["isOpened"] then
                    sleep = 0
                    if IsControlJustPressed(0, 38) then
                        exports[Config.CoreEx]:KeyPressed()
                        Wait(500)
                        exports[Config.CoreEx]:HideText()
                        if CurrentCops >= Config.MinimumPacificPolice then
                            SkillCheckopenLocker("pacific", currentLocker)
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