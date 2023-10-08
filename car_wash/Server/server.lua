ESX = nil

ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterUsableItem(Config.ItemName, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('esx:cleanVehicle', source)
    xPlayer.removeInventoryItem(Config.ItemName, 1)
end)

RegisterNetEvent('esx:cleanVehicleFail', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addInventoryItem(Config.ItemName, 1)
end)


