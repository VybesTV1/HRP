QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ak47_qb_ambulancejob:CombatLogPunishment', function()
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if Config.CombatLogPunishment.RemoveMoney then
		xPlayer.Functions.RemoveMoney('cash', xPlayer.PlayerData.money['cash'])
		Wait(100)
	end
	if Config.CombatLogPunishment.RemoveItems then
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local inv = xPlayer.PlayerData.items
		if inv then
			for i, v in pairs(inv) do
				if v.name and ((v.count and v.count > 0) or (v.amount and v.amount > 0)) and not Config.CombatLogPunishment.IgnoreItemList[v.name:lower()] and not string.find(v.name:lower(), 'weapon_') then
					if v.amount then
						xPlayer.Functions.RemoveItem(v.name, v.amount)
					else
						xPlayer.Functions.RemoveItem(v.name, v.count)
					end
				end
			end
		end
		Wait(100)
	end
	if Config.CombatLogPunishment.RemoveWeapons then
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local inv = xPlayer.PlayerData.items
		if inv then
			for i, v in pairs(inv) do
				if v.name and ((v.count and v.count > 0) or (v.amount and v.amount > 0)) and not Config.CombatLogPunishment.IgnoreLoadoutList[v.name] and string.find(v.name:lower(), 'weapon_') then
					if v.amount then
						xPlayer.Functions.RemoveItem(v.name, v.amount)
					else
						xPlayer.Functions.RemoveItem(v.name, v.count)
					end
				end
			end
		end
		Wait(100)
	end
end)

RegisterNetEvent('ak47_qb_ambulancejob:ForceRespawnPunishment', function()
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if Config.ForceRespawnPunishment.RemoveMoney then
		xPlayer.Functions.RemoveMoney('cash', xPlayer.PlayerData.money['cash'])
		Wait(100)
	end
	if Config.ForceRespawnPunishment.RemoveItems then
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local inv = xPlayer.PlayerData.items
		if inv then
			for i, v in pairs(inv) do
				if v.name and ((v.count and v.count > 0) or (v.amount and v.amount > 0)) and not Config.ForceRespawnPunishment.IgnoreItemList[v.name:lower()] and not string.find(v.name:lower(), 'weapon_') then
					if v.amount then
						xPlayer.Functions.RemoveItem(v.name, v.amount)
					else
						xPlayer.Functions.RemoveItem(v.name, v.count)
					end
				end
			end
		end
		Wait(100)
	end
	if Config.ForceRespawnPunishment.RemoveWeapons then
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local inv = xPlayer.PlayerData.items
		if inv then
			for i, v in pairs(inv) do
				if v.name and ((v.count and v.count > 0) or (v.amount and v.amount > 0)) and not Config.ForceRespawnPunishment.IgnoreLoadoutList[v.name] and string.find(v.name:lower(), 'weapon_') then
					if v.amount then
						xPlayer.Functions.RemoveItem(v.name, v.amount)
					else
						xPlayer.Functions.RemoveItem(v.name, v.count)
					end
				end
			end
		end
		Wait(100)
	end
end)

RegisterNetEvent('ak47_qb_ambulancejob:AutoRespawnPunishment', function()
	local source = source
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if Config.AutoRespawnPunishment.RemoveMoney then
		xPlayer.Functions.RemoveMoney('cash', xPlayer.PlayerData.money['cash'])
		Wait(100)
	end
	if Config.AutoRespawnPunishment.RemoveItems then
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local inv = xPlayer.PlayerData.items
		if inv then
			for i, v in pairs(inv) do
				if v.name and ((v.count and v.count > 0) or (v.amount and v.amount > 0)) and not Config.AutoRespawnPunishment.IgnoreItemList[v.name:lower()] and not string.find(v.name:lower(), 'weapon_') then
					if v.amount then
						xPlayer.Functions.RemoveItem(v.name, v.amount)
					else
						xPlayer.Functions.RemoveItem(v.name, v.count)
					end
				end
			end
		end
		Wait(100)
	end
	if Config.AutoRespawnPunishment.RemoveWeapons then
		local xPlayer = QBCore.Functions.GetPlayer(source)
		local inv = xPlayer.PlayerData.items
		if inv then
			for i, v in pairs(inv) do
				if v.name and ((v.count and v.count > 0) or (v.amount and v.amount > 0)) and not Config.AutoRespawnPunishment.IgnoreLoadoutList[v.name] and string.find(v.name:lower(), 'weapon_') then
					if v.amount then
						xPlayer.Functions.RemoveItem(v.name, v.amount)
					else
						xPlayer.Functions.RemoveItem(v.name, v.count)
					end
				end
			end
		end
		Wait(100)
	end
end)

QBCore.Functions.CreateCallback('ak47_qb_ambulancejob:hasmoney', function(source, cb, total)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local money = xPlayer.PlayerData.money['bank']
	if GetResourceState('m-Insurance') == 'started' and exports['m-Insurance']:haveHealthInsurance(xPlayer.PlayerData.citizenid) then
		local discount = 500 --change this
		local pay = total - discount
		if money >= pay then
			xPlayer.Functions.RemoveMoney("bank", pay > 0 and pay or 0, "respawned-at-hospital")
			addSocietyMoney(pay)
			cb(true)
		else
			cb(false)
		end
		xPlayer.Functions.RemoveMoney("bank", total - 500, "respawned-at-hospital") -- The "500" is the discount, you can change it
	else
		if money >= total then
			xPlayer.Functions.RemoveMoney('bank', total)
			addSocietyMoney(total)
			cb(true)
		else
			cb(false)
		end
	end
end)

RegisterNetEvent('ak47_qb_ambulancejob:gonegativebalance', function(total)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	xPlayer.Functions.RemoveMoney('bank', total)
	addSocietyMoney(total)
end)

function GetItemLabel(item)
    if QBCore.Shared and QBCore.Shared.Items and QBCore.Shared.Items[item] then
	   return QBCore.Shared.Items[item].label
    else
        print('^1Item: ^3['..item..']^1 missing in qb-core/shared/items.lua^0')
        return item
    end
end

function hasEnoughItem(source, item, quantity)
    local quantity = quantity or 1
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local inv = xPlayer.Functions.GetItemByName(item)
    if inv and ((inv.amount and inv.amount >= quantity) or (inv.count and inv.count >= quantity)) then
        return true
    end
    return false
end

function addSocietyMoney(money)
	Citizen.CreateThread(function()
		if Config.SocietyInManagement then
			exports['qb-management']:AddMoney('ambulance', money)
		else
			exports['qb-banking']:AddMoney('ambulance', money)
		end
	end)
end

function exportHandler(exportName, func)
    AddEventHandler(('__cfx_export_qb-ambulancejob_%s'):format(exportName), function(setCB)
        setCB(func)
    end)
end

AddEventHandler('txAdmin:events:healedPlayer', function(eventData)
	TriggerClientEvent('ak47_qb_ambulancejob:revive', eventData.id)
	TriggerClientEvent('ak47_qb_ambulancejob:skellyfix', eventData.id)
end)

QBCore.Functions.CreateCallback('ak47_qb_ambulancejob:getwebhook', function(source, cb)
	cb(ScreenshotWebhook)
end)

QBCore.Commands.Add("kill", _U('killcmd'), {{name = "id", help = _U('playerid')}}, false, function(source, args)
	local src = source
	if args[1] then
		local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if Player then
			TriggerClientEvent('hospital:client:KillPlayer', Player.PlayerData.source)
		end
	else
		TriggerClientEvent('hospital:client:KillPlayer', src)
	end
end, "admin")

QBCore.Commands.Add("revive", _U('revivecmd'), {{name = "id", help = _U('playerid')}}, false, function(source, args)
	local src = source
	if args[1] then
		local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if Player then
			TriggerClientEvent('ak47_qb_ambulancejob:revive', Player.PlayerData.source)
			TriggerClientEvent('ak47_qb_ambulancejob:skellyfix', Player.PlayerData.source)
		end
	else
		TriggerClientEvent('ak47_qb_ambulancejob:revive', src)
		TriggerClientEvent('ak47_qb_ambulancejob:skellyfix', src)
	end
end, "admin")

QBCore.Commands.Add("heal", _U('healcmd'), {{name = "id", help = _U('playerid')}}, false, function(source, args)
	local src = source
	if args[1] then
		local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if Player then
			TriggerClientEvent('ak47_qb_ambulancejob:heal', Player.PlayerData.source)
			TriggerClientEvent('ak47_qb_ambulancejob:skellyfix', Player.PlayerData.source)
		end
	else
		TriggerClientEvent('ak47_qb_ambulancejob:heal', src)
		TriggerClientEvent('ak47_qb_ambulancejob:skellyfix', src)
	end
end, "admin")

QBCore.Commands.Add("healall", _U('healall'), {}, false, function(source, args)
	TriggerClientEvent('ak47_qb_ambulancejob:heal', -1)
	TriggerClientEvent('ak47_qb_ambulancejob:skellyfix', -1)
end, "admin")

QBCore.Commands.Add("skellyfix", _U('skellyfix'), {{name = "id", help = _U('playerid')}}, false, function(source, args)
	local src = source
	if args[1] then
		local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if Player then
			TriggerClientEvent('ak47_qb_ambulancejob:skellyfix', Player.PlayerData.source)
		end
	else
		TriggerClientEvent('ak47_qb_ambulancejob:skellyfix', src)
	end
end, "admin")

QBCore.Commands.Add("reviveall", _U('reviveall'), {}, false, function(source, args)
	TriggerClientEvent('ak47_qb_ambulancejob:revive', -1)
	TriggerClientEvent('ak47_qb_ambulancejob:skellyfix', -1)
end, "admin")

QBCore.Commands.Add("skellyfixall", _U('skellyfixall'), {}, false, function(source, args)
	TriggerClientEvent('ak47_qb_ambulancejob:skellyfix', -1)
end, "admin")