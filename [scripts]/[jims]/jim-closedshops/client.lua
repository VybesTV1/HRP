PlayerJob, PedProps, Targets, DutyList = {}, {}, {}, {}

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	Core.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job end)
	if Config.Debug then print("^5Debug^7: ^3OnPlayerLoaded^7: ^2Grabbing new duty list from server") end
	local p = promise.new() Core.Functions.TriggerCallback('jim-closedshops:requestlist', function(cb) p:resolve(cb) end)
	TriggerEvent("jim-closedshops:ForceList", Citizen.Await(p))
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
	for k in pairs(Config.Shops) do exports['qb-target']:RemoveZone("ClosedShop-['"..k.."']") end
	for _, v in pairs(Props) do unloadModel(GetEntityModel(v)) DeleteEntity(v) end
	for _, v in pairs(Peds) do unloadModel(GetEntityModel(v)) DeletePed(v) end
	TriggerServerEvent("jim-closedshops:server:updatelist")
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)	PlayerJob = JobInfo
	if Config.Debug then print("^5Debug^7: ^3OnJobUpdate^7: ^2Sending job and duty update to server ^7['^6"..PlayerJob.name.."^7'] = ^6"..tostring(PlayerJob.onduty)) end
	TriggerServerEvent("jim-closedshops:server:updatelist")
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty
	Wait(1000)
	if Config.Debug then print("^5Debug^7: ^3SetDuty^7: ^2Sending duty change to server") end
	TriggerServerEvent("jim-closedshops:server:updatelist")
end)

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	Core.Functions.GetPlayerData(function(PlayerData)	PlayerJob = PlayerData.job end)
	if Config.Debug then print("^5Debug^7: ^3onResourceStart^7: ^2Sending duty update to server ^7['^6"..PlayerJob.name.."^7'] = ^6"..tostring(PlayerJob.onduty)) end
	TriggerServerEvent("jim-closedshops:server:updatelist")
end)

RegisterNetEvent("jim-closedshops:ForceList", function(newList)
	local needupdate = false
	for k, v in pairs(newList) do
		if v ~= DutyList[k] then
			if Config.Debug then print("^5Debug^7: ^4DutyList^7[^6"..k.."^7] ^2changing to^7: '^6"..tostring(v).."^7'") end
			DutyList[k] = v
			needupdate = true
		end
	end
	if needupdate then
		if Config.Debug then print("^5Debug^7: ^3ForceList^7: ^2Recieved Updated Duty List from server and updating ped/prop spawns") end
		for job, info in pairs(Config.Shops) do
			if info.enable and Core.Shared.Jobs[job] then
				bossroles = {}
				for grade in pairs(Core.Shared.Jobs[job].grades) do
					if Core.Shared.Jobs[job].grades[grade].isboss == true then
						if bossroles[job] then
							if bossroles[job] > tonumber(grade) then bossroles[job] = tonumber(grade) end
						else bossroles[job] = tonumber(grade) end
					end
				end
				for i = 1, #info.locations do
					if DutyList[job] then
						DeletePed(PedProps[job..i])
						PedProps[job..i] = nil
						Targets[job..i] = nil
					elseif not DutyList[job] then
						if info.ped then
							if not DoesEntityExist(PedProps[job..i]) then
								DeletePed(PedProps[job..i])
								PedProps[job..i] = makePed(info.ped, Config.Shops[job].locations[i], 1, false)
								SetEntityInvincible(PedProps[job..i], true)
							end
						elseif info.prop then
							if not DoesEntityExist(PedProps[k]) then
								DeleteObject(PedProps[job..i])
								PedProps[job..i] = makeProp({prop = info.prop, coords = Config.Shops[job].locations[i]}, true, true)
							end
						end
						if not Targets[job..i] then
							Targets[job..i] =
								exports['qb-target']:AddTargetEntity(PedProps[job..i], { options = { {
									action = function()
										TriggerEvent("jim-closedshops:ShopMenu", { job = job, stash = i, ped = PedProps[job..i] } )
										lookEnt(PedProps[job..i])
										if GetResourceState("jim-talktonpc") == "started" then exports["jim-talktonpc"]:createCam(PedProps[job..i], true, "shop", true) end
									end,
									icon = "fas fa-shop", label = Loc[Config.Lan].target["open"],
								},{
									action = function()
										TriggerEvent("jim-closedshops:Stash:Manager")
										lookEnt(PedProps[job..i])
										if GetResourceState("jim-talktonpc") == "started" then exports["jim-talktonpc"]:createCam(PedProps[job..i], true, "shop", true) end
									end,
									icon = "fas fa-shop", label = Loc[Config.Lan].menu["access"], job = bossroles,
								}, }, distance = 2.0 })
						end
					end
				end
			end
		end
	end
end)

RegisterNetEvent('jim-closedshops:ShopMenu', function(data)
	local p = promise.new() Core.Functions.TriggerCallback('jim-closedshops:server:GetStashItems', function(cb) p:resolve(cb) end, data.job..data.stash)
	local StashItems = Citizen.Await(p)
	if Config.Debug then print("^5Debug^7: ^2Retrieving stash info^7: ['^6"..data.job..data.stash.."^7']") end
	local item = false
	local ShopMenu, ShopBuild = {}
	if PlayerJob.name == data.stash and PlayerJob.isboss then
		ShopMenu[#ShopMenu + 1] = {
			icon = "fas fa-boxes-stacked",
			header = Loc[Config.Lan].menu["access"], txt = Loc[Config.Lan].menu["bossonly"],
			onSelect = function() TriggerEvent("jim-closedshops:Stash:Manager", data) end,
		}
	end
	for k, v in pairsByKeys(Config.Shops[data.job].itemlist) do
		local header, text = true, "Out of Stock"
		if StashItems[k] ~= nil and StashItems[k] >= 1 then
			header = false
			text = Loc[Config.Lan].menu["avail"]..": x"..StashItems[k]..br..Loc[Config.Lan].menu["cost"]..": $"..Config.Shops[data.job].itemlist[k]
		end
		ShopMenu[#ShopMenu + 1] = {
			icon = "nui://"..Config.img..Core.Shared.Items[k].image,
			image = "nui://"..Config.img..Core.Shared.Items[k].image,
			header = Core.Shared.Items[k].label,
			isMenuHeader = header,
			txt = text,
			onSelect = function() TriggerEvent("jim-closedshops:Charge", { item = k, job = data.job, stash = data.stash, cost = Config.Shops[data.job].itemlist[k], max = StashItems[k] }) end,
		}
	end
	openMenu(ShopMenu, {
		header = Core.Shared.Jobs[data.job].label,
		onExit = not isOx() and function() end or nil,
	})
	lookEnt(data.ped)
end)

RegisterNetEvent('jim-closedshops:Charge', function(data)
	if Config.Menu == "ox" then
		local dialog = exports.ox_lib:inputDialog(Core.Shared.Items[data.item].label, {
			{ type = 'number', max = data.max, min = 0, label = Loc[Config.Lan].menu["tobuy"], description = Loc[Config.Lan].menu["avail"]..": "..data.max.." \n "..Loc[Config.Lan].menu["costper"]..": $"..data.cost },
			{ type = 'select', label = Loc[Config.Lan].menu["paytype"], options = { { value = "cash", label = Loc[Config.Lan].menu["cash"] }, { value = "bank", label = Loc[Config.Lan].menu["card"] } } },
		})
		if dialog then
			if Core.Shared.Items[data.item].unique then dialog[1] = 1 end
			if not dialog[1] then return end
			local amo = dialog[1] if string.find(tostring(amo), "-") then amo = string.gsub(tostring(amo), "-", "") dialog[1] = tonumber(amo) end
			if tonumber(dialog[1]) > tonumber(data.max) then TriggerEvent("jim-closedshops:Charge", data) triggerNotify(nil, Loc[Config.Lan].menu["notenough"], "error") return else
				TriggerServerEvent('jim-closedshops:GetItem', dialog[1], dialog[2], data.item, data.name, data.cost, data.job, data.stash)
				loadAnimDict('amb@prop_human_atm@male@enter')
				TaskPlayAnim(PlayerPedId(), 'amb@prop_human_atm@male@enter', "enter", 1.0,-1.0, 1500, 1, 1, true, true, true)
				unloadAnimDict('amb@prop_human_atm@male@enter')
			end
		end
	else
		local settext = "- "..Loc[Config.Lan].menu["confirm"].." -<br><br>"..Loc[Config.Lan].menu["avail"]..": "..data.max.."<br> "..Loc[Config.Lan].menu["costper"]..": $"..data.cost.."<br><br>- "..Loc[Config.Lan].menu["paytype"].." -"
		local input = {}
		input[#input+1] = { type = 'radio', name = 'billtype', text = settext, options = { { value = "cash", text = Loc[Config.Lan].menu["cash"] }, { value = "bank", text = Loc[Config.Lan].menu["card"] } } }

		if not Core.Shared.Items[data.item].unique then input[#input+1] = { type = 'number', isRequired = true, name = 'amount', text = Loc[Config.Lan].menu["tobuy"] } end

		local img = Core.Shared.Items[data.item].image
		if string.find(img, "http") then else img = "nui://"..Config.img..img end
		local dialog = exports['qb-input']:ShowInput({
			header = "<center><p><img src="..img.." width=100px onerror='this.onerror=null; this.remove();'></p>"..Core.Shared.Items[data.item].label,
			submitText = Loc[Config.Lan].menu["pay"],
			inputs = input
		})

		if dialog then
			if Core.Shared.Items[data.item].unique then dialog.amount = 1 end
			if not dialog.amount then return end
			local amo = dialog.amount if string.find(tostring(amo), "-") then amo = string.gsub(tostring(amo), "-", "") dialog.amount = tonumber(amo) end
			if tonumber(dialog.amount) > tonumber(data.max) then TriggerEvent("jim-closedshops:Charge", data) triggerNotify(nil, Loc[Config.Lan].menu["notenough"], "error") return else
				TriggerServerEvent('jim-closedshops:GetItem', dialog.amount, dialog.billtype, data.item, data.name, data.cost, data.job, data.stash)
				loadAnimDict('amb@prop_human_atm@male@enter')
				TaskPlayAnim(PlayerPedId(), 'amb@prop_human_atm@male@enter', "enter", 1.0,-1.0, 1500, 1, 1, true, true, true)
				unloadAnimDict('amb@prop_human_atm@male@enter')
			end
		end
	end
end)

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	for _, v in pairs(PedProps) do unloadModel(GetEntityModel(v)) DeleteEntity(v) end
end)