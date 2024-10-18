local DutyList = {}

AddEventHandler('onResourceStart', function(r)
	if GetCurrentResourceName() == r then
		TriggerEvent("jim-closedshops:server:makeList")
		for k, v in pairs(Config.Shops) do
			for i = 1, #v.locations do
				MySQL.Async.insert('INSERT INTO closedshops (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE stash = :stash', { ['stash'] = k..i, ['items'] = json.encode({}) })
			end
		end
	end
end)

Core.Commands.Add("closedstock", "Access Closed Shops Stock (Boss Only)", {}, false, function(source) TriggerClientEvent("jim-closedshops:Stash:Manager", source) end)

RegisterServerEvent("jim-closedshops:server:makeList", function()
	if Config.Debug then print("^5Debug^7: ^3makeList^7: ^2Creating fresh duty list^7") end
	for k in pairs(Config.Shops) do DutyList[tostring(k)] = false end
	for _, v in pairs(Core.Functions.GetPlayers()) do
		local Player = Core.Functions.GetPlayer(v)
		if Player then
			for l in pairs(Config.Shops) do
				if Player.PlayerData.job.name == l and Player.PlayerData.job.onduty then DutyList[tostring(l)] = true
				end end end end
end)

RegisterServerEvent("jim-closedshops:server:updatelist", function()
	TriggerEvent("jim-closedshops:server:makeList")
	if Config.Debug then print("^5Debug^7: ^3updatelist^7: ^2Updating players with refreshed duty list^7") end
	TriggerClientEvent("jim-closedshops:ForceList", -1, DutyList)
end)

Core.Functions.CreateCallback('jim-closedshops:requestlist', function(source, cb) cb(DutyList) end)

local function getStash(stashId)
	local result, items = nil, {}
	result = MySQL.Sync.fetchScalar('SELECT items FROM closedshops WHERE stash = ?', { stashId })
	if result then
		local stashItems = json.decode(result)
		items = stashItems
	end
	return items
end

Core.Functions.CreateCallback('jim-closedshops:dutycheck', function(source, cb)
	local jobtable = {}
	for k, v in pairs(Config.Shops) do if v.enable then jobtable[tostring(k)] = false end end
	for _, id in pairs(Core.Functions.GetPlayers()) do
		local Player = Core.Functions.GetPlayer(id)
		if Player then
			for job in pairs(Config.Shops) do
				if Player.PlayerData.job.name == job and Player.PlayerData.job.onduty then
					jobtable[tostring(job)] = true
				end
			end
		end
	end
	if Config.Debug then print("^5Debug^7: ^dutycheck: ^6"..json.encode(jobtable).."^7") end
	cb(jobtable)
end)

RegisterServerEvent('jim-closedshops:GetItem', function(amount, billtype, item, name, price, job, stash)
	local src = source
	local Player = Core.Functions.GetPlayer(src)

	local stashItems = getStash(job..stash)
	if Config.Debug then print("^5Debug^7: ^3GetItem^7: ^2Retrieving stash info^7: ['^6"..job..stash.."^7']") end

	if Config.Inv == "ox" then
		local balance = billtype == "cash" and exports.ox_inventory:GetItem(src, "money", nil, true) or Player.Functions.GetMoney(tostring(billtype))
		local cost = (tonumber(price) * tonumber(amount))
		local canCash = (balance >= cost)
		local items = exports.ox_inventory:Items()
		local itemWeight = items[item].weight * amount
		local canCarryWeight, _ = exports.ox_inventory:CanCarryWeight(src, itemWeight)
		if canCash then
		if canCarryWeight then
				if billtype == "cash" then exports.ox_inventory:RemoveItem(src, "money", cost) else Player.Functions.RemoveMoney(tostring(billtype), cost, 'ticket-payment') end
				if Config.Renewed then
					exports["Renewed-Banking"]:addAccountMoney(tostring(job), cost - (cost * 0.15))
					if Config.Debug then print("^5Debug^7: ^3Renewed^7-^3Banking^7(^3Job^7): ^2Adding ^7$^6"..(cost - (cost * 0.15)).." ^2to account ^7'^6"..tostring(job).."^7'") end
				else
					exports["qb-management"]:AddMoney(tostring(job), cost - (cost * 0.15))
					if Config.Debug then print("^5Debug^7: ^3QB^7-^3Management^7(^3Job^7): ^2Adding ^7$^6"..(cost - (cost * 0.15)).." ^2to account ^7'^6"..tostring(job).."^7'") end
				end
				if exports.ox_inventory:AddItem(src, item, amount) then
					TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[item], "add", amount)
					TriggerEvent("qb-log:server:CreateLog", "shops", "Purchase from "..job..stash.." (ClosedShop) store", "blue","**" .. GetPlayerName(src) .. "**" .. " Purchased '**"..item.."**' x**"..amount.."** for a total of $**"..(tonumber(price) * tonumber(amount)).."** with **"..billtype.."**")
					TriggerEvent("jim-closedshops:server:Stash:Change",{ remove = true, item = item, setamount = amount, amount = stashItems[item], stash = job..stash })
				end
			else triggerNotify(nil, Loc[Config.Lan].error["nospace"], "error", src) end
		else triggerNotify(nil, Loc[Config.Lan].error["notenough"], "error", src) end
	else
		local balance = Player.Functions.GetMoney(tostring(billtype))
		local cost = (tonumber(price) * tonumber(amount))
		local canCash = (balance >= cost)
		local itemWeight = Core.Shared.Items[item].weight * amount
		local canCarryWeight = (GetTotalWeight(Player.PlayerData.items) + (Core.Shared.Items[item].weight * amount)) < 120000
		if canCash then
			if canCarryWeight then
				Player.Functions.RemoveMoney(tostring(billtype), cost, 'ticket-payment')
				if Config.Renewed then
					exports["Renewed-Banking"]:addAccountMoney(tostring(job), cost - (cost * 0.15))
					if Config.Debug then print("^5Debug^7: ^3Renewed^7-^3Banking^7(^3Job^7): ^2Adding ^7$^6"..(cost - (cost * 0.15)).." ^2to account ^7'^6"..tostring(job).."^7'") end
				else
					exports["qb-management"]:AddMoney(tostring(job), cost - (cost * 0.15))
					if Config.Debug then print("^5Debug^7: ^3QB^7-^3Management^7(^3Job^7): ^2Adding ^7$^6"..(cost - (cost * 0.15)).." ^2to account ^7'^6"..tostring(job).."^7'") end
				end
				if Player.Functions.AddItem(item, amount) then
					TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[item], "add", amount)
					TriggerEvent("qb-log:server:CreateLog", "shops", "Purchase from "..job..stash.." (ClosedShop) store", "blue","**" .. GetPlayerName(src) .. "**" .. " Purchased '**"..item.."**' x**"..amount.."** for a total of $**"..(tonumber(price) * tonumber(amount)).."** with **"..billtype.."**")
					TriggerEvent("jim-closedshops:server:Stash:Change",{ remove = true, item = item, setamount = amount, amount = stashItems[item], stash = job..stash })
				end
			else triggerNotify(nil, Loc[Config.Lan].error["nospace"], "error", src) end
		else triggerNotify(nil, Loc[Config.Lan].error["notenough"], "error", src) end
	end
	local data = { job = job, stash = stash, }
	TriggerClientEvent('jim-closedshops:ShopMenu', src, data)
end)

Core.Functions.CreateCallback('jim-closedshops:server:GetStashItems', function(source, cb, stashId) cb(getStash(stashId)) end)

RegisterNetEvent("jim-closedshops:server:Stash:Change", function(data)
	local src = source
	local items = getStash(data.stash)
	if data.remove == true then items[data.item] = data.amount - data.setamount
	elseif data.remove == false then items[data.item] = data.setamount + data.amount end
	MySQL.Async.insert('INSERT INTO closedshops (stash, items) VALUES (:stash, :items) ON DUPLICATE KEY UPDATE items = :items', { ['stash'] = data.stash, ['items'] = json.encode(items) })
end)

local function dupeWarn(src, item)
	local P = Core.Functions.GetPlayer(src)
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Tried to remove item ^7('^3"..item.."^7')^2 but it wasn't there^7")
	if not Config.Debug then DropPlayer(src, "^1Kicked for attempting to duplicate items") end
	print("^5DupeWarn: ^1"..P.PlayerData.charinfo.firstname.." "..P.PlayerData.charinfo.lastname.."^7(^1"..tostring(src).."^7) ^2Dropped from server for item duplicating^7")
end

RegisterNetEvent('jim-closedshops:server:toggleItem', function(give, item, amount, newsrc)
	local src = newsrc or source
	local Player = Core.Functions.GetPlayer(src)
	local remamount = (amount or 1)
	if give == 0 or give == false then
		if HasItem(src, item, amount or 1) then -- check if you still have the item
			while remamount > 0 do if Player.Functions.RemoveItem(item, 1) then end remamount -= 1 end
			TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[item], "remove", amount or 1)
			if Config.Debug then print("^5Debug^7: ^1Removing ^2from Player^7(^2"..src.."^7) '^6"..Core.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
		else dupeWarn(src, item) end -- if not boot the player
	else
		if Player.Functions.AddItem(item, amount or 1) then
			TriggerClientEvent('inventory:client:ItemBox', src, Core.Shared.Items[item], "add", amount or 1)
			if Config.Debug then print("^5Debug^7: ^4Giving ^2Player^7(^2"..src.."^7) '^6"..Core.Shared.Items[item].label.."^7(^2x^6"..(amount or "1").."^7)'") end
		end
	end
end)

if Config.Inv == "ox" then
	function HasItem(src, items, amount)
		local count = exports.ox_inventory:Search(src, 'count', items)
		if exports.ox_inventory:Search(src, 'count', items) >= (amount or 1) then
			if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^5FOUND^7 ^3"..count.."^7/^3"..(amount or 1).." "..tostring(items)) end return true
        else
			if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2"..tostring(items).." ^1NOT FOUND^7") end return false
		end
	end
else
	function HasItem(source, items, amount)
		local amount, count = amount or 1, 0
		local Player = Core.Functions.GetPlayer(source)
		if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Checking if player has required item^7 '^3"..tostring(items).."^7'") end
		for _, itemData in pairs(Player.PlayerData.items) do
			if itemData and (itemData.name == items) then
				if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2Item^7: '^3"..tostring(items).."^7' ^2Slot^7: ^3"..itemData.slot.." ^7x(^3"..tostring(itemData.amount).."^7)") end
				count += itemData.amount
			end
		end
		if count >= amount then if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^5FOUND^7 ^3"..count.."^7/^3"..(amount or 1).." "..tostring(items)) end return true end
		if Config.Debug then print("^5Debug^7: ^3HasItem^7: ^2"..tostring(items).." ^1NOT FOUND^7") end	return false
	end
end

local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/jimathy/UpdateVersions/master/jim-closedshops.txt', function(err, newestVersion, headers)
		local currentVersion = "^3"..GetResourceMetadata(GetCurrentResourceName(), 'version'):gsub("%.", "^7.^3").."^7"
		newestVersion = "^3"..newestVersion:sub(1, -2):gsub("%.", "^7.^3").."^7"
		if not newestVersion then print("Currently unable to run a version check.") return end
		print("^6Version Check^7: ^2Running^7: "..currentVersion.." ^2Latest^7: "..newestVersion)
		print(newestVersion == currentVersion and '^6You are running the latest version.^7 ('..currentVersion..')' or "^1You are currently running an outdated version^7, ^1please update^7!")
	end)
end
CheckVersion()