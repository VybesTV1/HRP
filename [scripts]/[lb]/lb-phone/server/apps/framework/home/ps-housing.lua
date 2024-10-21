if Config.HouseScript ~= "ps-housing" then
    return
end

local function getNameFromIdentifier(identifier)
    if Config.Framework == "esx" then
        local name = MySQL.Sync.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", {
            ["@identifier"] = identifier
        })

        if name and name[1]?.firstname and name[1]?.lastname then
            return name[1].firstname .. " " .. name[1].lastname
        end
    elseif Config.Framework == "qb" then
        local charinfo = MySQL.Sync.fetchAll("SELECT charinfo FROM players WHERE citizenid = @identifier", {
            ["@identifier"] = identifier
        })

        if charinfo and charinfo[1]?.charinfo then
            charinfo = json.decode(charinfo[1].charinfo)
            if charinfo.firstname and charinfo.lastname then
                return charinfo.firstname .. " " .. charinfo.lastname
            end
        end
    end

    return identifier
end

local function formatKeyholders(keyholders)
    local formatted = {}

    for i = 1, #keyholders do
        local identifier = keyholders[i]
        formatted[#formatted + 1] = {
            identifier = identifier,
            name = getNameFromIdentifier(identifier)
        }
    end

    return formatted
end

lib.RegisterCallback("phone:home:getOwnedHouses", function(source, cb)
    local identifier = GetIdentifier(source)
    local formattedHouses = {}
    local houses = MySQL.Sync.fetchAll(([[
        SELECT *
        FROM properties
        WHERE owner_citizenid = @identifier
            OR JSON_CONTAINS(has_access, JSON_QUOTE(@identifier))
    ]]), {
        ["@identifier"] = identifier
    })

    for i = 1, #houses do
        local house = houses[i]
        house.has_access = house.has_access and json.decode(house.has_access) or {}
        if type(house.has_access) ~= "table" then
            house.has_access = {}
        end

        local coords
        if house.apartment then
            local success, apartmentCoords = pcall(function()
                return exports["ps-housing"]:getApartmentDoor(house?.apartment)
            end)
            if success then
                coords = vector3(apartmentCoords.x, apartmentCoords.y, apartmentCoords.z)
            end
        elseif house.door_data then
            coords = vector3(house.door_data.x, house.door_data.y, house.door_data.z)
        end


        local label --[[ Choose the wanted format ]]
        -- Gives "2# San Anreas Boulevard, Pillbox Hill"
        label = ("%d# %s, %s"):format(house.property_id, house.apartment or house.street, house.region)
        -- Gives "1# Popular Street"
        label = ("%d# %s"):format(house.property_id, house.apartment or house.street)

        formattedHouses[#formattedHouses + 1] = {
            label = label,
            keyholders = formatKeyholders(house.keyholders),
            id = tonumber(house.property_id),
            uniqueId = house.property_id,

            coords = coords
        }
    end

    cb(formattedHouses)
end)

lib.RegisterCallback("phone:home:getKeyholders", function(source, cb, house)
    local response = MySQL.Sync.fetchScalar("SELECT has_access FROM properties WHERE house = @house AND owner_citizenid = @identifier", {
        ["@house"] = house,
        ["@identifier"] = GetIdentifier(source)
    })

    if not response?[1]?.has_access then
        return cb(false)
    end

    local keyholders = json.decode(response?[1]?.has_access)

    cb(formatKeyholders(keyholders))
end)

lib.RegisterCallback("phone:home:removeKeyholder", function(source, cb, house, identifier)
    if identifier == GetIdentifier(source) or not house then
        return cb(false)
    end

    local response = MySQL.Sync.fetchScalar("SELECT has_access FROM properties WHERE house = @house AND owner_citizenid = @identifier", {
        ["@house"] = house,
        ["@identifier"] = GetIdentifier(source)
    })

    if not response?[1]?.has_access then
        return cb(false)
    end

    local keyholders = json.decode(response?[1]?.has_access)

    local removed = false
    for i = 1, #keyholders do
        if keyholders[i] == identifier then
            table.remove(keyholders, i)
            removed = true
            break
        end
    end

    if not removed then
        return cb(false)
    end

    TriggerEvent("ps-housing:server:removeAccess", house, identifier)

    cb(formatKeyholders(keyholders))
end)

lib.RegisterCallback("phone:home:addKeyholder", function(source, cb, house, addSource)
    if addSource == source or not house then
        return cb(false)
    end

    local addIdentifier = GetIdentifier(addSource)
    if not addIdentifier then
        return cb(false)
    end

    local response = MySQL.Sync.fetchScalar("SELECT has_access FROM properties WHERE house = @house AND owner_citizenid = @identifier", {
        ["@house"] = house,
        ["@identifier"] = GetIdentifier(source)
    })

    if not response?[1]?.has_access then
        return cb(false)
    end

    local keyholders = json.decode(response)

    if contains(keyholders, addIdentifier) then
        return cb(false)
    end

    keyholders[#keyholders + 1] = addIdentifier

    TriggerEvent("ps-housing:server:addAccess", house, addIdentifier)

    cb(formatKeyholders(keyholders))
end)
