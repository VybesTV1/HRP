if Config.HouseScript ~= "ps-housing" then
    return
end

RegisterNUICallback("Home", function(data, cb)
    local action, houseData = data.action, data.houseData

    if action == "getHomes" then
        lib.TriggerCallback("phone:home:getOwnedHouses", cb)
    elseif action == "removeKeyholder" then
        lib.TriggerCallback("phone:home:removeKeyholder", cb, houseData.uniqueId, data.identifier)
    elseif action == "addKeyholder" then
        lib.TriggerCallback("phone:home:addKeyholder", cb, houseData.uniqueId, data.identifier)
    elseif action == "setWaypoint" then
        cb("ok")

        local coords = (houseData.coords and json.decode(houseData.coords) or {})?.enter
        if not coords then
            cb(false)
            return
        end

        SetNewWaypoint(coords.x, coords.y)
    end
end)