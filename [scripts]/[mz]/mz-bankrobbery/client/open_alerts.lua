QBCore = exports[Config.CoreEx]:GetCoreObject()

isLoggedIn = LocalPlayer.state['isLoggedIn']

---------------
--PS-DISPATCH--
---------------

function getStreetandZone(coords)
    local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    local currentStreetHash = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    currentStreetName = GetStreetNameFromHashKey(currentStreetHash)
    playerStreetsLocation = currentStreetName .. ", " .. zone
    return playerStreetsLocation
end

function GetPedGender()
    local gender = "Male"
    if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then gender = "Female" end
    return gender
end

RegisterNetEvent('mz-bankrobbery:client:mz-fleecaAlert', function()
    if not Config.NewVersion then 
        local currentPos = GetEntityCoords(PlayerPedId())
        local locationInfo = getStreetandZone(currentPos)
        local gender = GetPedGender()
        TriggerServerEvent("dispatch:server:notify",{
            dispatchcodename = "bankrobbery",                           -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
            dispatchCode = "10-90",
            firstStreet = locationInfo,
            gender = gender,
            camId = camId,
            model = nil,
            plate = nil,
            priority = 1,                                               -- priority
            firstColor = nil,
            automaticGunfire = false,
            origin = {
                x = currentPos.x,
                y = currentPos.y,
                z = currentPos.z
            },
            dispatchMessage = "Fleeca Bank Robbery In Progress",        -- message
            job = {"police"}                                            -- jobs that will get the alerts
        })
    else 
        exports['ps-dispatch']:FleecaBankRobbery(camId)
    end 
end)

RegisterNetEvent('mz-bankrobbery:client:mz-paletoAlert', function()
    if not Config.NewVersion then 
        local currentPos = GetEntityCoords(PlayerPedId())
        local locationInfo = getStreetandZone(currentPos)
        local gender = GetPedGender()
        TriggerServerEvent("dispatch:server:notify",{
            dispatchcodename = "paletobankrobbery",                    -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
            dispatchCode = "10-90",
            firstStreet = locationInfo,
            gender = gender,
            camId = camId,
            model = nil,
            plate = nil,
            priority = 1,                                               -- priority
            firstColor = nil,
            automaticGunfire = false,
            origin = {
                x = currentPos.x,
                y = currentPos.y,
                z = currentPos.z
            },
            dispatchMessage = "Paleto Bank Robbery In Progress",        -- message
            job = {"police"}                                            -- jobs that will get the alerts
        })
    else 
        exports['ps-dispatch']:PaletoBankRobbery(camId)
    end 
end)

RegisterNetEvent('mz-bankrobbery:client:mz-pacificAlert', function()
    if not Config.NewVersion then
        local currentPos = GetEntityCoords(PlayerPedId())
        local locationInfo = getStreetandZone(currentPos)
        local gender = GetPedGender()
        TriggerServerEvent("dispatch:server:notify",{
            dispatchcodename = "pacificbankrobbery",                    -- has to match the codes in sv_dispatchcodes.lua so that it generates the right blip
            dispatchCode = "10-90",
            firstStreet = locationInfo,
            gender = gender,
            camId = camId,
            model = nil,
            plate = nil,
            priority = 1,                                       -- priority
            firstColor = nil,
            automaticGunfire = false,
            origin = {
                x = currentPos.x,
                y = currentPos.y,
                z = currentPos.z
            },
            dispatchMessage = "Pacific Bank Robbery In Progress",        -- message
            job = {"police"}                                    -- jobs that will get the alerts
        })
    else 
        exports['ps-dispatch']:PacificBankRobbery(camId)
    end 
end)

RegisterNetEvent('mz-bankrobbery:client:robberyCall', function(type, coords)
    if not isLoggedIn then return end
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    if PlayerJob.name ~= "police" or not PlayerJob.onduty then return end
    if type == "small" then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Config.OnPoliceAlert(Lang:t("general.fleeca_robbery_alert"))
    elseif type == "paleto" then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        Config.OnPoliceAlert(Lang:t("general.paleto_robbery_alert"))
    elseif type == "pacific" then
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        Wait(100)
        PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
        Wait(100)
        PlaySoundFrontend( -1, "Beep_Red", "DLC_HEIST_HACKING_SNAKE_SOUNDS", 1 )
        Config.OnPoliceAlert(Lang:t("general.pacific_robbery_alert"))
    end
    local transG = 250
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, 487)
    SetBlipColour(blip, 4)
    SetBlipDisplay(blip, 4)
    SetBlipAlpha(blip, transG)
    SetBlipScale(blip, 1.2)
    SetBlipFlashes(blip, true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(Lang:t("general.bank_robbery_police_call"))
    EndTextCommandSetBlipName(blip)
    while transG ~= 0 do
        Wait(180 * 4)
        transG = transG - 1
        SetBlipAlpha(blip, transG)
        if transG == 0 then
            SetBlipSprite(blip, 2)
            RemoveBlip(blip)
            return
        end
    end
end)
