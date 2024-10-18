QBCore = exports['qb-core']:GetCoreObject()
PlayerData = {}
ScreenshotWebhook = nil

Citizen.CreateThread(function()
    while QBCore.Functions == nil do
        Citizen.Wait(1000)
    end
    while QBCore.Functions.GetPlayerData() == nil do
        Citizen.Wait(1000)
    end
    while QBCore.Functions.GetPlayerData().job == nil do
        Citizen.Wait(1000)
    end
    Citizen.CreateThread(function()
    	exports['spawnmanager']:setAutoSpawn(false)
    end)
    PlayerData = QBCore.Functions.GetPlayerData()
    playerPed = PlayerPedId()
    QBCore.Functions.TriggerCallback('ak47_qb_ambulancejob:getwebhook', function(hook)
    	ScreenshotWebhook = hook
    end)
    RequestAnimSet("move_m@injured")
    SetPedMaxHealth(playerPed, Config.MaxHealth)
end)

Citizen.CreateThread(function()
	while true do
		Wait(1000)
		playerPed = PlayerPedId()
		SetPedMaxHealth(playerPed, Config.MaxHealth)
	end
end)

RegisterNetEvent('ak47_qb_ambulancejob:heal', function()
	playerPed = PlayerPedId()
	SetPedMaxHealth(playerPed, Config.MaxHealth)
	SetEntityHealth(playerPed, Config.MaxHealth)
	SetStatus('hunger', 100)
	SetStatus('thirst', 100)
	SetStatus('stress', 100)
end)

Citizen.CreateThread(function()
	DoScreenFadeIn(800)
	for k, v in pairs(Config.Blips) do
		local blip = AddBlipForCoord(v.pos)
		SetBlipSprite(blip, v.sprite)
		SetBlipScale(blip, v.size)
		SetBlipColour(blip, v.color)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName(v.label)
		EndTextCommandSetBlipName(blip)
	end
end)

RegisterNetEvent("QBCore:Client:SetDuty", function(newDuty)
    PlayerData.job.onduty = newDuty
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerData.job = JobInfo
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
	StopEffect()
	Wait(100)
	PlayerData = QBCore.Functions.GetPlayerData()
	playerPed = PlayerPedId()
    LocalPlayer.state:set('dead', false, true)
	LocalPlayer.state:set('down', false, true)
	CheckDeadStatus()
	StartDamageEffect()
	SetPedMaxHealth(playerPed, Config.MaxHealth)
end)

function SetStatus(type, value)
	if type == 'hunger' then
		TriggerServerEvent("consumables:server:addHunger", value)
	elseif type == 'thirst' then
		TriggerServerEvent("consumables:server:addThirst", value)
	else
		TriggerServerEvent('hud:server:RelieveStress', value)
	end
end

function AddStatus(type, value)
	if type == 'hunger' then
		TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + value)
	elseif type == 'thirst' then
		TriggerServerEvent("consumables:server:addThirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + value)
	else
		TriggerServerEvent('hud:server:RelieveStress', value)
	end
end

RegisterNetEvent('ak47_qb_ambulancejob:notify', function(msg, type)
	--[[
	type:
		success
		warning
		error
		info
	]]
	if type == 'success' then
		QBCore.Functions.Notify(msg, 'success')
	elseif type == 'warning' then
		QBCore.Functions.Notify(msg, 'error')
	elseif type == 'error' then
		QBCore.Functions.Notify(msg, 'error')
	else
		QBCore.Functions.Notify(msg)
	end
end)

function GetStreet()
    local position = GetEntityCoords(playerPed)
    local var1, var2 = GetStreetNameAtCoord(position.x, position.y, position.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
    local zone = GetNameOfZone(position.x, position.y, position.z)
    local zoneLabel = GetLabelText(zone)
    hash1 = GetStreetNameFromHashKey(var1)
    return hash1, zoneLabel
end

function getEntityControl(entity)
	NetworkRequestControlOfEntity(entity)
	while not NetworkHasControlOfEntity(entity) do
		NetworkRequestControlOfEntity(entity)
		Wait(0) 
	end
end

function loadModel(hash)
	if not HasModelLoaded(hash) then
		RequestModel(hash)
		while not HasModelLoaded(hash) do Wait(0) end
	end
end

function loadAnim(dir)
	if not HasAnimDictLoaded(dir) then
		RequestAnimDict(dir)
		while not HasAnimDictLoaded(dir) do Wait(0) end
	end
end

function lerpColorBasedOnDamage(damage)
    damage = math.max(0, math.min(80, damage))
    local t = damage / 80
    local red = 255 * t
    local green = 255 * (1 - t)
    local blue = 0
    return {math.floor(red), math.floor(green), math.floor(blue)}
end

Round = function(value)
	return math.floor((value * 1000) + 0.5) / 1000
end

DisableDownControls = function()
	DisableAllControlActions(0)
	EnableControlAction(0, 47, true) 	--G
	EnableControlAction(0, 245, true) 	--T
	EnableControlAction(0, 249, true) 	--N
	EnableControlAction(0, 288, true) 	--F1
	EnableControlAction(0, 38, true) 	--E
	EnableControlAction(0, 1, true) 	--MOUSE RIGHT
	EnableControlAction(0, 2, true) 	--MOUSE DOWN
	EnableControlAction(0, 201, true) 	--ENTER
	EnableControlAction(0, 202, true) 	--BACKSPACE
	EnableControlAction(0, 27, true) 	--ARROW UP
	EnableControlAction(0, 173, true) 	--ARROW DOWN
	EnableControlAction(0, 174, true) 	--ARROW LEFT
	EnableControlAction(0, 175, true) 	--ARROW RIGHT
end

DisableDeadControls = function()
	DisableAllControlActions(0)
	EnableControlAction(0, 47, true) 	--G
	EnableControlAction(0, 245, true) 	--T
	EnableControlAction(0, 249, true) 	--N
	EnableControlAction(0, 288, true) 	--F1
	EnableControlAction(0, 38, true) 	--E
	EnableControlAction(0, 1, true) 	--MOUSE RIGHT
	EnableControlAction(0, 2, true) 	--MOUSE DOWN
	EnableControlAction(0, 201, true) 	--ENTER
	EnableControlAction(0, 202, true) 	--BACKSPACE
	EnableControlAction(0, 27, true) 	--ARROW UP
	EnableControlAction(0, 173, true) 	--ARROW DOWN
	EnableControlAction(0, 174, true) 	--ARROW LEFT
	EnableControlAction(0, 175, true) 	--ARROW RIGHT
end

PlayingIgnoreAnim = function()
	for i, v in ipairs(Config.IgnoreAnims) do
		if IsEntityPlayingAnim(playerPed, v.dir, v.anim, 3) then
			return true
		end
	end
	return false
end

function DrawText2Ds(x, y, text, scale, font, color)
    SetTextFont(font or 4)
    SetTextProportional(7)
    SetTextScale(scale, scale)
    if color then
    	SetTextColour(color[1], color[2], color[3], 255)
    else

    end
    SetTextDropShadow(0.0, 0.0, 0.0, 0.0, 255)
    SetTextDropShadow()
    SetTextEdge(4, 0, 0, 0, 255)
    SetTextOutline()
    SetTextCentre(true)
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x, y)
end

function SecToClock(seconds)
	local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0
	if seconds <= 0 then
		return 0, 0
	else
		local hours = string.format('%02.f', math.floor(seconds / 3600))
		local mins = string.format('%02.f', math.floor(seconds / 60 - (hours * 60)))
		local secs = string.format('%02.f', math.floor(seconds - hours * 3600 - mins * 60))
		return mins, secs
	end
end