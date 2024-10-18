AddEventHandler('ak47_qb_ambulancejob:onFinishCheckin', function()
    -- your code here
    QBCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.metadata["injail"] > 0 then
            TriggerEvent("prison:client:Enter", PlayerData.metadata["injail"])
        end
    end)

    if Config.SetCrutchAfterCheckin then
        TriggerServerEvent('ak47_qb_crutch:set', GetPlayerServerId(PlayerId()), Config.CrutchTimer) -- 5 minutes
    end
end)