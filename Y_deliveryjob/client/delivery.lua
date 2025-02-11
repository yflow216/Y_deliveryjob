RegisterCommand('lieferwagen', function()
    if isWorking then
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)

        ESX.Game.SpawnVehicle(Config.CompanyVehicle, playerCoords, 0.0, function(vehicle)
            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
            ESX.ShowNotification('Firmenfahrzeug erhalten!')
        end)
    else
        ESX.ShowNotification('Du musst zuerst einen Auftrag annehmen!')
    end
end)
