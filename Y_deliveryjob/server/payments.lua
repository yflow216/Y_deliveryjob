RegisterServerEvent('esx_deliveryjob:completeDelivery')
AddEventHandler('esx_deliveryjob:completeDelivery', function(distance)
    local xPlayer = ESX.GetPlayerFromId(source)
    local payment = Config.BasePay + (distance * Config.BonusPerKM)

    xPlayer.addMoney(payment)
    xPlayer.showNotification('Du hast $' .. payment .. ' für die Lieferung erhalten!')
end)
