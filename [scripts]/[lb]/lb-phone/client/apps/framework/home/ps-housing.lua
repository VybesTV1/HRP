if Config.HouseScript ~= "ps-housing" then
    return
end

local lib = exports.loaf_lib:GetLib()
local QB = exports["qb-core"]:GetCoreObject()


local function formatKeyHolders(keyholders)
    local formatted = {}
    for i = 1, #keyholders do
        formatted[i] = {
            identifier = keyholders[i].citizenid,
            name = keyholders[i].name
        }
    end

    return formatted
end

local function formatHouses(houses)
    local formatted = {}
    for i = 1, #houses do
        local houseData = houses[i]

        --Check if it's a house or apartment, and define by that
        local street = ""
        if not houseData.apartment then
            street = houseData.street
        else
            street = houseData.apartment
        end

        formatted[i] = {
            label = street.."-"..houseData.property_id,
            locked = houseData.door_data.locked or true,
            keyholders = formatKeyHolders(json.decode(houseData.has_access)) or {},
            door = json.decode(houseData.door_data),
            id = houseData.property_id,
        }
    end

    return formatted
end


RegisterNUICallback("Home", function(data, cb)
    local action, houseData = data.action, data.houseData

    if action == "getHomes" then
        lib.TriggerCallback("phone:home:getOwnedHouses", function(houses)
            if not houses then
                return cb({})
            end
            local formattedHouses = formatHouses(houses)
            cb(formatHouses(houses))
        end)
    elseif action == "removeKeyholder" then
        local cidRemoving = data.identifier
        TriggerServerEvent("ps-housing:server:removeAccess", data.houseData.id, cidRemoving)

        Wait(1000)
        lib.TriggerCallback("phone:home:getOwnedHouses", function(houses)
            if not houses then
                return cb({})
            end

            --Re-find the house we've been editing
            for i=1,#houses do
                if houses[i].property_id == data.houseData.id then
                    cb(formatKeyHolders(json.decode(houses[i].has_access)))
                    break
                end
            end
        end)
    elseif action == "addKeyholder" then
        TriggerServerEvent("ps-housing:server:addAccess", data.houseData.id, data.source)
        Wait(1000)
        lib.TriggerCallback("phone:home:getOwnedHouses", function(houses)
            if not houses then
                return cb({})
            end

            --Re-find the house we've been editing
            for i=1, #houses do
                if houses[i].property_id == data.houseData.id then
                    cb(formatKeyHolders(json.decode(houses[i].has_access)))
                    break
                end
            end
        end)
    elseif action == "toggleLocked" then
        -- Housing doesn't have a lock feature from what I can see. I'll put a request for this. 
        cb(true)
    elseif action == "setWaypoint" then
        if data.houseData.door.x and data.houseData.door.y then
            SetNewWaypoint(data.houseData.door.x, data.houseData.door.y)
            cb("ok")
        end
    end
end)