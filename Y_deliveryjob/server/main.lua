ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('esx_deliveryjob:getJob', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    cb(xPlayer.job.name == Config.JobName)
end)
