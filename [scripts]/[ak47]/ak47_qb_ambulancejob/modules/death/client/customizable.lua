AddEventHandler('ak47_qb_ambulancejob:onPlayerRevive', function()
    -- your code here
    if GetResourceState('qs-inventory') == 'started' then
        exports['qs-inventory']:setInventoryDisabled(false)
    end
    SetStatus('hunger', 100)
    SetStatus('thirst', 100)
    SetStatus('stress', 100)
end)

AddEventHandler('ak47_qb_ambulancejob:onPlayerDown', function()
    -- your code here
    if GetResourceState('qs-inventory') == 'started' then
        exports['qs-inventory']:setInventoryDisabled(true)
    end
end)

AddEventHandler('ak47_qb_ambulancejob:onPlayerDeath', function()
    -- your code here
    if GetResourceState('qs-inventory') == 'started' then
        exports['qs-inventory']:setInventoryDisabled(true)
    end
end)

AddEventHandler('ak47_qb_ambulancejob:onForceRespawn', function()
    -- your code here

end)

function CanPlayerDie(attacker, weapon)
    if GetResourceState('ls-arcade') == 'started' then
        if not exports['ls-arcade']:isPlayerInArena() then
            return true
        end
        local killerId = NetworkGetPlayerIndexFromPed(attacker)
        TriggerServerEvent('ls-arcade:server:playerKilled', GetPlayerServerId(killerId))
        return false
    else
        return true
    end
end

RegisterNetEvent('ls-arcade:client:revivePlayer', function(coords)
    local ped = PlayerPedId()
    NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, GetEntityHeading(ped), true, false)
    SetEntityInvincible(ped, true)
    SetEntityAlpha(ped, 140)
    TriggerEvent('ls-arcade:client:clearBleeding')
    CreateThread(function()
        Wait(1000)
        while true do
            local vel = GetEntityVelocity(ped)
            if vel.x ~= 0 then
                SetEntityInvincible(ped, false)
                SetEntityAlpha(ped, 255)
                return
            end
            DisablePlayerFiring(PlayerId(), true) -- Disable weapon firing
            Wait(0)
        end
    end)
end)

RegisterNetEvent('ls-arcade:client:clearBleeding', function()
    resetDamages()
end)