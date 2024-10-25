function CustomDispatch()
    local playerPed = PlayerPedId()

    local message = "A person is injured at:"

    exports["lb-phone"]:SendCompanyMessage('ambulance', message)
    exports["lb-phone"]:SendCompanyCoords('ambulance')
end