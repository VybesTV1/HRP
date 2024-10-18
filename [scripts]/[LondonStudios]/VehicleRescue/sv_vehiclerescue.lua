local acePermissionsEnabled = false

-- Command registered server side below:
if not inventory.itemEnabled then
    RegisterCommand(main.jackCommandName, function(source, args, rawCommand)
        local source = source
        if (source > 0) then
            if args[1] == nil or (tostring(args[1]) ~= translations.setup and tostring(args[1]) ~= translations.remove) then
                TriggerClientEvent("Client:jackNotification", source, translations.jackCommandError)
                return 
            end
            local setup = false
            if tostring(args[1]) == translations.setup then setup = true end
            if tostring(args[1]) == translations.remove then setup = false end
            -- Add your permission check here, send event if they have permission

            local permission = userHasPermission(source, jobCheck)
            if permission then
                TriggerClientEvent("Client:toggleJack", source, setup)
            end
        end
    end, main.acePermissionsEnabled)

    RegisterCommand(main.chockCommandName, function(source, args, rawCommand)
        local source = source
        if (source > 0) then
            if args[1] == nil or (tostring(args[1]) ~= translations.setup and tostring(args[1]) ~= translations.remove) then
                TriggerClientEvent("Client:jackNotification", source, translations.chockCommandError)
                return 
            end
            local setup = false
            if tostring(args[1]) == translations.setup then setup = true end
            if tostring(args[1]) == translations.remove then setup = false end
            -- Add your permission check here, send event if they have permission

            local permission = userHasPermission(source, jobCheck)
            if permission then
                TriggerClientEvent("Client:toggleChock", source, setup)
            end
        end
    end, main.acePermissionsEnabled)
end

if jobCheck.QBCore.enabled then
    QBCore = exports["qb-core"]:GetCoreObject()
end

if jobCheck.vRP.enabled then
    Proxy = module("vrp", "lib/Proxy")
    vRP = Proxy.getInterface("vRP")
end

if jobCheck.ESX.enabled then
    ESX = nil
    ESX = exports["es_extended"]:getSharedObject()
end

usedChock = {}
usedJack = {}
if inventory.itemEnabled then
    if inventory.oxInventory then
        exports('useVehicleRescueItem', function(event, item, inventory, slot, data)
            if event == 'usingItem' and userHasPermission(inventory.player.source, jobCheck) then
                if item.server.name == "chock" then
                    TriggerClientEvent("Client:toggleChock", inventory.player.source, not usedChock[inventory.player.source])
                    usedChock[inventory.player.source] = not usedChock[inventory.player.source]
                else
                    TriggerClientEvent("Client:toggleJack", inventory.player.source, not usedJack[inventory.player.source])
                    usedJack[inventory.player.source] = not usedJack[inventory.player.source]
                end
                return false
            end
        end)
    elseif inventory.qbInventory or (inventory.coreInventory and jobCheck.QBCore.enabled) or (inventory.quasarInventory and jobCheck.QBCore.enabled) then
        QBCore.Functions.CreateUseableItem("chock", function(source, item)
            TriggerClientEvent("Client:toggleChock", source, not usedChock[source])
            usedChock[source] = not usedChock[source]
        end)

        QBCore.Functions.CreateUseableItem("jack", function(source, item)
            TriggerClientEvent("Client:toggleJack", source, not usedJack[source])
            usedJack[source] = not usedJack[source]
        end)
    elseif inventory.esxInventory or (inventory.coreInventory and jobCheck.ESX.enabled) or (inventory.quasarInventory and jobCheck.ESX.enabled) then
        ESX.RegisterUsableItem("chock", function(playerId)
            TriggerClientEvent("Client:toggleChock", playerId, not usedChock[playerId])
            usedChock[playerId] = not usedChock[playerId]
        end)

        ESX.RegisterUsableItem("jack", function(playerId)
            TriggerClientEvent("Client:toggleJack", playerId, not usedJack[playerId])
            usedJack[playerId] = not usedJack[playerId]
        end)
    elseif inventory.vRPInventory then
        RegisterNetEvent("Server:useVehicleRescueItem", function(source, itemName)
            if itemName == "chock" then
                TriggerClientEvent("Client:toggleChock", source, not usedChock[source])
                usedChock[source] = not usedChock[source]
            elseif itemName == "jack" then
                TriggerClientEvent("Client:toggleJack", source, not usedJack[source])
                usedJack[source] = not usedJack[source]
            end
        end)
    end
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

-- We do not recommend editing the below section

local carJacks = {}
local carChocks = {}

RegisterServerEvent('Server:updateJackTable')
AddEventHandler('Server:updateJackTable', function(key, entry, remove)
    if remove then 
        carJacks[key] = nil
        TriggerClientEvent("Client:updateJackTable", -1, key, entry, remove)
        return 
    end
    carJacks[key] = entry
    TriggerClientEvent("Client:updateJackTable", -1, key, entry, remove)
end)

RegisterServerEvent('Server:updateChockTable')
AddEventHandler('Server:updateChockTable', function(key, entry, remove)
    if remove then 
        carChocks[key] = nil
        TriggerClientEvent("Client:updateChockTable", -1, key, entry, remove)
        return 
    end
    carChocks[key] = entry
    TriggerClientEvent("Client:updateChockTable", -1, key, entry, remove)
end)

RegisterServerEvent('Server:receiveJackTable')
AddEventHandler('Server:receiveJackTable', function()
    TriggerClientEvent("Client:receiveJackTable", source, carJacks)
end)

RegisterServerEvent('Server:toggleChockWheels')
AddEventHandler('Server:toggleChockWheels', function(netId)
    TriggerClientEvent("Client:toggleChockWheels", -1, netId)
end)

RegisterServerEvent('Server:receiveChockTable')
AddEventHandler('Server:receiveChockTable', function()
    TriggerClientEvent("Client:receiveChockTable", source, carChocks)
end)