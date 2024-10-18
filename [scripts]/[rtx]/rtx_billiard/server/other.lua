if Config.BilliardSunkNotify then
	RegisterServerEvent("rtx_billiard:BallNotify")
	AddEventHandler("rtx_billiard:BallNotify", function(tableiddata, ballmodel)
		if tableiddata ~= nil then
			if billiardtables[tableiddata] ~= nil then
				local playersource = source
				local billiardhandler = billiardtables[tableiddata]
				if billiardhandler.inprogress == true and billiardhandler.inprogressplayerid == playersource then
					local playername = GetPlayerName(playersource)
					TriggerClientEvent("rtx_billiard:BallNotifyClient", -1, tableiddata, playername, ballmodel)
				end
			end
		end
	end)
end