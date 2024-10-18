local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('sw-fishing:shared:startEmote', function(emote)
	if Config.Animations == 'rpemotes' then
		TriggerEvent('animations:client:EmoteCommandStart', {emote})
	end
end)

RegisterNetEvent('sw-fishing:shared:cancelEmote', function()
	if Config.Animations == 'rpemotes' then
		exports['rpemotes']:EmoteCancel()
	end
end)

RegisterNetEvent('sw-fishing:shared:startSkillbar', function(data)
	if Config.Skillbar == 'ps' then
		exports['ps-ui']:Circle(function(success)
			if success then
				TriggerEvent('sw-fishing:client:finishSkillbar', data, 1)
			else
				TriggerEvent('sw-fishing:client:finishSkillbar', data)
			end
		end, 4, 10) -- NumberOfCircles, MS
	elseif Config.Skillbar == 'qb' then
		local success = exports['qb-minigames']:Skillbar()
		if success then
			TriggerEvent('sw-fishing:client:finishSkillbar', data, 1)
		else
			TriggerEvent('sw-fishing:client:finishSkillbar', data)
		end
	elseif Config.Skillbar == 'ox' then
		local success = lib.skillCheck({'easy', 'easy', 'easy'}, {'w', 'a', 's', 'd'})
		if success then
			TriggerEvent('sw-fishing:client:finishSkillbar', data, 1)
		else
			TriggerEvent('sw-fishing:client:finishSkillbar', data)
		end
	end
end)

RegisterNetEvent('sw-fishing:shared:startDispatch', function(data)
	if Config.Dispatch.name == 'ps-dispatch' then
		exports['ps-dispatch']:Poaching()
	end
end)