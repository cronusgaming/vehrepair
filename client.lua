-- Easy Vehicle Repair by Michael (https://github.com/MichaelRP1)

RegisterCommand("repair", function()
    local player = GetPlayerPed(-1)
    local veh = GetVehiclePedIsIn(player, false)
    if veh == 0
        notify("~b~Please enter a vehicle to use this command.")
    else if IsVehicleDamaged(veh) == false then
        notify("~b~Your vehicle is not damaged.")
    else if player ~= GetPedInVehicleSeat(veh, -1) then
        notify("~b~You are not the driver. You can't repair this vehicle.")
    else
        SetVehicleEngineHealth(veh, 1000)
        SetVehicleFixed(veh)
        SetVehicleDirtLevel(veh, 0)
        notify("~g~Your vehicle has been repaired!")
end)

function notify(msg)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(msg)
	DrawNotification(false, false)
end