Config = {}

Config.InterfaceColor = "#ff66ff" -- change interface color, color must be in hex

Config.Language = "English" -- text language from code (English)

Config.Target = false -- enable this if you want use target

Config.Targettype = "qtarget" -- types - qtarget, qbtarget, oxtarget

Config.TargetSystemsNames = {qtarget = "qtarget", qbtarget = "qb-target", oxtarget = "ox_target"}

Config.TargetIcons = {billiardplayicon = "fa-solid fa-play", billiardspawnicon = "fa-solid fa-circle", billiardreseticon = "fa-solid fa-trash", cueicon = "fa-solid fa-circle"} 

Config.BilliardInteractionSystem = 1 -- 1 == Our custom interact system, 2 == 3D Text Interact, 3 == Gta V Online Interaction Style

Config.BilliardWhiteBallChangeSpeedKey = "LSHIFT" -- billiard change speed position key

Config.BilliardWhiteBallChangeKey = "RETURN" -- billiard change position key

Config.BilliardWhiteBallChangeStartKey = "E" -- billiard change position start key

Config.BilliardShootKey = "RETURN" -- billiard shoot key

Config.BilliardShootExitKey = "F" -- billiard shoot exit key

Config.BilliardShootReactionKey = "F" -- billiard shoot reaction key

Config.BilliardInteractionKey = "E" -- billiard interaction key

Config.BilliardPoolGiveKey = "G" -- billiard give pool key

Config.BilliardResetKey = "F" -- billiard reset pool key

Config.BilliardControlDistance = 1.5 -- distance of control billiard 

Config.BilliardDistancePoolGive = 2.0 -- distance of give pool billiard 

Config.BilliardLineColor = {r = 255, g = 102, b = 255} -- line color

Config.BilliardSunkNotify = true -- enable this feature if you want to be notified when a ball falls into a hole.

Config.BilliardSunkNotifyDistance = 5.0 -- maximum distance from the table to receive notifications

Config.BilliardSunkNotifyOnlyForPlayersWithCue = false -- turn this feature on if you only want to notify people who have a cue in their hand.

Config.BilliardCueGiveViaCommand = true -- enable this feature if you want to allow players to get a cue via the command

Config.BilliardCueGiveViaCommandName = "givepool" -- command for give cue

Config.ShootForce = {
	[1] = 20.0, -- minimum shoot force
	[2] = 40.0, -- medium shoot force
	[3] = 60.0, -- max shoot force
}

Config.PoolTables = {
    {
        poolcoords = vector3(-1575.67, -1017.76, 12.01), -- coords of pool
		poolrotation = vector3(0.0, 0.0, 0.0), -- rotation of pool
		pooltype = 1, -- types 1-6
		pooldecals = true, -- pool decals
		poolstand = false, -- pool stand
		poolstandtype = 1, -- types 1-2
        poolstandcoords = vector3(-1826.69, -754.6, 8.2), -- coords of stand
		poolstandrotation = vector3(0.0, 0.0, 50.0), -- rotation of stand		 
	},
    {
        poolcoords = vector3(-1580.45, -1018.32, 12.01), -- coords of pool
		poolrotation = vector3(0.0, 0.0, 0.0), -- rotation of pool
		pooltype = 4, -- types 1-6
		pooldecals = true, -- pool decals
		poolstand = false, -- pool stand
		poolstandtype = 1, -- types 1-2
        poolstandcoords = vector3(-1826.69, -754.6, 8.2), -- coords of stand
		poolstandrotation = vector3(0.0, 0.0, 50.0), -- rotation of stand		 
	},
}

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords()) 
	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 255)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 240
		DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 255, 102, 255, 150)
	end
end

function Notify(text)
	exports["rtx_notify"]:Notify("Billiard", text, 5000, "info") -- if you get error in this line its because you dont use our notify system buy it here https://rtx.tebex.io/package/5402098 or you can use some other notify system just replace this notify line with your notify system
	--exports["mythic_notify"]:SendAlert("inform", text, 5000)
end