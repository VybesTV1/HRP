-- Command registered server side below:
RegisterCommand(main.commandName, function(source, args, rawCommand)
    if (source > 0) then
        if not main.itemEnabled then
            if args[1] == nil or (tostring(args[1]) ~= translations.setup and tostring(args[1]) ~= translations.remove) then
                TriggerClientEvent("Client:cushionNotification", source, translations.commandError)
                return 
            end
        end
        local setup = false
        if not main.itemEnabled then
            if tostring(args[1]) == translations.setup then setup = true end
            if tostring(args[1]) == translations.remove then setup = false end
        end

        -- Add your permission check here, send event if they have permission

        local permission = userHasPermission(source, jobCheck)
        if permission then
            if not main.itemEnabled then
                TriggerClientEvent("Client:toggleCushion", source, setup)
            else
                TriggerClientEvent("Client:toggleCushion", source, false)
            end
        end
    end
end, main.enableAcePermissions)


usingCushion = {}
if jobCheck.QBCore.enabled and not jobCheck.oxInventory then
    QBCore = exports["qb-core"]:GetCoreObject()
    if main.itemEnabled then
        CreateThread(function()
            QBCore.Functions.CreateUseableItem(main.itemName, function(src, item)
                if userHasPermission(src, jobCheck) then
                    TriggerEvent("Server:ToggleCushion", src)
                end
            end)

        end)
    end
end



RegisterNetEvent("Server:ToggleCushion", function(src)
    if main.itemEnabled then
        if not usingCushion[src] then
            if jobCheck.oxInventory then
                usingCushion[src] = true
                TriggerClientEvent("Client:toggleCushion", src, true)
            elseif jobCheck.QBCore.enabled then
                local Player = QBCore.Functions.GetPlayer(src)
                Player.Functions.RemoveItem(main.itemName, 1)
                usingCushion[src] = true
                TriggerClientEvent("Client:toggleCushion", src, true)
            elseif jobCheck.ESX.enabled then
                local xPlayer = ESX.GetPlayerFromId(src)
                xPlayer.removeInventoryItem(main.itemName, 1)
                usingCushion[src] = true
                TriggerClientEvent("Client:toggleCushion", src, true)
            elseif jobCheck.vRP.enabled then
                local userID = vRP.getUserId({src})
                if vRP.tryGetInventoryItem({userID, main.itemName, 1, false}) then
                    usingCushion[src] = true
                    TriggerClientEvent("Client:toggleCushion", src, true)
                end
            end
        end
    end
end)

RegisterNetEvent("Server:ReturnCushion", function()
    local source = source
    if usingCushion[source] then
        if jobCheck.oxInventory then
            exports.ox_inventory:AddItem(source, main.itemName, 1)
        elseif jobCheck.QBCore.enabled then
            local Player = QBCore.Functions.GetPlayer(source)
            Player.Functions.AddItem(main.itemName, 1)
            usingCushion[source] = false
        elseif jobCheck.ESX.enabled then
            local xPlayer = ESX.GetPlayerFromId(source)
            xPlayer.addInventoryItem(main.itemName, 1)
            usingCushion[source] = false
        elseif jobCheck.vRP.enabled then
            local userID = vRP.getUserId({source})
            vRP.giveInventoryItem({userID, main.itemName, 1, false})
            usingCushion[source] = false
        end
    end
end)

if jobCheck.vRP.enabled then
    Proxy = module("vrp", "lib/Proxy")
    vRP = Proxy.getInterface("vRP")
end

if jobCheck.ESX.enabled then
    ESX = nil
    ESX = exports["es_extended"]:getSharedObject()
    if main.itemEnabled and not jobCheck.oxInventory then
        CreateThread(function()
            ESX.RegisterUsableItem(main.itemName, function(playerId)
                if userHasPermission(playerId, jobCheck) then
                    TriggerEvent("Server:ToggleCushion", playerId)
                end
            end)
        end)
    end
end

if main.itemEnabled and jobCheck.oxInventory then
    exports('useRescueCushion', function(event, item, inventory, slot, data)
        if event == 'usingItem' and userHasPermission(inventory.player.source, jobCheck) then
            TriggerEvent("Server:ToggleCushion", inventory.player.source)
            return true
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

local cushions = {}

RegisterServerEvent('Server:updateCushionsTable')
AddEventHandler('Server:updateCushionsTable', function(key, entry, remove)
    if remove then
        cushions[key] = nil
        local prop = NetworkGetEntityFromNetworkId(key)
        if DoesEntityExist(prop) then
            DeleteEntity(prop)
        end
        TriggerClientEvent("Client:updateCushionsTable", -1, key, entry, remove)
        return 
    end
    cushions[key] = entry
    TriggerClientEvent("Client:updateCushionsTable", -1, key, entry, remove)
end)

RegisterServerEvent('Server:receiveCushionsTable')
AddEventHandler('Server:receiveCushionsTable', function()
    TriggerClientEvent("Client:receiveCushionsTable", source, cushions)
end)