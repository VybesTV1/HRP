function showNotification(message)
    SetNotificationTextEntry("STRING")
	AddTextComponentString(message)
	DrawNotification(0,1)
end

RegisterNetEvent("Client:smartLadderNotify")
AddEventHandler("Client:smartLadderNotify", function(message)
    showNotification(message)
end)

function loadModel(model)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end
end

function IsPedControllingLadder()
    return controllingLadder
end

function tableLength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end

exports("IsPedControllingLadder", IsPedControllingLadder)

function IsPedInCage()
    return inCage
end

exports("IsPedInCage", IsPedInCage)