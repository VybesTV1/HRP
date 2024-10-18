
Citizen.CreateThread(function()
    Wait(10000)
    local value = GetConvar("UsingSmartFires", "false")
    if value == "true" then
        usingSmartFires = true
    end
end)
if not jobCheck.itemsEnabled.enabled then
-- Command registered server side below:
    RegisterCommand(main.fanCommand, function(source, args, rawCommand)
        fanSetup(source, args, false)
    end, main.acePermissionsEnabled)

-- Command registered server side below:
    RegisterCommand(main.stabilisersCommand, function(source, args, rawCommand)
        stabilisersSetup(source, args, false)
    end, main.acePermissionsEnabled)

    -- Command registered server side below:
    RegisterCommand(main.spreadersCommand, function(source, args, rawCommand)
        spreadersSetup(source, false)
    end, main.acePermissionsEnabled)
end

function stabilisersSetup(source, args, fromItem)
    if not fromItem then
    
        if (source > 0) then
            if args[1] == nil or (tostring(args[1]) ~= translations.setup and tostring(args[1]) ~= translations.remove) then
                TriggerClientEvent("Client:rtcNotification", source, translations.stabilisersError)
                return 
            end
            local setup = false
            if tostring(args[1]) == translations.setup then setup = true end
            if tostring(args[1]) == translations.remove then setup = false end

            -- Add your permission check here, send event if they have permission

            local permission = userHasPermission(source, jobCheck)
            if permission then
                TriggerClientEvent("Client:toggleStabilisers", source, setup, false)
            end
        end
    else
        local permission = userHasPermission(source, jobCheck)
        if permission then
            TriggerClientEvent("Client:toggleStabilisers", source, true, true)
        end
    end
end

function spreadersSetup(source, fromItem)
    if (source > 0) then
        local permission = userHasPermission(source, jobCheck)
        if permission then
            TriggerClientEvent("Client:toggleSpreaders", source, fromItem)
        end
    end
end

function fanSetup(source, args, fromItem)
    if not fromItem then
        if (source > 0) then
            if args[1] == nil or (tostring(args[1]) ~= translations.setup and tostring(args[1]) ~= translations.remove) then
                TriggerClientEvent("Client:rtcNotification", source, "~r~Error~w~: Use /fan  setup or /fan remove")
                return 
            end
            local setup = false
            if tostring(args[1]) == translations.setup then setup = true end
            if tostring(args[1]) == translations.remove then setup = false end

            -- Add your permission check here, send event if they have permission

            local permission = userHasPermission(source, jobCheck)
            if permission then
                TriggerClientEvent("Client:toggleFan", source, setup, false)
            end
        end
    else
        local permission = userHasPermission(source, jobCheck)
        if permission then
            TriggerClientEvent("Client:toggleFan", source, true, true)
        end
    end
    
end

if jobCheck.QBCore.enabled then
    QBCore = exports["qb-core"]:GetCoreObject()
    if jobCheck.itemsEnabled.enabled and not jobCheck.itemsEnabled.oxInventory then
        Citizen.CreateThread(function()
            QBCore.Functions.CreateUseableItem(jobCheck.itemsEnabled.fanItem, function(source, item)
                fanSetup(source, nil, true)
                local Player = QBCore.Functions.GetPlayer(source)
                Player.Functions.RemoveItem(jobCheck.itemsEnabled.fanItem, 1)
            end)
            QBCore.Functions.CreateUseableItem(jobCheck.itemsEnabled.spreadersItem, function(source, item)
                spreadersSetup(source, true)
                local Player = QBCore.Functions.GetPlayer(source)
                Player.Functions.RemoveItem(jobCheck.itemsEnabled.spreadersItem, 1)
            end)
            QBCore.Functions.CreateUseableItem(jobCheck.itemsEnabled.stabilisersItem, function(source, item)
                stabilisersSetup(source, nil, true)
                local Player = QBCore.Functions.GetPlayer(source)
                Player.Functions.RemoveItem(jobCheck.itemsEnabled.stabilisersItem, 1)
            end)
        end)
    end
end

if jobCheck.vRP.enabled then
    Proxy = module("vrp", "lib/Proxy")
    vRP = Proxy.getInterface("vRP")

    if jobCheck.itemsEnabled.enabled then
        RegisterServerEvent("Server:GiveFireTools")
        AddEventHandler("Server:GiveFireTools", function(playerSrc, itemUsed)
            local userid = vRP.getUserId({playerSrc})
            if itemUsed == "fan" then
                if vRP.tryGetInventoryItem({userid, jobCheck.itemsEnabled.fanItem, 1, false}) then
                    fanSetup(playerSrc, nil, true)
                end
            elseif itemUsed == "spreaders" then
                if vRP.tryGetInventoryItem({userid, jobCheck.itemsEnabled.spreadersItem, 1, false}) then
                    spreadersSetup(playerSrc, true)
                end
            elseif itemUsed == "stabilisers" then
                if vRP.tryGetInventoryItem({userid, jobCheck.itemsEnabled.stabilisersItem, 1, false}) then
                    stabilisersSetup(playerSrc, nil, true)
                end
            end
        end)
    end
end


if jobCheck.ESX.enabled and not jobCheck.itemsEnabled.oxInventory then
    ESX = nil
    ESX = exports["es_extended"]:getSharedObject()
    if jobCheck.itemsEnabled.enabled then
        Citizen.CreateThread(function()
            ESX.RegisterUsableItem(jobCheck.itemsEnabled.fanItem, function(playerId, item) -- Setting the fan as useable 
                local xPlayer = ESX.GetPlayerFromId(playerId)
                xPlayer.removeInventoryItem(jobCheck.itemsEnabled.fanItem, 1)
                fanSetup(playerId, nil, true)

            end)
            ESX.RegisterUsableItem(jobCheck.itemsEnabled.spreadersItem, function(playerId, item) -- Setting the fan as useable 
                local xPlayer = ESX.GetPlayerFromId(playerId)
                xPlayer.removeInventoryItem(jobCheck.itemsEnabled.spreadersItem, 1)
                spreadersSetup(playerId, true)

            end)
            ESX.RegisterUsableItem(jobCheck.itemsEnabled.stabilisersItem, function(playerId, item) -- Setting the fan as useable 
                local xPlayer = ESX.GetPlayerFromId(playerId)
                xPlayer.removeInventoryItem(jobCheck.itemsEnabled.stabilisersItem, 1)
                stabilisersSetup(playerId, nil, true)
            end)
        end)
    end
end
if jobCheck.itemsEnabled.oxInventory then
    exports('OxUseStabiliser', function(event, item, inventory, slot, data)
        if event == 'usingItem' then
            stabilisersSetup(inventory.player.source, nil, true)
        end
    end)

    exports('OxUseSpreaders', function(event, item, inventory, slot, data)
        if event == 'usingItem' then
            spreadersSetup(inventory.player.source, true)
        end
    end)
    
    exports('OxUseFan', function(event, item, inventory, slot, data)
        if event == 'usingItem' then
            fanSetup(inventory.player.source, nil, true)
        end
    end)
end

function userHasPermission(source, location)
    local permission = false
    local usingPermissions = false
    -- ESX Permissions
    if location.ESX.enabled then
        local xPlayer = ESX.GetPlayerFromId(source)
        if location.ESX.checkJob.enabled then
            usingPermissions = true
            for k, v in pairs(location.ESX.checkJob.jobs) do
                if xPlayer.job.name == v then
                    permission = true
                end
            end
        end
    end

    -- vRP Permission
    if location.vRP.enabled then
        if location.vRP.checkPermission.enabled then
            usingPermissions = true
            for k, v in pairs(location.vRP.checkPermission.permissions) do
                if vRP.hasPermission({vRP.getUserId({source}),v}) then
                    permission = true
                end
            end
        end

        if location.vRP.checkGroup.enabled then
            usingPermissions = true
            for k, v in pairs(location.vRP.checkGroup.groups) do
                if vRP.hasGroup({vRP.getUserId({source}),v}) then
                    permission = true
                end
            end
        end
    end

    -- QBCore Permission
    if location.QBCore.enabled then
        local player = QBCore.Functions.GetPlayer(source)
        if location.QBCore.checkJob.enabled then
            usingPermissions = true
            for k, v in pairs(location.QBCore.checkJob.jobs) do
                if player.PlayerData.job.name == v then
                    permission = true
                end
            end
        end
        if location.QBCore.checkPermission.enabled then
            usingPermissions = true
            for k, v in pairs(location.QBCore.checkPermission.permissions) do
                if QBCore.Functions.HasPermission(source, v) then
                    permission = true
                end
            end
        end
    end

    if not usingPermissions then
        permission = true
    end
    return permission
end


-- We do not recommend editing below:

local stabilisers = {}
local fans = {}

RegisterServerEvent('Server:updateStabilisersTable')
AddEventHandler('Server:updateStabilisersTable', function(key, entry, remove)
    if remove then 
        stabilisers[key] = nil
        TriggerClientEvent("Client:updateStabilisersTable", -1, key, entry, remove)
        return 
    end
    stabilisers[key] = entry
    TriggerClientEvent("Client:updateStabilisersTable", -1, key, entry, remove)
end)

RegisterServerEvent("Server:ReturnItems")
AddEventHandler("Server:ReturnItems", function(item)
    local source = source
    if jobCheck.itemsEnabled.enabled then
        if jobCheck.itemsEnabled.oxInventory then
            exports.ox_inventory:AddItem(source, item, 1)
        elseif jobCheck.ESX.enabled then
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.addInventoryItem(item, 1)
        elseif jobCheck.QBCore.enabled then
            local Player = QBCore.Functions.GetPlayer(source)
            Player.Functions.AddItem(item, 1)
        elseif jobCheck.vRP.enabled then
            local userId = vRP.getUserId({source})
            vRP.giveInventoryItem({userId, item, 1, false})
        end
    end
end)

RegisterServerEvent('Server:updateFansTable')
AddEventHandler('Server:updateFansTable', function(key, entry, remove)
    local source = source
    if remove then 
        fans[key] = nil
        TriggerClientEvent("Client:updateFansTable", -1, key, entry, remove)
        return 
    end
    fans[key] = entry
    if usingSmartFires then
        local args = {}
        args[1] = 15.0
        TriggerClientEvent("Client:stopSmokeCommand", source, args, false)
    end
    TriggerClientEvent("Client:updateFansTable", -1, key, entry, remove)
end)


RegisterServerEvent('Server:receiveStabilisersTable')
AddEventHandler('Server:receiveStabilisersTable', function()
    TriggerClientEvent("Client:receiveStabilisersTable", source, stabilisers)
end)

RegisterServerEvent('Server:rtcOpenDoor')
AddEventHandler('Server:rtcOpenDoor', function(vehicleNet, bone, coords, breakDoor)
    TriggerClientEvent("Client:rtcOpenDoor", -1, vehicleNet, bone, coords, breakDoor)
    TriggerClientEvent("Client:spreadersSound", -1, coords)
end)


RegisterServerEvent('Server:receiveFanTable')
AddEventHandler('Server:receiveFanTable', function()
    TriggerClientEvent("Client:receiveFanTable", source, fans)
end)

RegisterServerEvent('Server:stopRtcParticles')
AddEventHandler('Server:stopRtcParticles', function(coords)
    TriggerClientEvent("Client:stopRtcParticles", -1, coords)
end)
