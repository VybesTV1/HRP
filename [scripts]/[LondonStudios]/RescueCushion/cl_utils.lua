TriggerEvent('chat:addSuggestion', '/'..main.commandName, translations.commandSuggestion, {
    { name=translations.setup.."/"..translations.remove, help=translations.commandHelp },
})

local first_spawn = false

function showNotification(message)
    message = message.."."
    SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end

AddEventHandler('playerSpawned', function()
    if not first_spawn then
        TriggerServerEvent('Server:receiveCushionsTable')
        first_spawn = true
    end
end)

cushions = {}

RegisterNetEvent('Client:receiveCushionsTable')
AddEventHandler('Client:receiveCushionsTable', function(table)
    cushions = table
end)

RegisterNetEvent('Client:updateCushionsTable')
AddEventHandler('Client:updateCushionsTable', function(key, entry, remove)
    if remove then 
        cushions[key] = nil
        return 
    end
    cushions[key] = entry
end)

function tableLength(t)
    local count = 0
    for _ in pairs(t) do count = count + 1 end
    return count
end

heightSet = false
mainTimeout = false

Citizen.CreateThread(function()
    while true do
        if tableLength(cushions) > 0 then
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            for k, v in pairs(cushions) do
                local dist = #(coords.xy - v[2].xy)
                if dist < 3.0 then
                    if IsPedFalling(ped) then
                        SetEntityInvincible(ped, true)
                        while IsPedFalling(ped) do
                            SetEntityInvincible(ped, true)
                            Wait(0)
                        end
                        SetPedToRagdoll(ped, main.ragdollDuration * 1000, main.ragdollDuration * 1000, 0, 0, 0, 0)
                        Wait(500)
                        SetEntityInvincible(ped, false)
                    end
                end
            end
        end
        Wait(0)
    end
end)