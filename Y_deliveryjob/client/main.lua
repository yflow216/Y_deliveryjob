local ESX = exports["es_extended"]:getSharedObject()
local isWorking = false
local currentDelivery = nil

RegisterCommand('lieferjob', function()
    if isWorking then
        ESX.ShowNotification('Du hast bereits einen aktiven Auftrag!')
        return
    end

    StartDeliveryJob()
end)

function StartDeliveryJob()
    isWorking = true
    currentDelivery = Config.DeliveryLocations[math.random(1, #Config.DeliveryLocations)]

    ESX.ShowNotification('Du hast eine Lieferung erhalten! Fahre zum markierten Punkt.')
    SetNewWaypoint(currentDelivery.x, currentDelivery.y)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if isWorking and currentDelivery then
            local playerCoords = GetEntityCoords(PlayerPedId())

            if #(playerCoords - vector3(currentDelivery.x, currentDelivery.y, currentDelivery.z)) < 5.0 then
                ESX.ShowNotification('Lieferung abgeschlossen!')
                TriggerServerEvent('esx_deliveryjob:completeDelivery', GetDistanceBetweenCoords(playerCoords, currentDelivery.x, currentDelivery.y, currentDelivery.z, true))
                isWorking = false
                currentDelivery = nil
            end
        end
    end
end)
