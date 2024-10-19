local QBCore = exports[Config.CoreEx]:GetCoreObject()
local robberyBusy = false
local timeOut = false

-- Functions

--- This will convert a table's keys into an array
--- @param tbl table
--- @return array
local function TableKeysToArray(tbl)
    local array = {}
    for k in pairs(tbl) do
        array[#array+1] = k
    end
    return array
end

--- This will loop over the given table to check if the power stations in the table have been hit
--- @param toLoop table
--- @return boolean
local function TableLoopStations(toLoop)
    local hits = 0
    for _, station in pairs(toLoop) do
        if type(station) == 'table' then
            local hits2 = 0
            for _, station2 in pairs(station) do
                if Config.PowerStations[station2].hit then hits2 += 1 end
                if hits2 == #station then return true end
            end
        else
            if Config.PowerStations[station].hit then hits += 1 end
            if hits == #toLoop then return true end
        end
    end
    return false
end

--- This will check what stations have been hit and update them accordingly
--- @return nil
local function CheckStationHits()
    local policeHits = {}
    local bankHits = {}
    for k, v in pairs(Config.CameraHits) do
        local allStationsHitPolice = false
        local allStationsHitBank = false
        if type(v.type) == 'table' then
            for _, cameraType in pairs(v.type) do
                if cameraType == 'police' then
                    if type(v.stationsToHitPolice) == 'table' then
                        allStationsHitPolice = TableLoopStations(v.stationsToHitPolice)
                    else
                        allStationsHitPolice = Config.PowerStations[v.stationsToHitPolice].hit
                    end
                elseif cameraType == 'bank' then
                    if type(v.stationsToHitBank) == 'table' then
                        allStationsHitBank = TableLoopStations(v.stationsToHitBank)
                    else
                        allStationsHitBank = Config.PowerStations[v.stationsToHitBank].hit
                    end
                end
            end
        else
            if v.type == 'police' then
                if type(v.stationsToHitPolice) == 'table' then
                    allStationsHitPolice = TableLoopStations(v.stationsToHitPolice)
                else
                    allStationsHitPolice = Config.PowerStations[v.stationsToHitPolice].hit
                end
            elseif v.type == 'bank' then
                if type(v.stationsToHitBank) == 'table' then
                    allStationsHitBank = TableLoopStations(v.stationsToHitBank)
                else
                    allStationsHitBank = Config.PowerStations[v.stationsToHitBank].hit
                end
            end
        end
        if allStationsHitPolice then
            policeHits[k] = true
        end
        if allStationsHitBank then
            bankHits[k] = true
        end
    end
    policeHits = TableKeysToArray(policeHits)
    bankHits = TableKeysToArray(bankHits)
    -- table.type checks if it's empty as well, if it's empty it will return the type 'empty' instead of 'array'
    if table.type(policeHits) == 'array' then Config.OnPoliceCameraHit(policeHits) end
    if table.type(bankHits) == 'array' then TriggerClientEvent("mz-bankrobbery:client:BankSecurity", -1, bankHits, false) end
end

--- This will do a quick check to see if all stations have been hit
--- @return boolean
local function AllStationsHit()
    local hit = 0
    for k in pairs(Config.PowerStations) do
        if Config.PowerStations[k].hit then
            hit += 1
        end
    end
    return hit >= Config.HitsNeeded
end

--- This will check if the given coords are in the area of the given distance of a powerstation
--- @param coords vector3
--- @param dist number
--- @return boolean
local function IsNearPowerStation(coords, dist)
    for _, v in pairs(Config.PowerStations) do
        if #(coords - v.coords) < dist then
            return true
        end
    end
    return false
end

----------
--POLICE--
----------

local cachedPoliceAmount = {}

QBCore.Functions.CreateCallback('mz-bankrobbery:server:getCops', function(source, cb)
    local src = source
    local amount = 0
    for _, v in pairs(QBCore.Functions.GetQBPlayers()) do
        if (v.PlayerData.job.name == Config.PoliceJob1 or v.PlayerData.job.name == Config.PoliceJob2 or v.PlayerData.job.name == Config.PoliceJob3) and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cachedPoliceAmount[src] = amount
    cb(amount)
end)


-- Events

RegisterNetEvent('mz-bankrobbery:server:setBankState', function(bankId)
    if robberyBusy then return end
    if bankId == "paleto" then
        if Config.BigBanks["paleto"]["isOpened"] or #(GetEntityCoords(GetPlayerPed(source)) - Config.BigBanks["paleto"]["coords"]) > 2.5 then
            return error(Lang:t("error.event_trigger_wrong", {event = "mz-bankrobbery:server:setBankState", extraInfo = " (paleto) ", source = source}))
        end
        Config.BigBanks["paleto"]["isOpened"] = true
        TriggerEvent('mz-bankrobbery:server:setTimeout')
    elseif bankId == "pacific" then
        if Config.BigBanks["pacific"]["isOpened"] or #(GetEntityCoords(GetPlayerPed(source)) - Config.BigBanks["pacific"]["coords"][2]) > 2.5 then
            return error(Lang:t("error.event_trigger_wrong", {event = "mz-bankrobbery:server:setBankState", extraInfo = " (pacific) ", source = source}))
        end
        Config.BigBanks["pacific"]["isOpened"] = true
        TriggerEvent('mz-bankrobbery:server:setTimeout')
    else
        if Config.SmallBanks[bankId]["isOpened"] or #(GetEntityCoords(GetPlayerPed(source)) - Config.SmallBanks[bankId]["coords"]) > 2.5 then
            return error(Lang:t("error.event_trigger_wrong", {event = "mz-bankrobbery:server:setBankState", extraInfo = " (smallbank "..bankId..") ", source = source}))
        end
        Config.SmallBanks[bankId]["isOpened"] = true
        TriggerEvent('mz-bankrobbery:server:SetSmallBankTimeout', bankId)
    end
    TriggerClientEvent('mz-bankrobbery:client:setBankState', -1, bankId)
    robberyBusy = true
    Config.OnRobberyStart(bankId)
end)

RegisterNetEvent('mz-bankrobbery:server:setLockerState', function(bankId, lockerId, state, bool)
    if bankId == "paleto" or bankId == "pacific" then
        if Config.UseDefaultRangeChecks then 
            if #(GetEntityCoords(GetPlayerPed(source)) - Config.BigBanks[bankId]["lockers"][lockerId]["coords"]) > 5.5 then
                return error(Lang:t("error.event_trigger_wrong", {event = "mz-bankrobbery:server:setLockerState", extraInfo = " ("..bankId..") ", source = source}))
            end
            Config.BigBanks[bankId]["lockers"][lockerId][state] = bool
        else 
            Config.BigBanks[bankId]["lockers"][lockerId][state] = bool
        end 
    else
        if Config.UseDefaultRangeChecks then 
            if #(GetEntityCoords(GetPlayerPed(source)) - Config.SmallBanks[bankId]["lockers"][lockerId]["coords"]) > 5.5 then
                return error(Lang:t("error.event_trigger_wrong", {event = "mz-bankrobbery:server:setLockerState", extraInfo = " (smallbank "..bankId..") ", source = source}))
            end
            Config.SmallBanks[bankId]["lockers"][lockerId][state] = bool
        else 
            Config.SmallBanks[bankId]["lockers"][lockerId][state] = bool
        end 
    end
    TriggerClientEvent('mz-bankrobbery:client:setLockerState', -1, bankId, lockerId, state, bool)
end)

RegisterNetEvent('mz-bankrobbery:server:recieveItem', function(type, bankId, lockerId)
    local src = source
    local ply = QBCore.Functions.GetPlayer(src)
    if not ply then return end
    if type == "small" then
        -- if #(GetEntityCoords(GetPlayerPed(src)) - Config.SmallBanks[bankId]["lockers"][lockerId]["coords"]) > 2.5 then
        --     return error(Lang:t("error.event_trigger_wrong", {event = "mz-bankrobbery:server:receiveItem", extraInfo = " (smallbank "..bankId..") ", source = source}))
        -- end
        local itemType = math.random(#Config.RewardTypes)
        local WeaponChance = math.random(1, 50)
        local odd1 = math.random(1, 50)
        local tierChance = math.random(1, 100)
        local tier = 1
        if tierChance <= Config.Tier1Chance then 
            tier = 1 
        elseif tierChance > Config.Tier1Chance and tierChance <= (Config.Tier1Chance + Config.Tier2Chance) then 
            tier = 2 
        elseif tierChance >= (Config.Tier1Chance + Config.Tier2Chance) and tierChance <= (Config.Tier1Chance + Config.Tier2Chance + Config.Tier3Chance) then 
            tier = 3 
        else 
            tier = 4 
        end
        if WeaponChance ~= odd1 then
            if tier ~= 4 then
                 if Config.RewardTypes[itemType].type == "item" then
                    local item = Config.LockerRewards["tier"..tier][math.random(#Config.LockerRewards["tier"..tier])]
                    local itemAmount = math.random(item.minAmount, item.maxAmount)
                    ply.Functions.AddItem(item.item, itemAmount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.item], "add", itemAmount)
                 elseif Config.RewardTypes[itemType].type == "money" then
                    if Config.DirtyPayout == "markedbills" then 
                        local info = {
                            worth = math.random(Config.FleecaPayoutLow, Config.FleecaPayoutHigh)
                        }
                        ply.Functions.AddItem('markedbills', 1, false, info)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add", 1)
                    elseif Config.DirtyPayout == "dirtymoney" then 
                        local worth = math.random(Config.FleecaPayoutLow, Config.FleecaPayoutHigh)
                        ply.Functions.AddItem('dirtymoney', worth, false)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add", worth)
                    elseif Config.DirtyPayout == "cash" then 
                        local worth = math.random(Config.FleecaPayoutLow, Config.FleecaPayoutHigh)
                        Player.Functions.AddMoney('cash', worth)
                    end
                end
            else
                ply.Functions.AddItem(Config.RareLoot, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareLoot], "add")
            end
        else
            ply.Functions.AddItem(Config.RareLootWeapon, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareLootWeapon], "add")
        end
    elseif type == "paleto" then
        -- if #(GetEntityCoords(GetPlayerPed(source)) - Config.BigBanks["paleto"]["lockers"][lockerId]["coords"]) > 2.5 then
        --     return error(Lang:t("error.event_trigger_wrong", {event = "mz-bankrobbery:server:receiveItem", extraInfo = " (paleto) ", source = source}))
        -- end
        local itemType = math.random(#Config.RewardTypes)
        local tierChance = math.random(1, 100)
        local WeaponChance = math.random(1, 10)
        local odd1 = math.random(1, 10)
        local tier
        if tierChance <= Config.Tier1Chance then 
            tier = 1 
        elseif tierChance > Config.Tier1Chance and tierChance <= (Config.Tier1Chance + Config.Tier2Chance) then 
            tier = 2 
        elseif tierChance >= (Config.Tier1Chance + Config.Tier2Chance) and tierChance <= (Config.Tier1Chance + Config.Tier2Chance + Config.Tier3Chance) then 
            tier = 3 
        else 
            tier = 4 
        end
        if WeaponChance ~= odd1 then
            if tier ~= 4 then
                 if Config.RewardTypes[itemType].type == "item" then
                    local item = Config.LockerRewardsPaleto["tier"..tier][math.random(#Config.LockerRewardsPaleto["tier"..tier])]
                    local itemAmount = math.random(item.minAmount, item.maxAmount)
                    ply.Functions.AddItem(item.item, itemAmount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.item], "add", itemAmount)
                 elseif Config.RewardTypes[itemType].type == "money" then
                    if Config.DirtyPayout == "markedbills" then 
                        local info = {
                            worth = math.random(Config.PaletoPayoutLow, Config.PaletoPayoutHigh)
                        }
                        ply.Functions.AddItem('markedbills', 1, false, info)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add", 1)
                    elseif Config.DirtyPayout == "dirtymoney" then 
                        local worth = math.random(Config.PaletoPayoutLow, Config.PaletoPayoutHigh)
                        ply.Functions.AddItem('dirtymoney', worth, false)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add", worth)
                    elseif Config.DirtyPayout == "cash" then 
                        local worth = math.random(Config.PaletoPayoutLow, Config.PaletoPayoutHigh)
                        Player.Functions.AddMoney('cash', worth)
                    end
                 end
            else
                ply.Functions.AddItem(Config.RareLootLeto, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareLootLeto], "add")
            end
        else
            ply.Functions.AddItem(Config.RareWeaponLeto, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareWeaponLeto], "add")
        end
    elseif type == "pacific" then
        -- if #(GetEntityCoords(GetPlayerPed(source)) - Config.BigBanks["pacific"]["lockers"][lockerId]["coords"]) > 2.5 then
        --     return error(Lang:t("error.event_trigger_wrong", {event = "mz-bankrobbery:server:receiveItem", extraInfo = " (pacific) ", source = source}))
        -- end
        local itemType = math.random(#Config.RewardTypes)
        local WeaponChance = math.random(1, 100)
        local odd1 = math.random(1, 100)
        local odd2 = math.random(1, 100)
        local tierChance = math.random(1, 100)
        if tierChance <= Config.Tier1Chance then 
            tier = 1 
        elseif tierChance > Config.Tier1Chance and tierChance <= (Config.Tier1Chance + Config.Tier2Chance) then 
            tier = 2 
        elseif tierChance >= (Config.Tier1Chance + Config.Tier2Chance) and tierChance <= (Config.Tier1Chance + Config.Tier2Chance + Config.Tier3Chance) then 
            tier = 3 
        else 
            tier = 4 
        end
        if WeaponChance ~= odd1 or WeaponChance ~= odd2 then
            if tier ~= 4 then
                if Config.RewardTypes[itemType].type == "item" then
                    local item = Config.LockerRewardsPacific["tier"..tier][math.random(#Config.LockerRewardsPacific["tier"..tier])]
                    local maxAmount
                    if tier == 3 then maxAmount = 7 elseif tier == 2 then maxAmount = 18 else maxAmount = 25 end
                    local itemAmount = math.random(maxAmount)
                    ply.Functions.AddItem(item.item, itemAmount)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.item], "add", itemAmount)
                elseif Config.RewardTypes[itemType].type == "money" then
                    if Config.DirtyPayout == "markedbills" then 
                        local info = {
                            worth = math.random(Config.PacificPayoutLow, Config.PacificPayoutHigh)
                        }
                        ply.Functions.AddItem('markedbills', 1, false, info)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add", 1)
                    elseif Config.DirtyPayout == "dirtymoney" then 
                        local worth = math.random(Config.PacificPayoutLow, Config.PacificPayoutHigh)
                        ply.Functions.AddItem('dirtymoney', worth, false)
                        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add", worth)
                    elseif Config.DirtyPayout == "cash" then 
                        local worth = math.random(Config.PacificPayoutLow, Config.PacificPayoutHigh)
                        Player.Functions.AddMoney('cash', worth)
                    end
                end
            else
                if Config.DirtyPayout == "markedbills" then 
                    local info = {
                        worth = math.random(Config.PacificPayoutLow, Config.PacificPayoutHigh)
                    }
                    ply.Functions.AddItem('markedbills', 1, false, info)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['markedbills'], "add", 1)
                elseif Config.DirtyPayout == "dirtymoney" then 
                    local worth = math.random(Config.PacificPayoutLow, Config.PacificPayoutHigh)
                    ply.Functions.AddItem('dirtymoney', worth, false)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['dirtymoney'], "add", worth)
                elseif Config.DirtyPayout == "cash" then 
                    local worth = math.random(Config.PacificPayoutLow, Config.PacificPayoutHigh)
                    Player.Functions.AddMoney('cash', worth)
                end
                info = {
                    crypto = math.random(1, 3)
                }
                ply.Functions.AddItem("cryptostick", 1, false, info)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cryptostick'], "add")
            end
        else
            local chance = math.random(1, 2)
            local odd = math.random(1, 2)
            if chance == odd then
                ply.Functions.AddItem(Config.RareWeaponPacific1, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareWeaponPacific1], "add")
            else
                ply.Functions.AddItem(Config.RareWeaponPacific2, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.RareWeaponPacific2], "add")
            end
        end
    end
end)

AddEventHandler('mz-bankrobbery:server:setTimeout', function()
    if robberyBusy or timeOut then return end
    timeOut = true
    CreateThread(function()
        SetTimeout(60000 * 90, function()
            for k in pairs(Config.BigBanks["pacific"]["lockers"]) do
                Config.BigBanks["pacific"]["lockers"][k]["isBusy"] = false
                Config.BigBanks["pacific"]["lockers"][k]["isOpened"] = false
            end
            for k in pairs(Config.BigBanks["paleto"]["lockers"]) do
                Config.BigBanks["paleto"]["lockers"][k]["isBusy"] = false
                Config.BigBanks["paleto"]["lockers"][k]["isOpened"] = false
            end
            TriggerClientEvent('mz-bankrobbery:client:ClearTimeoutDoors', -1)
            Config.BigBanks["paleto"]["isOpened"] = false
            Config.BigBanks["pacific"]["isOpened"] = false
            timeOut = false
            robberyBusy = false
            Config.OnRobberyTimeoutEnd("paleto")
            Config.OnRobberyTimeoutEnd("pacific")
        end)
    end)
end)

AddEventHandler('mz-bankrobbery:server:SetSmallBankTimeout', function(bankId)
    if robberyBusy or timeOut then return end
    timeOut = true
    CreateThread(function()
        SetTimeout(60000 * 30, function()
            for k in pairs(Config.SmallBanks[bankId]["lockers"]) do
                Config.SmallBanks[bankId]["lockers"][k]["isOpened"] = false
                Config.SmallBanks[bankId]["lockers"][k]["isBusy"] = false
            end
            TriggerClientEvent('mz-bankrobbery:client:ResetFleecaLockers', -1, bankId)
            timeOut = false
            robberyBusy = false
            Config.OnRobberyTimeoutEnd(bankId)
        end)
    end)
end)

RegisterNetEvent('mz-bankrobbery:server:callCops', function(type, bank, coords)
    if type == "small" then
        if not Config.SmallBanks[bank]["alarm"] then
            return error(Lang:t("error.event_trigger_wrong", {event = "mz-bankrobbery:server:callCops", extraInfo = " (smallbank "..bank..") ", source = source}))
        end
    elseif type == "paleto" then
        if not Config.BigBanks["paleto"]["alarm"] then
            return error(Lang:t("error.event_trigger_wrong", {event = "mz-bankrobbery:server:callCops", extraInfo = " (paleto) ", source = source}))
        end
    elseif type == "pacific" then
        if not Config.BigBanks["pacific"]["alarm"] then
            return error(Lang:t("error.event_trigger_wrong", {event = "mz-bankrobbery:server:callCops", extraInfo = " (pacific) ", source = source}))
        end
    end
    if not Config.psdipatch then 
        TriggerClientEvent("mz-bankrobbery:client:robberyCall", -1, type, coords)
    end
end)

RegisterNetEvent('mz-bankrobbery:server:SetStationStatus', function(key, isHit)
    Config.PowerStations[key].hit = isHit
    TriggerClientEvent("mz-bankrobbery:client:SetStationStatus", -1, key, isHit)
    if AllStationsHit() then
        exports["qb-weathersync"]:setBlackout(true)
        TriggerClientEvent("mz-bankrobbery:client:disableAllBankSecurity", -1)
        Config.OnBlackout(true)
        CreateThread(function()
            SetTimeout(60000 * Config.BlackoutTimer, function()
                exports["qb-weathersync"]:setBlackout(false)
                TriggerClientEvent("mz-bankrobbery:client:enableAllBankSecurity", -1)
                Config.OnBlackout(false)
            end)
        end)
    else
        CheckStationHits()
    end
end)

RegisterNetEvent('mz-bankrobbery:server:removeElectronicKit', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem(Config.FleecaBreachItem2, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FleecaBreachItem2], "remove")
    Player.Functions.RemoveItem(Config.FleecaBreachItem1, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FleecaBreachItem1], "remove")
end)

RegisterNetEvent('mz-bankrobbery:server:removeElectronicKit_Pac', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem(Config.PacTrojan, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PacTrojan], "remove")
    Player.Functions.RemoveItem(Config.PacElectronic, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PacElectronic], "remove")
end) 

RegisterNetEvent('mz-bankrobbery:server:RemoveInnerDoorsItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem(Config.LetoInnerDoor, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.LetoInnerDoor], "remove")
end)

RegisterNetEvent('mz-bankrobbery:server:verificationFailed', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1, 100)
    if not Player then return end
    if chance <= Config.VerificationFailChance then 
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "Your "..Config.PacificBankVerifyClearance.." seizes...", "error", 3500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "OVERHEATING", "Your "..Config.PacificBankVerifyClearance.." seizes...", 3500, 'error')
        end
        Player.Functions.RemoveItem(Config.PacificBankVerifyClearance, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PacificBankVerifyClearance], "remove")
    end
end)

RegisterNetEvent('mz-bankrobbery:server:OverrideFailed', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1, 100)
    if not Player then return end
    if chance <= Config.OverrideFailChance then 
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "Your "..Config.PacificBankOverrideSecurity.." seizes...", "error", 3500)
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "OVERHEATING", "Your "..Config.PacificBankOverrideSecurity.." seizes...", 3500, 'error')
        end
        Player.Functions.RemoveItem(Config.PacificBankOverrideSecurity, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PacificBankOverrideSecurity], "remove")
    end
end)

RegisterNetEvent('mz-bankrobbery:server:Removethermite', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(Config.ExplosiveItem, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ExplosiveItem], "remove", 1)
end)

RegisterNetEvent('mz-bankrobbery:server:ExplosiveFail', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local chance = math.random(1, 100)
    if chance <= Config.LoseExplosive then 
        Player.Functions.RemoveItem(QBCore.Shared.Items[Config.ExplosiveItem].name, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.ExplosiveItem], "remove", 1)
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "The remote charge overheats and becomes useless...", 'error')
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "CHARGE FAILED", "The remote charge overheats and becomes useless...", 3500, 'error')
        end
    else
        if Config.NotifyType == 'qb' then
            TriggerClientEvent('QBCore:Notify', src, "The remote charge starts to make a weird buzzing noise...", 'error')
        elseif Config.NotifyType == "okok" then
            TriggerClientEvent('okokNotify:Alert', source, "CHARGE BUZZES", "The remote charge starts to make a weird buzzing noise...", 3500, 'error')
        end
    end
end)

RegisterNetEvent('mz-bankrobbery:server:removeBankCardA', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem(Config.PacificBankInternalDoorClear, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PacificBankInternalDoorClear], "remove")
end)

RegisterNetEvent('mz-bankrobbery:server:removeBankCardB', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem(Config.PacificBankInternalDoorClear, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.PacificBankInternalDoorClear], "remove")
end)

RegisterNetEvent('mz-bankrobbery:server:RemoveLockboxItem', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem(Config.FleecaSafeBreak, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FleecaSafeBreak], "remove")
end)

RegisterNetEvent('mz-bankrobbery:server:RemoveInnerDoors', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem(Config.FleecaInnerDoors, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.FleecaInnerDoors], "remove")
end)

RegisterNetEvent('thermite:StartServerFire', function(coords, maxChildren, isGasFire)
    local src = source
    local ped = GetPlayerPed(src)
    local coords2 = GetEntityCoords(ped)
    local thermiteCoords = Config.BigBanks['pacific'].thermite[1].coords
    local thermite2Coords = Config.BigBanks['pacific'].thermite[2].coords
    local thermite3Coords = Config.BigBanks['paleto'].thermite[1].coords
    if #(coords2 - thermiteCoords) < 10 or #(coords2 - thermite2Coords) < 10 or #(coords2 - thermite3Coords) < 10 or IsNearPowerStation(coords2, 10) then
        TriggerClientEvent("thermite:StartFire", -1, coords, maxChildren, isGasFire)
    end
end)

RegisterNetEvent('thermite:StopFires', function()
    TriggerClientEvent("thermite:StopFires", -1)
end)

-- Callbacks

QBCore.Functions.CreateCallback('mz-bankrobbery:server:isRobberyActive', function(_, cb)
    cb(robberyBusy)
end)

QBCore.Functions.CreateCallback('mz-bankrobbery:server:GetConfig', function(_, cb)
    cb(Config.PowerStations, Config.BigBanks, Config.SmallBanks)
end)

QBCore.Functions.CreateCallback("thermite:server:check", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player then return cb(false) end
    if Player.Functions.RemoveItem(Config.ExplosiveItem, 1) then
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.ExplosiveItem], "remove")
        cb(true)
    else
        cb(false)
    end
end)

-- Items

QBCore.Functions.CreateUseableItem(Config.ExplosiveItem, function(source)
    if not Config.IgnoreThermiteUsage then 
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player or not Player.Functions.GetItemByName(Config.ExplosiveItem) then return end
        if Player.Functions.GetItemByName('lighter') then
            TriggerClientEvent("thermite:UseThermite", source)
        else
            TriggerClientEvent('QBCore:Notify', source, Lang:t("error.missing_ignition_source"), "error")
        end
    end
end)

QBCore.Functions.CreateUseableItem("security_card_01", function(source)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player or not Player.Functions.GetItemByName('security_card_01') then return end
    TriggerClientEvent("mz-bankrobbery:UseBankcardA", source)
end)

-- QBCore.Functions.CreateUseableItem("security_card_02", function(source)
--     local Player = QBCore.Functions.GetPlayer(source)
-- 	if not Player or not Player.Functions.GetItemByName('security_card_02') then return end
--     TriggerClientEvent("mz-bankrobbery:UseBankcardB", source)
-- end)

QBCore.Functions.CreateUseableItem(Config.FleecaBreachItem2, function(source)
    local Player = QBCore.Functions.GetPlayer(source)
    if not Player or not Player.Functions.GetItemByName(Config.FleecaBreachItem2) then return end
    TriggerClientEvent("mz-bankrobbery:client:UseElectronickit", source)
end)

------------
--SHOOTERS--
------------

local peds = { 
    `s_m_m_highsec_01`,
    `s_m_m_highsec_02`,
}

local getRandomNPC = function()
    return peds[math.random(#peds)]
end

QBCore.Functions.CreateCallback('mz-bankrobbery:server:SpawnShooters', function(source, cb, loc)
    local netIds = {}
    local netId
    local npc
    for i=1, #Config.Shooters['soldiers'].locations[loc].peds, 1 do
        npc = CreatePed(30, getRandomNPC(), Config.Shooters['soldiers'].locations[loc].peds[i], true, false)
        while not DoesEntityExist(npc) do Wait(10) end
        netId = NetworkGetNetworkIdFromEntity(npc)
        netIds[#netIds+1] = netId
    end
    cb(netIds)
end)