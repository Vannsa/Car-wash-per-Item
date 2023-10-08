ESX = nil

ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('esx:cleanVehicle')
AddEventHandler('esx:cleanVehicle', function()
    local playerPed = PlayerPedId()
    
    if IsPedInAnyVehicle(playerPed, false) then
        ESX.ShowNotification(Strings.get_out)
        TriggerServerEvent('esx:cleanVehicleFail')
        return
    end

    local car, distance = ESX.Game.GetClosestVehicle()

    if distance <= 3.0 then
        TaskStartScenarioInPlace(playerPed, Config.Animation, 0, true) 
        Citizen.Wait(Config.WashTime)

        WashDecalsFromVehicle(car, 1.0)
        SetVehicleDirtLevel(car, 0.0)
        ClearPedTasks(playerPed)              
        ESX.ShowNotification(Strings.successful)
    else
        ESX.ShowNotification(Strings.no_car_nearby)
        TriggerServerEvent('esx:cleanVehicleFail')
    end
end)
