if Config.Seatbelt then
    local seatbeltOn = false

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(10)
            if IsPedInAnyVehicle(PlayerPedId()) then
                if seatbeltOn then
                    DisableControlAction(0, 75, true) -- Disable exit vehicle when stop
                    DisableControlAction(27, 75, true) -- Disable exit vehicle when Driving
                end
            else
                if seatbeltOn then
                    toggleSeatbelt(false, false)
                end
            end
        end
    end)
    
    RegisterKeyMapping('seatbelt', 'Toggle Seatbelt', 'keyboard', Config.DefaultSeatbeltControlKey)
    local seatbeltSpam = 0
    
    RegisterCommand('seatbelt', function(source, args, rawCommand)
        if seatbeltSpam >= 3 then
            if Config.EnableSpamNotification  then
                Config.Notification(Config.Notifications["spam"]["message"], Config.Notifications["spam"]["type"], Config.Notifications["spam"]["time"])
            end
            return
        end
        local ped = PlayerPedId()
        if IsPedInAnyVehicle(ped, false) then
            local class = GetVehicleClass(GetVehiclePedIsIn(ped))
            if class ~= 8 and class ~= 13 and class ~= 14 then
                toggleSeatbelt(true)
                if seatbeltOn then
                    Config.Notification(Config.Notifications["took_seatbelt"]["message"], Config.Notifications["took_seatbelt"]["type"], Config.Notifications["took_seatbelt"]["time"])
                else
                    Config.Notification(Config.Notifications["took_off_seatbelt"]["message"], Config.Notifications["took_off_seatbelt"]["type"], Config.Notifications["took_off_seatbelt"]["time"])
                end
                seatbeltSpam = seatbeltSpam + 1
            end
        end
    end, false)
    
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            if seatbeltSpam > 0 then
                Citizen.Wait(3500)
                seatbeltSpam = 0
            end
        end
    end)
    
    function toggleSeatbelt(makeSound, toggle)
    
        if toggle == nil then
            if seatbeltOn then
                playSound("unbuckle")
                SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage)
                SendNUIMessage({
                    type="update_seatbelt",
                    toggle = false
    
                })
            else
                playSound("buckle")
                SendNUIMessage({
                    type="update_seatbelt",
                    toggle = true
                })
                SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
            end
            seatbeltOn = not seatbeltOn
        else
            if toggle then
    
                SetFlyThroughWindscreenParams(10000.0, 10000.0, 17.0, 500.0);
                SendNUIMessage({
                    type="update_seatbelt",
                    toggle = true
    
                })
                playSound("buckle")
    
            else
    
                SetFlyThroughWindscreenParams(Config.ejectVelocity, Config.unknownEjectVelocity, Config.unknownModifier, Config.minDamage)
                SendNUIMessage({
                    type="update_seatbelt",
                    toggle = false
                })
                playSound("unbuckle")
            end
            seatbeltOn = toggle
    
        end
    end
    
    function playSound(action)
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsUsing(ped)
        local maxpeds = GetVehicleMaxNumberOfPassengers(veh) - 2
        local passengers = {}
        for i = -1, maxpeds do
            if not IsVehicleSeatFree(veh, i) then
                local ped = GetPlayerServerId(NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(veh, i)) )
                table.insert(passengers, ped)
            end
        end
        TriggerServerEvent('seatbelt:server:PlaySound', action, json.encode(passengers))
    end
    
    RegisterNetEvent('seatbelt:client:PlaySound')
    AddEventHandler('seatbelt:client:PlaySound', function(action, volume)
        SendNUIMessage({type = action, volume = volume})
    end)
end    