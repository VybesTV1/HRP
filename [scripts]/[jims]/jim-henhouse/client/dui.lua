local QBCore = exports[Config.Core]:GetCoreObject()

-- Dont touch these
local inZone
if Config.MLO == "SM" then

	local Targets = {}
	local txd = CreateRuntimeTxd('henTxd')
	local dui = {}
	local duiList = {}
	local Size = {
		["big"] = { 1024, 1024 },
		["medium"] = { 512, 512 },
	}

	-- Set this the lowest job grade that can change the images.
	-- Default is 4 - "Boss"
	local JobGrade = { ["henhouse"] = 4, ["police"] = 4, }

	-- This list is used to set up the targets, and hold other information
	-- Default images are in duiserver.lua
	local PresetList = {
		{ coords = vec3(-292.65, 6266.9, 32.78), radius = 0.7, tex = { texd = "smokey_henhouse_blbiny", texn = "bar_nabidka", size = Size["big"], }, },
		{ coords = vec3(-295.47, 6269.78, 34.28), radius = 0.7, tex = { texd = "smokey_henhouse_blbiny", texn = "schodiste_nabidka", size = Size["big"], }, },
		{ coords = vec3(-295.88, 6261.87, 35.65), radius = 0.8, tex = { texd = "smokey_henhouse_blbiny", texn = "truny", size = Size["big"], }, },
		{ coords = vec3(-295.77, 6268.34, 34.75), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "2_(1)", size = Size["medium"], }, },
		{ coords = vec3(-296.78, 6267.39, 35.2), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "3_(1)", size = Size["medium"], }, },
		{ coords = vec3(-302.27, 6276.68, 35.8), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "4_(1)", size = Size["medium"], }, },
		{ coords = vec3(-300.8, 6275.24, 35.8), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "5_(1)", size = Size["medium"], }, },
		{ coords = vec3(-301.51, 6275.84, 35.8), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "6_(1)", size = Size["medium"], }, },
		{ coords = vec3(-298.6, 6269.21, 35.8), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "7_(1)", size = Size["medium"], }, },
		{ coords = vec3(-298.27, 6272.45, 35.8), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "8_(1)", size = Size["medium"], }, },
		{ coords = vec3(-297.52, 6271.66, 35.8), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "9_(1)", size = Size["medium"], }, },
		{ coords = vec3(-297.72, 6269.99, 35.8), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "10_(1)", size = Size["medium"], }, },
		{ coords = vec3(-296.99, 6269.63, 34.75), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "11_(1)", size = Size["medium"], }, },
		{ coords = vec3(-292.6, 6265.22, 35.7), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "12_(1)", size = Size["medium"], }, },
		{ coords = vec3(-298.02, 6268.7, 35.2), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "13_(1)", size = Size["medium"], }, },
		{ coords = vec3(-299.01, 6265.89, 35.7), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "15_(1)", size = Size["medium"], }, },
		{ coords = vec3(-299.73, 6266.64, 35.7), radius = 0.5, tex = { texd = "smokey_henhouse_blbiny", texn = "17_(1)", size = Size["medium"], }, },
	}
	RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
		local p = promise.new()
		QBCore.Functions.TriggerCallback('jim-henhouse:Server:duiList', function(cb) p:resolve(cb) end)
		duiList = Citizen.Await(p)
		if inZone then
			for k, v in pairs(duiList) do TriggerEvent("jim-henhouse:ChangeDUI", { url = v.url, tex = k, texd = v.texd, size = v.size }) end
		end
	end)
	AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
		local p = promise.new()
		QBCore.Functions.TriggerCallback('jim-henhouse:Server:duiList', function(cb) p:resolve(cb) end)
		duiList = Citizen.Await(p)
		if inZone then
			for k, v in pairs(duiList) do TriggerEvent("jim-henhouse:ChangeDUI", { url = v.url, tex = k, texd = v.texd, size = v.size }) end
		end
	end)
	CreateThread(function()
		HenHouseDUI = PolyZone:Create({
					vec2(-304.70892333984, 6240.8828125),
					vec2(-269.72567749023, 6275.8076171875),
					vec2(-293.95980834961, 6300.6220703125),
					vec2(-329.74240112305, 6264.58203125)},
			{ name = "HenHouseDUI", debugPoly = Config.Debug })

		--Polyzone to help update/optimze the loading
		HenHouseDUI:onPlayerInOut(function(isPointInside)
			if isPointInside then inZone = true
				-- If in polyzone, grab new list from server side, and show new DUI's
				local p = promise.new() QBCore.Functions.TriggerCallback('jim-henhouse:Server:duiList', function(cb) p:resolve(cb) end)
				duiList = Citizen.Await(p)
				for k, v in pairs(duiList) do TriggerEvent("jim-henhouse:ChangeDUI", { url = v.url, tex = k, texd = v.texd, size = v.size }) end
			else inZone = false
				-- If outside polyzone, attempt to unload all DUI's to help optimization
				for k, v in pairs(duiList) do
					v.tex = k
					TriggerEvent("jim-henhouse:ClearDUI", v)
				end
				dui = {}
				duiList = {}
			end
		end)
		for k, v in pairs(PresetList) do
			Targets[v["tex"].texn] =
			exports['qb-target']:AddCircleZone(v["tex"].texn, v["coords"], v["radius"], { name=v["tex"].texn, debugPoly=Config.Debug, useZ=true, },
				{ options = {
						{ type = "client", event = "jim-henhouse:DuiSelect", icon = "fas fa-circle-check", label = Loc[Config.Lan].target["dui_add"], job = JobGrade, tex = v["tex"].texn, size = v["tex"].size, texd = v["tex"].texd },
						{ type = "server", event = "jim-henhouse:Server:ChangeDUI", icon = "fas fa-circle-minus", label = Loc[Config.Lan].target["dui_reset"], job = JobGrade, tex = v["tex"].texn, texd = v["tex"].texd },
						{ type = "server", event = "jim-henhouse:Server:ClearDUI", icon = "fas fa-circle-xmark", label = Loc[Config.Lan].target["dui_clear"], job = JobGrade, tex = v["tex"].texn, texd = v["tex"].texd, url = "-" },
				}, distance = 4.0 })
		end
	end)

	RegisterNetEvent("jim-henhouse:DuiSelect", function(data)
		local image = "" if duiList[tostring(data.tex)] then
			image = "<center>- Current Image -<br>"..
					"<img src="..duiList[tostring(data.tex)].url.." width=150px><br>"..
					"Size: ["..tonumber(data.size[1])..", "..tonumber(data.size[2]).."]<br><br>"
			end
		local dialog = exports['qb-input']:ShowInput({
			header = image..Loc[Config.Lan].menu["dui_new"],
			submitText = Loc[Config.Lan].menu["dui_change"],
			inputs = { { type = 'text', isRequired = true, name = 'url', text = Loc[Config.Lan].menu["dui_url"] } } })
		if dialog then
			if not dialog.url then return end
			data.url = dialog.url
			--Scan the link to see if it has an image extention otherwise, stop here.
			local searchList = { "png", "jpg", "jpeg", "gif", "webp", "bmp" }
			--Scan the link for certain terms that will flag it and refuse to show it
			local banList = { "porn" } -- I dunno, let me know what links people manage to find
			local searchFound = false
			for k,v in pairs(searchList) do	if string.find(tostring(data.url), tostring(v)) then searchFound = true	end end
			for k,v in pairs(banList) do if string.find(tostring(data.url), tostring(v)) then searchFound = false print("BANNED WORD: "..v) end end
			if searchFound then TriggerServerEvent('jim-henhouse:Server:ChangeDUI', data) end
		end
	end)

	RegisterNetEvent("jim-henhouse:ChangeDUI", function(data)
		if Config.Debug then print("^5Debug^7: ^2Recieving new DUI ^7- ^6"..data.url.."^7") end
		if (dui[tostring(data.tex)] or inZone) and tostring(data.url) ~= "-" then
			TriggerEvent("jim-henhouse:ClearDUI", data)
			--Add DUI to table
			dui[tostring(data.tex)] = CreateDui(tostring(data.url), data.size[1], data.size[2])
			local duihandle = GetDuiHandle(dui[tostring(data.tex)])
			if GetDuiHandle(dui[tostring(data.tex)]) then
				--Generate a random texture name, so it doesn't load the same one every time
				local txname = tostring(data.tex)..math.random(1000,9999)
				local tx = CreateRuntimeTextureFromDuiHandle(txd, tostring(txname), duihandle)
				AddReplaceTexture(tostring(data.texd), tostring(data.tex), 'henTxd', tostring(txname))
			end
		end
	end)

	RegisterNetEvent("jim-henhouse:ClearDUI", function(data)
		if dui[tostring(data.tex)] then
			RemoveReplaceTexture(tostring(data.texd), tostring(data.tex))
			DestroyDui(dui[tostring(data.tex)])
			dui[tostring(data.tex)] = nil
		end
	end)

	AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
		if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
			for k, v in pairs(duiList) do
				exports['qb-target']:RemoveZone(k)
				RemoveReplaceTexture(tostring(v.texd), tostring(k))
			end
		end
	end)
end