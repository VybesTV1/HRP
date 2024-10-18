local QBCore = exports[Config.Core]:GetCoreObject()

PlayerJob = {}
local Targets, Props, Blips, CraftLock, alcoholCount = {}, {}, {}, false, 0

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function() QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job if PlayerData.job.onduty then if PlayerData.job.name == Location.job then TriggerServerEvent("QBCore:ToggleDuty") end end end) end)
RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo) PlayerJob = JobInfo onDuty = PlayerJob.onduty end)
RegisterNetEvent('QBCore:Client:SetDuty', function(duty) onDuty = duty end)
AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	QBCore.Functions.GetPlayerData(function(PlayerData) PlayerJob = PlayerData.job if PlayerData.job.onduty then if PlayerData.job.name == Location.job then TriggerServerEvent("QBCore:ToggleDuty") end end end)
end)

CreateThread(function()
	local loc = Location
	local bossroles = {}
	if not QBCore.Shared.Jobs[loc.job] then print("^1Error^7: ^1Stopping Script^7. ^2Can't find the job ^7'^6"..loc.job.."^7' ^2in ^6QBCore^7.^6Shared^7.^6Jobs^7") return end
	for grade in pairs(QBCore.Shared.Jobs[loc.job].grades) do
		if QBCore.Shared.Jobs[loc.job].grades[grade].isboss == true then
			if bossroles[loc.job] then
				if bossroles[loc.job] > tonumber(grade) then bossroles[loc.job] = tonumber(grade) end
			else bossroles[loc.job] = tonumber(grade) end
		end
	end

	if loc.zoneEnable then
		JobLocation = PolyZone:Create(loc.zones, { name = loc.label, debugPoly = Config.Debug })
		JobLocation:onPlayerInOut(function(isPointInside)
			if PlayerJob.name == loc.job then
				if loc.autoClock and loc.autoClock.enter then if isPointInside and not onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
				if loc.autoClock and loc.autoClock.exit then if not isPointInside and onDuty then TriggerServerEvent("QBCore:ToggleDuty") end end
			end
		end)
	end

	if loc.blip then Blips[#Blips+1] = makeBlip({ coords = loc.blip, sprite = loc.blipsprite, col = loc.blipcolor, scale = loc.blipscale, disp = loc.blipdisp, category = loc.blipcat, name = loc.label }) end

	if Config.MLO == "SM" then

		Props[#Props+1] = makeProp({prop = "v_res_mchopboard", coords = vec4(-296.69, 6261.4, 31.48+1.1, -140.0)}, true, false)
		Props[#Props+1] = makeProp({prop = "prop_atm_01", coords = vec4(-305.71, 6252.18, 31.51, -46.0)}, true, false)
		Props[#Props+1] = makeProp({prop = "prop_food_tray_01", coords = vec4(-298.13, 6263.01, 32.58+0.03, -136.0)}, true, false)
		CreateModelHide(vec3(-296.93, 6261.96, 31.48), 1.5, -715967502, true)

		Targets["HenPrepared"] =
			exports['qb-target']:AddBoxZone("HenPrepared", vec3(-298.85, 6269.98, 31.52-1), 0.65, 1.5, { name="HenPrepared", heading = 223.06, debugPoly=Config.Debug, minZ = 30.5, maxZ = 31.62, },
				{ options = { {  event = "jim-henhouse:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].target["food"], stash = "Shelf", job = loc.job, coords = vec3(-298.85, 6269.98, 31.52), }, }, distance = 1.0 })

				--Tables
		local tabletables = {
			{ coords = vec3(-302.31, 6267.96, 31.5), minZ = 30.5, maxZ = 31.62, }, { coords = vec3(-304.47, 6270.22, 31.5), minZ = 30.5, maxZ = 31.62, },
			{ coords = vec3(-307.59, 6257.14, 31.5), minZ = 30.5, maxZ = 31.62, }, { coords = vec3(-305.44, 6254.92, 31.5), minZ = 30.5, maxZ = 31.62, },

			{ coords = vec3(-303.66, 6275.43, 34.29), minZ = 33.5, maxZ = 34.5, }, { coords = vec3(-299.39, 6270.57, 34.29), minZ = 33.5, maxZ = 34.5, },
		}
		for i = 1, #tabletables do
			Targets["HenTable"..i] =
				exports['qb-target']:AddBoxZone("HenTable"..i, vec3(tabletables[i].coords.x, tabletables[i].coords.y, tabletables[i].coords.z-0.8), 0.7, 0.7,
					{ name="HenTable"..i, heading = 0.0, debugPoly=Config.Debug, minZ = tabletables[i].minZ, maxZ = tabletables[i].maxZ, },
					{ options = { {  event = "jim-henhouse:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].target["table"], stash = "Table"..i }, }, distance = 2.0 })
		end

		Targets["HenFridge"] =
			exports['qb-target']:AddBoxZone("HenFridge", vec3(-293.99, 6264.14, 31.52-1), 0.75, 1.4, { name="HenFridge", heading = 223.06, debugPoly=Config.Debug, minZ = 30.5, maxZ = 32.30, },
				{ options = { {  event = "jim-henhouse:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].target["drink_fridge"], shop = Ingredients.DrinkItems, job = loc.job, shopname = "smdrinkfridge", coords = vec3(-293.99, 6264.14, 31.52), }, }, distance = 1.0 })
		Targets["HenFridge2"] =
			exports['qb-target']:AddBoxZone("HenFridge2", vec3(-301.63, 6272.5, 31.49-1), 1.55, 0.4, { name="HenFridge2", heading = 313.0, debugPoly=Config.Debug, minZ=30.49, maxZ=32.69, },
				{ options = { {  event = "jim-henhouse:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].target["drink_fridge"], shop = Ingredients.DrinkItems, job = loc.job, coords = vec3(-301.63, 6272.5, 31.49), }, }, distance = 1.0 })
		Targets["HenFridge3"] =
			exports['qb-target']:AddBoxZone("HenFridge3", vec3(-300.04, 6273.75, 31.38-1), 0.8, 1.0, { name="HenFridge3", heading = 223.06, debugPoly=Config.Debug, minZ = 30.5, maxZ = 32.80, },
				{ options = { {  event = "jim-henhouse:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].target["food_fridge"], shop = Ingredients.FoodItems, job = loc.job, coords = vec3(-300.04, 6273.75, 31.38), }, }, distance = 2.0 })

		Targets["HenWash1"] =
			exports['qb-target']:AddBoxZone("HenWash1", vec3(-299.96, 6270.31, 31.52-1), 1.2, 0.6, { name="HenWash1", heading = 223.06, debugPoly=Config.Debug, minZ = 30.5, maxZ = 31.62, },
				{ options = { { event = "jim-henhouse:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].target["hands"], job = loc.job, coords = vec3(-299.96, 6270.31, 31.52), }, }, distance = 1.5 })
		Targets["HenWash2"] =
			exports['qb-target']:AddBoxZone("HenWash2", vec3(-301.93, 6273.9, 31.5-1), 0.8, 0.8, { name="HenWash2", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 31.75, },
				{ options = { { event = "jim-henhouse:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].target["hands"], coords = vec3(-301.93, 6273.9, 31.5), }, }, distance = 1.2 })
		Targets["HenWash3"] =
			exports['qb-target']:AddBoxZone("HenWash3", vec3(-302.63, 6273.15, 31.5-1), 0.8, 0.8, { name="HenWash3", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 31.75, },
				{ options = { { event = "jim-henhouse:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].target["hands"], coords = vec3(-302.63, 6273.15, 31.5), }, }, distance = 1.2 })

		Targets["HenCounter"] =
			exports['qb-target']:AddBoxZone("HenCounter", vec3(-298.31, 6263.04, 31.85-0.5), 0.7, 1.0, { name="HenCounter", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].target["counter"], stash = "Counter1", coords = vec3(-298.31, 6263.04, 31.85), }, }, distance = 2.0 })

		Targets["HenReceipt"] =
			exports['qb-target']:AddBoxZone("HenReceipt", vec3(-298.3, 6261.75, 31.85-0.5), 0.6, 0.6, { name="HenReceipt", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].target["charge"], job = loc.job, coords = vec3(-298.3, 6261.75, 31.85),
					img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/1/14/TheHenHouse-GTAV-Logo.png width=150px></p>" },
							}, distance = 2.0 })

		Targets["HenCocktails"] =
			exports['qb-target']:AddBoxZone("HenCocktails", vec3(-296.3, 6261.68, 31.85-0.5), 0.8, 1.8, { name="HenCocktails", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].target["cocktail"], job = loc.job, craftable = Crafting.Cocktails, header = Loc[Config.Lan].menu["header_cocktail"], coords = vec3(-296.3, 6261.68, 31.85), }, },
					distance = 2.0 })

		Targets["HenTap"] =
			exports['qb-target']:AddBoxZone("HenTap", vec3(-297.31, 6263.79, 31.85-0.2), 0.7, 1.0, { name="HenTap", heading = 223.06, debugPoly=Config.Debug, minZ = 31.5, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-beer", label = Loc[Config.Lan].target["beer"], job = loc.job, craftable = Crafting.Beer, header = Loc[Config.Lan].menu["header_beer"], coords = vec3(-297.31, 6263.79, 31.85), }, }, distance = 1.5 })

		Targets["HenCoffee"] =
			exports['qb-target']:AddBoxZone("HenCoffee", vec3(-295.21, 6262.65, 31.85-0.5), 0.7, 0.7, { name="HenCoffee", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].target["coffee"], job = loc.job, craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["header_beer"], coords = vec3(-295.21, 6262.65, 31.85), }, }, distance = 1.5 })

		Targets["HenOven"] =
			exports['qb-target']:AddBoxZone("HenOven", vec3(-297.73, 6271.01, 32.39-2), 0.9, 1.45, { name="HenOven", heading = 223.06, debugPoly=Config.Debug, minZ = 30.5, maxZ = 31.60, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].target["oven"], job = loc.job, craftable = Crafting.Food, header = Loc[Config.Lan].menu["header_oven"], coords = vec3(-297.73, 6271.01, 32.39), }, },
					distance = 2.0 })

		Targets["HenClockin"] =
			exports['qb-target']:AddBoxZone("HenClockin", vec3(-294.66, 6263.22, 31.85-0.5), 0.6, 0.6, { name="HenClockin", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].target["duty"], job = loc.job, coords = vec3(-294.66, 6263.22, 31.85), },
					}, distance = 2.0 })

		Targets["HenBoss"] =
			exports['qb-target']:AddBoxZone("HenBoss", vec3(-295.19, 6266.11, 34.8-1), 0.6, 0.6, { name="HenBoss", heading = 0.0, debugPoly=Config.Debug, minZ = 34.0, maxZ = 35.2, },
				{ options = { { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].target["boss"], job = bossroles, coords = vec3(-295.19, 6266.11, 34.8), }, }, distance = 2.0 })

	elseif Config.MLO == "GN" then

		CreateModelHide(-303.32, 6275.41, 30.53, 1.5, -368490772, true)
		CreateModelHide(-305.3, 6274.96, 31.01, 1.5, -851111464, true)
		CreateModelHide(-303.32, 6275.41, 30.53, 1.5, -1803429498, true)
		CreateModelHide(-303.2, 6276.67, 30.52, 1.5, 531440379, true)
		CreateModelHide(-303.2, 6276.67, 30.52, 1.5, -819616509, true)
		CreateModelHide(-301.74, 6275.73, 30.52, 1.5, 856312526, true)
		CreateModelHide(-306.4, 6273.78, 30.53, 1.5, 686990798, true)
		CreateModelHide(-306.4, 6273.78, 30.53, 1.5, 1872828871, true)

		Props[#Props+1] = makeProp({ prop = "prop_bar_caddy", coords = vec4(-304.89, 6270.35, 32.62, 43.22) }, true, false)
		Props[#Props+1] = makeProp({ prop = "v_res_mchopboard", coords = vec4(-304.51, 6270.82, 32.62, 43.22) }, true, false)
		Props[#Props+1] = makeProp({ prop = "prop_bar_drinkstraws", coords = vec4(-304.19, 6271.20, 32.62, 43.22) }, true, false)
		Props[#Props+1] = makeProp({ prop = "prop_cooker_03", coords = vec4(-304.70, 6275.48, 31.53, 41.2) }, true, false)
		Props[#Props+1] = makeProp({ prop = "prop_ff_counter_01", coords = vec4(-303.52, 6276.63, 31.53, 41.1) }, true, false)
		Props[#Props+1] = makeProp({ prop = "prop_ff_counter_01", coords = vec4(-305.89, 6274.38, 31.53, 42.90) }, true, false)
		Props[#Props+1] = makeProp({ prop = "v_res_r_silvrtray", coords = vec4(-304.36, 6267.76, 32.68, 220) }, true, false)
		Props[#Props+1] = makeProp({ prop = "v_res_r_silvrtray", coords = vec4(-305.81, 6266.53, 32.68, 220) }, true, false)
		Props[#Props+1] = makeProp({ prop = "prop_atm_01", coords = vec4(-305.71, 6252.18, 31.51, -46.0) }, true, false)
		--Props[#Props+1] = makeProp({prop = "h4_prop_h4_ld_keypad_01d", coords = vec4(-304.44, 6275.7, 31.53, 50.04) }, true, false) v_res_r_silvrtray

		Targets["BWPrepared"] =
			exports['qb-target']:AddBoxZone("BWPrepared", vec3(-305.89, 6274.38, 31.53-1), 0.65, 1.5, { name="BWPrepared", heading = 223.06, debugPoly=Config.Debug, minZ = 30.5, maxZ = 31.62, },
				{ options = { {  event = "jim-henhouse:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].target["food"], stash = "Shelf", job = loc.job, coords = vec3(-305.89, 6274.38, 31.53), }, }, distance = 1.0 })

		--Tables
		local tabletables = {
			{ coords = vec3(-298.71, 6266.15, 31.53), minZ = 30.5, maxZ = 31.62, }, { coords = vec3(-296.43, 6263.76, 31.53), minZ = 30.5, maxZ = 31.62, },
			{ coords = vec3(-299.48, 6260.86, 31.53), minZ = 30.5, maxZ = 31.62, },	{ coords = vec3(-301.80, 6263.26, 31.53), minZ = 30.5, maxZ = 31.62, },

			{ coords = vec3(-303.94, 6270.6, 34.79), minZ = 33.5, maxZ = 35.0, }, { coords = vec3(-303.29, 6263.59, 34.89), minZ = 33.5, maxZ = 35.0, },
			{ coords = vec3(-300.14, 6260.48, 34.89), minZ = 33.5, maxZ = 35.0, }, { coords = vec3(-297.25, 6264.07, 34.89), minZ = 33.5, maxZ = 35.0, },
			{ coords = vec3(-299.94, 6266.89, 34.89), minZ = 33.5, maxZ = 35.0, },
		}
		for i = 1, #tabletables do
			Targets["BWTable"..i] =
				exports['qb-target']:AddBoxZone("BWTable"..i, vec3(tabletables[i].coords.x, tabletables[i].coords.y, tabletables[i].coords.z-0.8), 0.7, 0.7,
					{ name="BWTable"..i, heading = 0.0, debugPoly=Config.Debug, minZ = tabletables[i].minZ, maxZ = tabletables[i].maxZ, },
					{ options = { {  event = "jim-henhouse:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].target["table"], stash = "Table"..i }, }, distance = 2.0 })
		end
		-- Fridges
		Targets["BWDrinkFridge"] =
			exports['qb-target']:AddBoxZone("BWDrinkFridge", vec3(-312.34, 6266.12, 31.53-1), 0.55, 0.9, { name="BWDrinkFridge", heading = 225.80, debugPoly=Config.Debug, minZ = 30.5, maxZ = 32.30, },
				{ options = { {  event = "jim-henhouse:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].target["drink_fridge"], shop = Ingredients.DrinkItems, job = loc.job, shopname = "bwdrinkfridge", coords = vec3(-293.99, 6264.14, 31.52), }, }, distance = 1.0 })

		Targets["BWDrinkFridge2"] =
			exports['qb-target']:AddBoxZone("BWDrinkFridge2", vec3(-305.95, 6269.59, 31.53-1), 1.6, 0.8, { name="BWDrinkFridge2", heading = 313.0, debugPoly=Config.Debug, minZ=27.53, maxZ=31.53, },
				{ options = { {  event = "jim-henhouse:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].target["drink_fridge"], shop = Ingredients.DrinkItems, job = loc.job, shopname = "bwdrinkfridge2", coords = vec3(-301.63, 6272.5, 31.49), }, }, distance = 1.0 })


		Targets["BWFoodFridge"] =
			exports['qb-target']:AddBoxZone("BWFoodFridge", vec3(-311.74, 6266.81, 31.53-1), 0.61, 0.9, { name="BWFoodFridge", heading = 225.80, debugPoly=Config.Debug, minZ = 30.5, maxZ = 32.30, },
				{ options = { {  event = "jim-henhouse:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].target["food_fridge"], shop = Ingredients.FoodItems, job = loc.job, shopname = "bwfoodfridge", coords = vec3(-300.04, 6273.75, 31.38), }, }, distance = 2.0 })

		--HandWash
		Targets["BWWash1"] =
			exports['qb-target']:AddBoxZone("BWWash1", vec3(-308.93, 6263.1, 28.75-0.5), 0.6, 2.5, { name="BWWash1", heading = 43.61, debugPoly=Config.Debug, minZ = 28.2, maxZ = 29.1, },
				{ options = { { event = "jim-henhouse:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].target["hands"], coords = vec3(-308.93, 6263.1, 28.75), }, }, distance = 1.5 })

		--Counters/Trays
		Targets["BWCounter"] =
			exports['qb-target']:AddBoxZone("BWCounter", vec3(-305.81, 6266.53, 32.68-1.03), 0.7, 1.0, { name="BWCounter", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].target["counter"], stash = "Counter1", coords = vec3(-305.81, 6266.53, 32.68), }, }, distance = 2.0 })
		Targets["BWCounter2"] =
			exports['qb-target']:AddBoxZone("BWCounter2", vec3(-304.36, 6267.76, 32.68-1.03), 0.7, 0.6, { name="BWCounter2", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].target["counter"], stash = "Counter2", coords = vec3(-304.36, 6267.76, 32.68), }, }, distance = 2.0 })

		--Payments
		Targets["BWReceipt"] =
			exports['qb-target']:AddBoxZone("BWReceipt", vec3(-302.82, 6272.46, 31.53), 0.6, 0.6, { name="BWReceipt", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = {{ event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].target["charge"], job = loc.job, coords = vec3(-302.82, 6272.46, 31.53),
					img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/1/14/TheHenHouse-GTAV-Logo.png width=150px></p>" },
					{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].target["duty"], job = loc.job, coords = vec3(-302.82, 6272.46, 31.53),},}, distance = 2.0 } )
		Targets["BWReceipt2"] =
			exports['qb-target']:AddBoxZone("BWReceipt2", vec3(-307.59, 6268.44, 31.53), 0.6, 0.6, { name="BWReceipt2", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].target["charge"], job = loc.job, coords = vec3(-307.59, 6268.44, 31.53),
					img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/1/14/TheHenHouse-GTAV-Logo.png width=150px></p>" },
					{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].target["duty"], job = loc.job, coords = vec3(-307.59, 6268.44, 31.53),},
					{ event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].target["boss"], job = bossroles, coords = vec3(-295.19, 6266.11, 34.8), },}, distance = 2.0 })

		Targets["BWCocktails"] =
			exports['qb-target']:AddBoxZone("BWCocktails", vec3(-304.63, 6270.91, 31.53), 0.8, 1.8, { name="BWCocktails", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].target["cocktail"], job = loc.job, craftable = Crafting.Cocktails, header = Loc[Config.Lan].menu["header_cocktail"], coords = vec3(-304.63, 6270.91, 31.53), }, },
				distance = 2.0 })

		Targets["BWTap"] =
			exports['qb-target']:AddBoxZone("HenTap", vec3(-303.1, 6268.86, 31.53), 0.7, 1.0, { name="BWTap", heading = 223.06, debugPoly=Config.Debug, minZ = 31.5, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-beer", label = Loc[Config.Lan].target["beer"], job = loc.job, craftable = Crafting.Beer, header = Loc[Config.Lan].menu["header_beer"], coords = vec3(-303.1, 6268.86, 31.53), }, }, distance = 1.5 })
		Targets["BWTap2"] =
			exports['qb-target']:AddBoxZone("BWTap2", vec3(-305.13, 6267.34, 31.53), 0.7, 1.0, { name="BWTap2", heading = 223.06, debugPoly=Config.Debug, minZ = 31.5, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-beer", label = Loc[Config.Lan].target["beer"], job = loc.job, craftable = Crafting.Beer, header = Loc[Config.Lan].menu["header_beer"], coords = vec3(-305.13, 6267.34, 31.53), }, }, distance = 1.5 })

		Targets["BWCoffee"] =
			exports['qb-target']:AddBoxZone("BWCoffee", vec3(-303.62, 6272.23, 31.53), 0.7, 0.7, { name="BWCoffee", heading = 223.06, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].target["coffee"], job = loc.job, craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["header_beer"], coords = vec3(-295.21, 6262.65, 31.85), }, }, distance = 1.5 })

		Targets["BWOven"] =
			exports['qb-target']:AddBoxZone("BWOven", vec3(-304.70, 6275.48, 31.53-1), 0.9, 1.45, { name="BWOven", heading = 223.06, debugPoly=Config.Debug, minZ = 30.5, maxZ = 31.60, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].target["oven"], job = loc.job, craftable = Crafting.Food, header = Loc[Config.Lan].menu["header_oven"], coords = vec3(-303.62, 6272.23, 31.53), }, },
				distance = 2.0 })
	elseif Config.MLO == "PR" then


		for _, coords in pairs({ vec4(-297.97, 6265.46, 32.57, 42.22), vec4(-301.21, 6266.06, 32.57, 314.5), vec4(-303.19, 6268.15, 32.57, 314.5), vec4(-304.72, 6269.79, 32.57, 314.5) }) do Props[#Props+1] = makeProp({prop = "prop_food_tray_01", coords = coords}, true, false) end

		Targets["HenPrepared"] =
			exports['qb-target']:AddBoxZone("HenPrepared", vec3(-304.55, 6275.7, 30.49), 1.0, 0.65, { name="HenPrepared", heading = 313.2, debugPoly=Config.Debug, minZ = 30.5, maxZ = 31.62, },
				{ options = { {  event = "jim-henhouse:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].target["food"], stash = "Shelf", job = loc.job, coords = vec3(-304.55, 6275.7, 31.49), }, }, distance = 1.0 })

		--Tables
		local tabletables = {
			{ coords = vec3(-298.72, 6260.52, 31.49), minZ = 30.5, maxZ = 32, }, { coords = vec3(-296.93, 6262.18, 31.49), minZ = 30.5, maxZ = 32, },
			{ coords = vec3(-295.14, 6263.87, 31.49), minZ = 30.5, maxZ = 32, }, { coords = vec3(-310.51, 6260.31, 31.49), minZ = 30.5, maxZ = 32, },
			{ coords = vec3(-308.96, 6258.49, 31.49), minZ = 30.5, maxZ = 32, }, { coords = vec3(-307.28, 6256.73, 31.49), minZ = 30.5, maxZ = 32, },
			{ coords = vec3(-305.26, 6261.10, 31.49), minZ = 30.5, maxZ = 32, }, { coords = vec3(-302.39, 6261.65, 31.49), minZ = 30.5, maxZ = 32, },
			{ coords = vec3(-305.47, 6258.53, 31.49), minZ = 30.5, maxZ = 32, },
		}
		for i = 1, #tabletables do
			Targets["HenTable"..i] =
				exports['qb-target']:AddBoxZone("HenTable"..i, vec3(tabletables[i].coords.x, tabletables[i].coords.y, tabletables[i].coords.z-0.8), 0.7, 0.7,
					{ name="HenTable"..i, heading = 225, debugPoly=Config.Debug, minZ = tabletables[i].minZ, maxZ = tabletables[i].maxZ, },
					{ options = { {  event = "jim-henhouse:Stash", icon = "fas fa-box-open", label = Loc[Config.Lan].target["table"], stash = "Table"..i }, }, distance = 2.0 })
		end

		-----Drinks
		Targets["HenFridge"] =
			exports['qb-target']:AddBoxZone("HenFridge", vec3(-298.08, 6266.78, 30.49), 0.65, 0.7, { name="HenFridge", heading = 314.5, debugPoly=Config.Debug, minZ=30.49, maxZ=32.69, },
				{ options = { {  event = "jim-henhouse:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].target["drink_fridge"], shop = Ingredients.DrinkItems, job = loc.job, shopname = "prdrinkfridge", coords = vec3(-301.63, 6272.5, 31.49), }, }, distance = 1.0 })
		Targets["HenFridge2"] =
			exports['qb-target']:AddBoxZone("HenFridge2", vec3(-302.7, 6272.94, 30.49), 0.8, 1.0, { name="HenFridge2", heading = 223.06, debugPoly=Config.Debug, minZ = 30.5, maxZ = 32.80, },
				{ options = { {  event = "jim-henhouse:Shop", icon = "fas fa-archive", label = Loc[Config.Lan].target["food_fridge"], shop = Ingredients.FoodItems, job = loc.job, shopname = "prdrinkfridge", coords = vec3(-302.7, 6272.94, 31.49), }, }, distance = 2.0 })

		--- HAND WASH
		Targets["HenWash1"] =
			exports['qb-target']:AddBoxZone("HenWash1", vec3(-306.38, 6273.83, 30.52), 1.2, 0.6, { name="HenWash1", heading = 315, debugPoly=Config.Debug, minZ = 30.5, maxZ = 31.62, },
				{ options = { { event = "jim-henhouse:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].target["hands"], job = loc.job, coords = vec3(-299.96, 6270.31, 31.52), }, }, distance = 1.5 })
		Targets["HenWash2"] =
			exports['qb-target']:AddBoxZone("HenWash2", vec3(-300.56, 6269.31, 30.49), 0.6, 0.6, { name="HenWash1", heading = 315, debugPoly=Config.Debug, minZ = 30.5, maxZ = 31.62, },
				{ options = { { event = "jim-henhouse:washHands", icon = "fas fa-hand-holding-water", label = Loc[Config.Lan].target["hands"], job = loc.job, coords = vec3(-300.56, 6269.31, 31.49), }, }, distance = 1.5 })

		---- COUNTER
		Targets["HenCounter"] =
			exports['qb-target']:AddBoxZone("HenCounter", vec3(-297.97, 6265.46, 32.57-1.03), 0.6, 0.6, { name="HenCounter", heading = 42.22, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].target["counter"], stash = "Counter1", coords = vec3(-298.31, 6263.04, 31.85), }, }, distance = 2.0 })
		Targets["HenCounter2"] =
			exports['qb-target']:AddBoxZone("HenCounter2", vec3(-301.21, 6266.06, 32.57-1.03), 0.6, 0.6, { name="HenCounter2", heading = 314.5, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].target["counter"], stash = "Counter2", coords = vec3(-298.31, 6263.04, 31.85), }, }, distance = 2.0 })
		Targets["HenCounter3"] =
			exports['qb-target']:AddBoxZone("HenCounter3", vec3(-303.19, 6268.15, 32.57-1.03), 0.6, 0.6, { name="HenCounter3", heading = 314.5, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].target["counter"], stash = "Counter3", coords = vec3(-298.31, 6263.04, 31.85), }, }, distance = 2.0 })
		Targets["HenCounter4"] =
			exports['qb-target']:AddBoxZone("HenCounter4", vec3(-304.72, 6269.79, 32.57-1.03), 0.6, 0.6, { name="HenCounter4", heading = 314.5, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Stash", icon = "fas fa-hamburger", label = Loc[Config.Lan].target["counter"], stash = "Counter4", coords = vec3(-298.31, 6263.04, 31.85), }, }, distance = 2.0 })

		---- POS
		Targets["HenReceipt"] =
			exports['qb-target']:AddBoxZone("HenReceipt", vec3(-298.81, 6267.56, 31.57), 0.6, 0.6, { name="HenReceipt", heading = 314.5, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-payments:client:Charge", icon = "fas fa-credit-card", label = Loc[Config.Lan].target["charge"], job = loc.job, coords = vec3(-298.3, 6261.75, 31.85),
					img = "<center><p><img src=https://static.wikia.nocookie.net/gtawiki/images/1/14/TheHenHouse-GTAV-Logo.png width=150px></p>" },
				{ type = "server", event = "QBCore:ToggleDuty", icon = "fas fa-user-check", label = Loc[Config.Lan].target["duty"], job = loc.job, coords = vec3(-294.66, 6263.22, 31.85), }, }, distance = 2.0 })

		--- Cocktails

		Targets["HenCocktails"] =
			exports['qb-target']:AddBoxZone("HenCocktails", vec3(-301.96, 6270.93, 31.49), 0.6, 0.6, { name="HenCocktails", heading = 317, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-cocktail", label = Loc[Config.Lan].target["cocktail"], job = loc.job, craftable = Crafting.Cocktails, header = Loc[Config.Lan].menu["header_cocktail"], coords = vec3(-301.96, 6270.93, 31.49), },
					{ event = "jim-henhouse:Crafting", icon = "fas fa-beer", label = Loc[Config.Lan].target["beer"], job = loc.job, craftable = Crafting.Beer, header = Loc[Config.Lan].menu["header_beer"], coords = vec3(-301.96, 6270.93, 31.49), }, },
					distance = 2.0 })

		Targets["HenCoffee"] =
			exports['qb-target']:AddBoxZone("HenCoffee", vec3(-303.92, 6276.28, 31.49), 0.6, 0.6, { name="HenCoffee", heading = 314, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-mug-hot", label = Loc[Config.Lan].target["coffee"], job = loc.job, craftable = Crafting.Coffee, header = Loc[Config.Lan].menu["header_beer"], coords = vec3(-303.92, 6276.28, 31.49), }, }, distance = 1.5 })

		Targets["HenOven"] =
			exports['qb-target']:AddBoxZone("HenOven", vec3(-305.32, 6274.66, 30.39), 1.45, 0.9, { name="HenOven", heading = 315, debugPoly=Config.Debug, minZ = 30.5, maxZ = 31.60, },
				{ options = { { event = "jim-henhouse:Crafting", icon = "fas fa-temperature-high", label = Loc[Config.Lan].target["oven"], job = loc.job, craftable = Crafting.Food, header = Loc[Config.Lan].menu["header_oven"], coords = vec3(-305.32, 6274.66, 32.39), }, },
				distance = 2.0 })

		Targets["HenBoss"] =
			exports['qb-target']:AddBoxZone("HenBoss", vec3(-299.54, 6269.67, 31.49), 0.6, 0.6, { name="HenBoss", heading = 314, debugPoly=Config.Debug, minZ = 31.4, maxZ = 32.0, },
				{ options = { { event = "qb-bossmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].target["boss"], job = bossroles, coords = vec3(-299.54, 6269.67, 31.49), }, }, distance = 2.0 })

	end
end)

RegisterNetEvent('jim-henhouse:washHands', function(data)
	if progressBar({ label = Loc[Config.Lan].progressbar["progress_washing"], time = 5000, cancel = true, dict = "mp_arresting", anim = "a_uncuff", flag = 8, icon = "fas fa-hand-holding-droplet" }) then
		triggerNotify(nil, Loc[Config.Lan].success["washed_hands"], 'success')
	else
		TriggerEvent('inventory:client:busy:status', false) triggerNotify(nil, Loc[Config.Lan].error["cancel"], 'error')
	end
	ClearPedTasks(PlayerPedId())
end)

--[[ CRAFTING ]]--
RegisterNetEvent('jim-henhouse:Crafting:MakeItem', function(data)
	if not CraftLock then CraftLock = true else return end
	local bartext, bartime = "", 0
	for i = 1, #Crafting.Cocktails do
		for k in pairs(Crafting.Cocktails[i]) do
			if data.item == k then
				bartext = Loc[Config.Lan].progressbar["progress_mix"] bartime = 7000
				animDictNow = "anim@heists@prison_heiststation@cop_reactions" animNow = "cop_b_idle"
			end
		end
	end
	for i = 1, #Crafting.Food do
		for k in pairs(Crafting.Food[i]) do
			if data.item == k then
				bartext = Loc[Config.Lan].progressbar["progress_cook"] bartime = 5000
				animDictNow = "amb@prop_human_bbq@male@base" animNow = "base"
			end
		end
	end
	for i = 1, #Crafting.Beer do
		for k in pairs(Crafting.Beer[i]) do
			if data.item == k then
				bartext = Loc[Config.Lan].progressbar["progress_pour"] bartime = 3000
				animDictNow = "mp_ped_interaction" animNow = "handshake_guy_a"
			end
		end
	end
	if data.item == "coffee" then
		bartext = Loc[Config.Lan].progressbar["progress_pour"] bartime = 3000
		animDictNow = "mp_ped_interaction" animNow = "handshake_guy_a"
	end
	if (data.amount and data.amount ~= 1) then data.craft["amount"] = data.amount
		for k, v in pairs(data.craft[data.item]) do	data.craft[data.item][k] *= data.amount	end
		bartime *= data.amount bartime *= 0.9
	end
	if progressBar({ label = bartext..QBCore.Shared.Items[data.item].label, time = bartime, cancel = true, dict = animDictNow, anim = animNow, flag = 8, icon = data.item }) then
		CraftLock = false
		TriggerServerEvent('jim-henhouse:Crafting:GetItem', data.item, data.craft)
		Wait(500)
		TriggerEvent("jim-henhouse:Crafting", data)
	else
		CraftLock = false
		TriggerEvent('inventory:client:busy:status', false)
	end
	ClearPedTasks(PlayerPedId())
end)

RegisterNetEvent('jim-henhouse:Crafting', function(data)
	if CraftLock then return end
	if not jobCheck() then return end
	local Menu = {}
	if Config.Menu == "qb" then
		Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true }
		Menu[#Menu + 1] = { icon = "fas fa-circle-xmark", header = "", txt = Loc[Config.Lan].menu["close"], params = { event = "" } }
	end
	for i = 1, #data.craftable do
		for k, v in pairs(data.craftable[i]) do
			if k ~= "amount" then
				local text = ""
				setheader = QBCore.Shared.Items[tostring(k)].label
				if data.craftable[i]["amount"] ~= nil then setheader = setheader.." x"..data.craftable[i]["amount"] end
				local disable = false
				local checktable = {}
				for l, b in pairs(data.craftable[i][tostring(k)]) do
					if b == 0 or b == 1 then number = "" else number = " x"..b end
					if not QBCore.Shared.Items[l] then print("^3Error^7: ^2Script can't find ingredient item in QB-Core items.lua - ^1"..l.."^7") return end
					if Config.Menu == "ox" then text = text..QBCore.Shared.Items[l].label..number.."\n" end
					if Config.Menu == "qb" then text = text.."- "..QBCore.Shared.Items[l].label..number.."<br>" end
					settext = text
					checktable[l] = HasItem(l, b)
				end
				for _, v in pairs(checktable) do if v == false then disable = true break end end
				if not disable then setheader = setheader.." ✔️" end
				local event = "jim-henhouse:Crafting:MakeItem"
                if Config.MultiCraft then event = "jim-henhouse:Crafting:MultiCraft" end
				Menu[#Menu + 1] = {
					disabled = disable,
					icon = "nui://"..Config.img..QBCore.Shared.Items[tostring(k)].image,
					header = setheader, txt = settext, --qb-menu
					title = setheader, description = settext, -- ox_lib
					event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header }, -- ox_lib
					params = { event = event, args = { item = k, craft = data.craftable[i], craftable = data.craftable, header = data.header } } -- qb-menu
				}
				settext, setheader = nil
			end
		end
	end
	if Config.Menu == "ox" then	exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu })	exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then	exports['qb-menu']:openMenu(Menu) end
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-henhouse:Crafting:MultiCraft', function(data)
    local success = Config.MultiCraftAmounts local Menu = {}
    for k in pairs(success) do success[k] = true
        for l, b in pairs(data.craft[data.item]) do
            local has = HasItem(l, (b * k)) if not has then success[k] = false break else success[k] = true end
		end end
    if Config.Menu == "qb" then Menu[#Menu + 1] = { header = data.header, txt = "", isMenuHeader = true } end
	Menu[#Menu + 1] = { icon = "fas fa-arrow-left", title = Loc[Config.Lan].menu["back"], header = "", txt = Loc[Config.Lan].menu["back"], params = { event = "jim-henhouse:Crafting", args = data }, event = "jim-henhouse:Crafting", args = data }
	for k in pairsByKeys(success) do
		Menu[#Menu + 1] = {
			disabled = not success[k],
			icon = "nui://"..Config.img..QBCore.Shared.Items[data.item].image, header = QBCore.Shared.Items[data.item].label.." [x"..k.."]", title = QBCore.Shared.Items[data.item].label.." [x"..k.."]",
			event = "jim-henhouse:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, amount = k },
			params = { event = "jim-henhouse:Crafting:MakeItem", args = { item = data.item, craft = data.craft, craftable = data.craftable, header = data.header, amount = k } }
		}
	end
	if Config.Menu == "ox" then	exports.ox_lib:registerContext({id = 'Crafting', title = data.header, position = 'top-right', options = Menu })	exports.ox_lib:showContext("Crafting")
	elseif Config.Menu == "qb" then	exports['qb-menu']:openMenu(Menu) end
end)

--[[STASH SHOPS]]--
RegisterNetEvent('jim-henhouse:Stash', function(data)
	if data.job and not jobCheck() then return end
	if Config.Inv == "ox" then exports.ox_inventory:openInventory('stash', "Henhouse_"..data.stash)
	else TriggerEvent("inventory:client:SetCurrentStash", "Henhouse_"..data.stash)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", "Henhouse_"..data.stash) end
	lookEnt(data.coords)
end)

RegisterNetEvent('jim-henhouse:Shop', function(data)
	if not jobCheck() then return end
	local event = "inventory:server:OpenInventory"
	if Config.JimShop then event = "jim-shops:ShopOpen"
	elseif Config.Inv == "ox" then	exports.ox_inventory:openInventory('shop', { type = data.shopname, id = 1 }) end
	TriggerServerEvent(event, "shop", "henhouse", data.shop)
	lookEnt(data.coords)
end)

-- [[CONSUME]] --
local function ConsumeSuccess(itemName, type)
	ExecuteCommand("e c")
	toggleItem(false, itemName, 1)
	if QBCore.Shared.Items[itemName].hunger then
		TriggerServerEvent("QBCore:Server:SetMetaData", "hunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger)
		--TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + QBCore.Shared.Items[itemName].hunger)
	end
	if QBCore.Shared.Items[itemName].thirst then
		TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
		--TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
	end
	if type == "alcohol" then alcoholCount += 1
		if alcoholCount > 1 and alcoholCount < 4 then TriggerEvent("evidence:client:SetStatus", "alcohol", 200)	elseif alcoholCount >= 4 then TriggerEvent("evidence:client:SetStatus", "heavyalcohol", 200) AlienEffect() end
	end
	if Config.RewardItem == itemName then toggleItem(true, Config.RewardPool[math.random(1, #Config.RewardPool)], 1) end
end

RegisterNetEvent('jim-henhouse:client:Consume', function(itemName, type)
	local emoteTable = {
		--Beers
		["ambeer"] = "beer3", ["dusche"] = "beer1", ["logger"] = "beer2", ["pisswasser"] = "beer4", ["pisswasser2"] = "beer5", ["pisswasser3"] = "beer6",
		--Cocktails
		["b52"] = "whiskey", ["brussian"] = "whiskey", ["bkamikaze"] = "whiskey", ["cappucc"] = "whiskey", ["ccookie"] = "whiskey", ["iflag"] = "whiskey", ["kamikaze"] = "whiskey", ["sbullet"] = "whiskey", ["voodoo"] = "whiskey", ["woowoo"] = "whiskey",
		["tillie"] = "browncup",
		--Spirits
		["icream"] = "icream", ["rum"] = "rumb", ["gin"] = "ginb", ["scotch"] = "whiskeyb", ["vodka"] = "vodkab", ["amaretto"] = "vodkab", ["curaco"] = "vodkab",
		--Drinks
		["sprunk"] = "sprunk", ["sprunklight"] = "sprunk",
		["ecola"] = "ecola", ["ecolalight"] = "ecola",
		["cranberry"] = "wine",
		--Food
		["crisps"] = "crisps",
	}
	local progstring, defaultemote = Loc[Config.Lan].progressbar["progress_drink"], "drink"
	if type == "food" then progstring = Loc[Config.Lan].progressbar["progress_eat"] defaultemote = "burger" end
	ExecuteCommand("e "..(emoteTable[itemName] or defaultemote))
	if progressBar({label = progstring..QBCore.Shared.Items[itemName].label.."..", time = math.random(3000, 6000), cancel = true, icon = itemName}) then
		ConsumeSuccess(itemName, type)
	else
		ExecuteCommand("e c")
	end
end)

AddEventHandler('onResourceStop', function(resource) if resource ~= GetCurrentResourceName() then return end
	if GetResourceState("qb-target") == "started" or GetResourceState("ox_target") == "started" then
		for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
		for _, v in pairs(Props) do unloadModel(GetEntityModel(v)) DeleteEntity(v) end
	end
end)