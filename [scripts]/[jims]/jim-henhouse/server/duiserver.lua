if Config.MLO == "SM" then
	local QBCore = exports[Config.Core]:GetCoreObject()

	local Size = {
		["big"] = { 1024, 1024 },
		["medium"] = { 512, 512 },
	}
	--This is the list that loads at server start
	--it's updated in server memory as people change them
	--When ClearDui is run, it sets the url to "" making it load nothing

	-- Default images
	-- Targets for these are in dui.lua
	local duiList = {
		["bar_nabidka"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/1/1d/TornadoRatRodWeek-GTAO-Advertisement.jpg", size = Size["big"], texd = "smokey_henhouse_blbiny" },
		["schodiste_nabidka"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/4/4b/Vapid-GTAO-NeonSign.jpg", size = Size["big"], texd = "smokey_henhouse_blbiny" },
		["truny"] = { url = "https://i.imgur.com/psLePzt.jpg", size = Size["big"], texd = "smokey_henhouse_blbiny" },
		["3_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/f/f9/Stallion-GTAV-Screenshot.jpg", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["2_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/8/8a/BurgerStallion-GTAO-RGSC3.jpg", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["4_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/6/68/Fr%C3%A4nkenStange-GTAO-Other.png", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["5_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/b/b3/Massacro%28Racecar%29-GTAV-Dashboard.png", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["6_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/c/c1/Scramjet-GTAO-Detail.png", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["7_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/9/98/TornadoRatRod-GTAO-Engine.png", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["8_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/2/2d/Shotaro-GTAO-Advert2020.jpg", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["9_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/1/16/Sanctus-GTAO-LuckyWheelReward.png", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["10_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/8/89/Ardent-GTAOe-PrizeRide.jpg", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["11_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/e/e6/PegassiToros-GTAO-Advertisement.jpg", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["12_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/4/44/Scramjet-GTAO-SocialClub3.jpg", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["13_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/8/86/Vinewood-GTAV.jpg", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["15_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/8/83/WestLSnextgen.png", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
		["17_(1)"] = { url = "https://static.wikia.nocookie.net/gtawiki/images/1/1a/PacificBluffs-GTAV-Plane.jpg", size = Size["medium"], texd = "smokey_henhouse_blbiny" },
	}

	AddEventHandler('onResourceStart', function(r) if r ~= GetCurrentResourceName() then return end
		-- Tidier way of duplicating the original url at startup to make "presets"
		for k in pairs(duiList) do duiList[k].preset = duiList[k].url end
	end)

	RegisterServerEvent("jim-henhouse:Server:ChangeDUI", function(data)
		-- if no url given, "reset" it back to preset
		if not data.url then
			if Config.Debug then print("^5Debug^7: ^2Preset^7: ^6"..tostring(duiList[tostring(data.tex)].preset).."^7") end
			data.url = duiList[tostring(data.tex)].preset
			data.size = duiList[tostring(data.tex)].size
		end
		-- if it has a url, update server DUI list and send to players
		duiList[tostring(data.tex)] = { url = data.url, preset = duiList[tostring(data.tex)].preset, size = data.size, texd = data.texd }
		if Config.Debug then print("^5Debug^7: ^3DUI^2 Sending new DUI to all players^7 - ^6"..data.url.."^7") end
		TriggerClientEvent("jim-henhouse:ChangeDUI", -1, data)
	end)
	RegisterServerEvent("jim-henhouse:Server:ClearDUI", function(data)
		if data.url == "-" then duiList[data.tex].url = "-" end
		-- Clear the DUI from loading
		TriggerClientEvent("jim-henhouse:ClearDUI", -1, data)
		--duiList[tostring(data.tex)].url = ""
	end)

	QBCore.Functions.CreateCallback('jim-henhouse:Server:duiList', function(source, cb) cb(duiList) end)
end