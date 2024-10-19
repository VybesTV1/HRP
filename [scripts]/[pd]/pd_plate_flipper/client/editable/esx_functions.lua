if Config.ESX.enabled then
    Citizen.CreateThread(function()
        while ESX == nil do
            if Config.ESX.useNewESXExport then
                ESX = exports['es_extended']:getSharedObject()
            else
                TriggerEvent('esx:getSharedObject', function(obj)
                    ESX = obj
                end)
            end
            Citizen.Wait(0)
        end
    end)


    function HasJob(jobName)
        return (ESX.GetPlayerData().job.name == jobName)
    end


    function HasItem(itemName)
        local inventory = ESX.GetPlayerData().inventory
        for _, item in ipairs(inventory) do
            if item ~= nil and item.name == itemName then
                if item.count > 0 then
                    return true
                end
            end
        end
        return false
    end

end