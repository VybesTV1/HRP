Config = {}

Config.CommandPermission = 'god' -- permission level for creating new doors
Config.AdminAccess = true -- Enable admins to unlock any door
Config.AdminPermission = 'god' -- The permission needed to get AdminAccess if it is enabled
Config.Warnings = false -- if true it will show warnings in the console when certain requirements aren't met
Config.FallbackDistance = 3.0 -- Distance to fall back on when it is not set
Config.EnableSounds = true -- Enable sounds when unlocking/locking doors (doors triggered by scripts can have the sound manually disabled)
Config.EnableAnimation = true -- Enable the animation when unlocking/locking doors (doors triggered by scripts can have the animation manually disabled)
Config.SaveDoorDialog = true -- Saves the door dialogue popup between door saves
Config.PersistentDoorStates = false -- Persists the door state between server restarts
Config.PersistentSaveInternal = 60000 -- How often door states are saved to the file system, in miliseconds. 

Config.ChangeColor = true -- Change the color of the box of the popup text based on if it is locked or not
Config.DefaultColor = 'rgb(19, 28, 74)' -- The default color of the box of the popup text if Config.ChangeColor is false
Config.LockedColor = 'rgb(219 58 58)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is locked
Config.UnlockedColor = 'rgb(27 195 63)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is unlocked
Config.UseDoorLabelText = false -- Will use the LABEL field as the nui text instead of locked/unlocked
Config.DoorDebug = false -- Enable DRAWTEXT in the world at the coords where the door 'center' is
Config.RemoteTriggerDistance = 15.0 -- This is how far from your camera the raycast will go to try to hit something solid
Config.RemoteTriggerMinDistance = 5.0 -- This is the minimum distance required for the raycast hit to count near a door. It will take the larger two between this and 'distance' option

Config.Consumables = { ['ticket'] = 1, ['paperclip'] = 1 } -- The items will get removed once used on a door that has the item on it

Config.DoorStates = {}
Config.DoorList = {
	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vec3(261.83, 221.39, 106.41),
		textCoords = vec3(261.83, 221.39, 106.41),
		authorizedJobs = { 'police' },
		objYaw = -110.0,
		locked = true,
		pickable = false,
		distance = 1.5,
	},
	-- Second Pacific Door opened with lockpick
	{
		objName = 'v_ilev_bk_door',
		objCoords  = vec3(265.19, 217.84, 110.28),
		textCoords = vec3(265.19, 217.84, 110.28),
		authorizedJobs = { 'police' },
		objYaw = -20.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
}