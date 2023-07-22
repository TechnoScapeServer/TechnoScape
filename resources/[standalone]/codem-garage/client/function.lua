
-- nomral/local spawn vehicle
local currentlivery = 1
local veh_extras = {['vehicleExtras'] = {}}
local repaired = {}
local spawned = false
RegisterNUICallback('spawnlocalvehicle',function(data,cb)
    local model  = data.model['model']
    local plate  = data.model['plate']
    local garage = data.garage
    local props  = data.model
    
    if Config.Framework == 'esx' then

        CreateThread(function()
            if not spawned and not addfavorite then
                local NearbyVehicles = frameworkObject.Game.GetVehiclesInArea(Config.Garages[garage]["car"].showcar, 5.0)
                if next(NearbyVehicles) then
                    DeleteVehicle(car)
                    DeleteEntity(car)
                    Config.ClientNotification(Config.NotificationText["OCCUPIED"].text, Config.NotificationText["OCCUPIED"].type, Config.NotificationText["OCCUPIED"].timeout)
                else
                    spawned = true
                    frameworkObject.Game.SpawnLocalVehicle(model,Config.Garages[garage]["car"].showcar,Config.Garages[garage]["car"].showcar.w,function(vehicle)
                        car = vehicle
                        SetVehicleNumberPlateText(vehicle, plate)
                        SetVehicleEngineOn(vehicle, true, true)
                        SetEntityAsMissionEntity(vehicle, true, true)
                        frameworkObject.Game.SetVehicleProperties(vehicle,props)
                        spawned = false
                    end)
                end
            end
        end)
        
        DeleteVehicle(car)

        cb(plate)
    else

        CreateThread(function()
            if not spawned and not addfavorite then
                if IsSpawnPointClear(Config.Garages[garage]["car"].showcar, 5.0) then
                    spawned = true
                    frameworkObject.Functions.SpawnVehicle(model, function(vehicle)
                        car = vehicle
                        SetVehicleNumberPlateText(vehicle, plate)
                        frameworkObject.Functions.SetVehicleProperties(vehicle,props)
                        SetVehicleEngineOn(vehicle, true, true)
                        SetEntityAsMissionEntity(vehicle, true, true)
                        spawned = false
                    end, Config.Garages[garage]["car"].showcar, false)
                else
                    DeleteVehicle(car)
                    Config.ClientNotification(Config.NotificationText["OCCUPIED"].text, Config.NotificationText["OCCUPIED"].type, Config.NotificationText["OCCUPIED"].timeout)
                end
            end
        end)

        DeleteVehicle(car)

        cb(plate)
    end
end)

RegisterNUICallback('spawnvehicle',function(data,cb)
    local model  = data.model['model']
    local plate  = data.model['plate']
    local garage = data.garage
    local props  = data.model

    if data.vale == true then
        local money = Callback('codem-garage:checkmoney')
        cb(money)
    elseif data.impound == true then
        local money = Callback('codem-garage:checkmoneyImpound')
        cb(money)
    else
        if Config.Framework == 'esx' then
            local NearbyVehicles = frameworkObject.Game.GetVehiclesInArea(Config.Garages[garage]["car"].spawncar, 3.0)
            if next(NearbyVehicles) then
                Config.ClientNotification(Config.NotificationText["OCCUPIED"].text, Config.NotificationText["OCCUPIED"].type, Config.NotificationText["OCCUPIED"].timeout)
            else
                frameworkObject.Game.SpawnVehicle(model,Config.Garages[garage]["car"].spawncar,Config.Garages[garage]["car"].spawncar.w,function(vehicle)
                    frameworkObject.Game.SetVehicleProperties(vehicle,props)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    SetVehicleNumberPlateText(vehicle, plate)
                    SetVehicleEngineOn(vehicle, true, true)
                    SetEntityAsMissionEntity(vehicle, true, true)
                    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                    SetVehRadioStation(vehicle, "OFF")
                    Config.SetVehicleFuel(vehicle,props.fuelLevel)
                    VehicleKeys(plate)
                    if repaired[car] then
                        SetVehicleDirtLevel(vehicle,0,0)
                        SetVehicleUndriveable(vehicle, false)
                        WashDecalsFromVehicle(vehicle, 1.0)
                        SetVehicleFixed(vehicle)
                        SetVehicleDeformationFixed(vehicle)
                    end

                    if Config.Garages[garage].garage == "jobgarage" then
                        SetVehicleLivery(vehicle,currentlivery)
                        Config.SetVehicleFuel(vehicle,100)
                        for extraID = 0, 20 do
                            if veh_extras.vehicleExtras[extraID] == true then
                                check = true
                            else
                                check = false
                            end
                            SetVehicleExtra(vehicle, extraID, check)
                        end
                        if Config.JobVehicleMax then
                            PerformanceUpgradeVehicle(vehicle)
                        end
                    end
                end)

                TriggerServerEvent('codem-garage:stored',plate,0,garage)

                if data.vale == 2 then
                    TriggerServerEvent('codem-garage:pay','vale')
                elseif data.vale == 3 then
                    TriggerServerEvent('codem-garage:pay','impound')
                end

            end

        else
            local NearbyVehicles = IsSpawnPointClear(Config.Garages[garage]["car"].spawncar, 3.0)

            if NearbyVehicles then
                frameworkObject.Functions.SpawnVehicle(model, function(vehicle)
                    TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
                    SetVehicleNumberPlateText(vehicle, plate)
                    frameworkObject.Functions.SetVehicleProperties(vehicle,props)
                    VehicleKeys(frameworkObject.Functions.GetPlate(vehicle))
                    SetVehicleEngineOn(vehicle, true, true)
                    SetEntityAsMissionEntity(vehicle, true, true)
                    SetVehicleHasBeenOwnedByPlayer(vehicle, true)
                    SetVehRadioStation(vehicle, "OFF")
                    Config.SetVehicleFuel(vehicle,props.fuelLevel)

                    if repaired[car] then
                        SetVehicleDirtLevel(vehicle,0,0)
                        SetVehicleUndriveable(vehicle, false)
                        WashDecalsFromVehicle(vehicle, 1.0)
                        SetVehicleFixed(vehicle)
                        SetVehicleDeformationFixed(vehicle)
                    end

                    if Config.Garages[garage].garage == "jobgarage" then
                        Config.SetVehicleFuel(vehicle,100)
                        SetVehicleLivery(vehicle,currentlivery)
                        for extraID = 0, 20 do
                            if veh_extras.vehicleExtras[extraID] == true then
                                check = true
                            else
                                check = false
                            end
                            SetVehicleExtra(vehicle, extraID, check)
                        end
                        if Config.JobVehicleMax then
                            PerformanceUpgradeVehicle(vehicle)
                        end
                    end

                end, Config.Garages[garage]["car"].spawncar, true)

                TriggerServerEvent('codem-garage:stored',plate,0,garage)

                if data.vale == 2 then
                    TriggerServerEvent('codem-garage:pay','vale')
                elseif data.vale == 3 then
                    TriggerServerEvent('codem-garage:pay','impound')
                end

            else

                Config.ClientNotification(Config.NotificationText["OCCUPIED"].text, Config.NotificationText["OCCUPIED"].type, Config.NotificationText["OCCUPIED"].timeout)
            end
        end
    end
end)

function openGarage(k)
    local servercars = Callback('codem-garage:fetchVehicles', k)
    local playername = Callback('codem-garage:getname')
    local discordimage = Callback('codem-garage:getimage')
    local garagetype = Config.Garages[k]["garage"]

    local cars = {}
    repaired = {}

    if garagetype == 'jobgarage' then
        if Config.Framework == 'esx' then
            acess = Config.Garages[k].access
        else
            if Config.Garages[k].gang ~= "none" then
                acess = Config.Garages[k].gang
            else
                acess = Config.Garages[k].access
            end
        end
    end
    Config.MenuOpen()

    if garagetype == 'normal' or garagetype == 'boat' or garagetype == 'aircraft' or garagetype == 'impound' or garagetype == 'impoundboat' or garagetype == 'impoundplane' then
        for _,v in pairs(servercars) do

            storeds = v.stored
            
            if Config.Out then
                out = Callback('codem-garage:checkout',v.plate)
                if out then
                    storeds = 2
                end
            end

            if Config.Framework == 'esx' then
                carnames = GetLabelText(GetDisplayNameFromVehicleModel(v.vehicle["model"]))
                if Config.Sell then
                    if vehicleprice[v.vehicle["model"]] then
                        vhprice = vehicleprice[v.vehicle["model"]].price / 2
                    else
                        vhprice = Config.DefaultSellPrice
                    end
                end
            else
                carnames = GetLabelText(GetDisplayNameFromVehicleModel(v.vehicle["model"]))
                if Config.Sell then
                    if vehicleprice[v.vehiclename] then
                        vhprice = vehicleprice[v.vehiclename].price / 2
                    else
                        vhprice = Config.DefaultSellPrice
                    end
                end
            end

            if Config.Debug then
                if carnames == nil or not carnames or carnames == "NULL" then
                    print('Add this car name manuel car name in Config.ManuelCarName: ' .. string.lower(GetDisplayNameFromVehicleModel(v.vehicle["model"])))
                    print([[Example: ["]] .. string.lower(GetDisplayNameFromVehicleModel(v.vehicle["model"])) .. [["] = "]] .. 'Custom Car Name' .. [["]])
                end
            end

            if Config.ManuelCarName[string.lower(GetDisplayNameFromVehicleModel(v.vehicle["model"]))] then
                carnames = Config.ManuelCarName[string.lower(GetDisplayNameFromVehicleModel(v.vehicle["model"]))]
            end

            local carlogo = GetLabelText(Citizen.InvokeNative(0xF7AF4F159FF99F97, v.vehicle["model"], Citizen.ResultAsString()))

            if Config.Debug then
                if carlogo == nil or not carlogo or carlogo == "NULL" then
                    print('Add this car logo manuel car logo in Config.CarLogo: ' .. string.lower(GetDisplayNameFromVehicleModel(v.vehicle["model"])))
                    print([[Example: ["]] .. string.lower(GetDisplayNameFromVehicleModel(v.vehicle["model"])) .. [["] = "]] .. 'WESTERN' .. [["]])
                end
            end

            if carlogo == nil or not carlogo or carlogo == "NULL" then
                carlogo = Config.CarLogo[string.lower(GetDisplayNameFromVehicleModel(v.vehicle["model"]))]
            end

            table.insert(cars,{
                vehicle = v.vehicle,
                plate   = v.plate,
                stored  = storeds,
                garage  = v.parking,
                favorite = v.favorite,
                pgarage = k,
                price   = vhprice,
                carname = carnames,
                carlogo = GetLabelText(Citizen.InvokeNative(0xF7AF4F159FF99F97, v.vehicle["model"], Citizen.ResultAsString())),
                class   = GetVehicleClassFromName(v.vehicle["model"]),
                speed   = Config.GetVehicleEstimatedMaxSpeed(v.vehicle["model"]),
                caracce = Config.GetVehicleEstimatedAcceleration(v.vehicle["model"]),
            })


        end

        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamCoord(cam, Config.Garages[k]["camera"].x,Config.Garages[k]["camera"].y, Config.Garages[k]["camera"].z)
        SetCamRot(cam, Config.Garages[k]["camera"]["rotationX"], Config.Garages[k]["camera"]["rotationY"], Config.Garages[k]["camera"]["rotationZ"])
        SetCamActive(cam, true)
        RenderScriptCams(1, 1, 750, 1, 1)

        SendNUIMessage({
            action = 'OPEN_MENU',
            vehicles = cars,
            name = playername,
            type = Config.Garages[k]["garage"],
            avatar = discordimage,
        })

        SetNuiFocus(true, true)

    -- Job Garage
    elseif garagetype == 'jobgarage' and GetJob(k) == acess then


        for _,v in pairs(Config.Garages[k].cars) do
            if GetJobGrade(k) >= v.grade then

                if Config.Framework == 'esx' then
                    carname = GetLabelText(GetDisplayNameFromVehicleModel(v.model))
                else
                    carname = GetLabelText(GetDisplayNameFromVehicleModel(v.model))
                end

                if Config.Debug then
                    if carname == nil or not carname or carname == "NULL" then
                        print('Add this car name manuel car name in Config.ManuelCarName: ' .. string.lower(GetDisplayNameFromVehicleModel(v.model)))
                        print([[Example: ["]] .. string.lower(GetDisplayNameFromVehicleModel(v.model)) .. [["] = "]] .. 'Custom Car Name' .. [["]])
                    end
                end

                if Config.ManuelCarName[string.lower(GetDisplayNameFromVehicleModel(v.model))] then
                    carname = Config.ManuelCarName[string.lower(GetDisplayNameFromVehicleModel(v.model))]
                end

                carlogo = GetLabelText(Citizen.InvokeNative(0xF7AF4F159FF99F97, v.model, Citizen.ResultAsString()))

                if Config.Debug then
                    if carlogo == nil or not carlogo or carlogo == "NULL" then
                        print('Add this car logo manuel car logo in Config.CarLogo: ' .. string.lower(GetDisplayNameFromVehicleModel(v.model)))
                        print([[Example: ["]] .. string.lower(GetDisplayNameFromVehicleModel(v.model)) .. [["] = "]] .. 'WESTERN' .. [["]])
                    end
                end

                if carlogo == nil or not carlogo or carlogo == "NULL" then
                    carlogo = Config.CarLogo[string.lower(GetDisplayNameFromVehicleModel(v.model))]
                end

                table.insert(cars,{
                    vehicle = {model = GetHashKey(v.model), plate = GeneratePlate()},
                    stored  = 1,
                    garage  = k,
                    favorite= 0,
                    pgarage = k,
                    carname = carname,
                    price   = vhprice,
                    carlogo = carlogo,
                    class   = GetVehicleClassFromName(v.model),
                    speed   = Config.GetVehicleEstimatedMaxSpeed(v.model),
                    caracce = Config.GetVehicleEstimatedAcceleration(v.model),
                })
            end

        end

        cam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
        SetCamCoord(cam, Config.Garages[k]["camera"].x,Config.Garages[k]["camera"].y, Config.Garages[k]["camera"].z)
        SetCamRot(cam, Config.Garages[k]["camera"]["rotationX"], Config.Garages[k]["camera"]["rotationY"], Config.Garages[k]["camera"]["rotationZ"])
        SetCamActive(cam, true)
        RenderScriptCams(1, 1, 750, 1, 1)
        SendNUIMessage({
            action = 'OPEN_MENU',
            vehicles = cars,
            name = playername,
            type = Config.Garages[k]["garage"],
            avatar = discordimage,
        })

        SetNuiFocus(true, true)
    end

end

local performanceModIndices = { 11, 12, 13, 15, 16 }
function PerformanceUpgradeVehicle(vehicle, customWheels)
    customWheels = customWheels or false
    local max
    if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
        SetVehicleModKit(vehicle, 0)
        for _, modType in ipairs(performanceModIndices) do
            max = GetNumVehicleMods(vehicle, tonumber(modType)) - 1
            SetVehicleMod(vehicle, modType, max, customWheels)
        end
        ToggleVehicleMod(vehicle, 18, true) -- Turbo
	SetVehicleFixed(vehicle)
    SetVehicleDirtLevel(vehicle, 0)
    SetVehiclePetrolTankHealth(vehicle, 1000.0)
    SetVehicleEngineHealth(vehicle, 1000.0)
    end
end
RegisterNUICallback('extra',function (data, cb)
    local count = tonumber(data.count)
    if DoesEntityExist(car) then
        if IsVehicleExtraTurnedOn(car,count) then
            SetVehicleExtra(car,count,true)
            veh_extras.vehicleExtras[count] = true
        else
            SetVehicleExtra(car,count,false)
            veh_extras.vehicleExtras[count] = false
        end

    end
    cb("ok")
end)

RegisterNUICallback('apply',function (data, cb)
    local count = data.count
    currentlivery = GetVehicleLivery(car)
    for extraID = 0, 20 do
        if veh_extras.vehicleExtras[extraID] == IsVehicleExtraTurnedOn(car, extraID) == 1 then
            check = true
        else
            check = false
        end
    end
    cb("ok")

end)

RegisterNUICallback('livery',function (data, cb)
    local count = data.count
    if DoesEntityExist(car) then
        SetVehicleLivery(car,count)
        currentlivery = count
    end
    cb("ok")

end)

RegisterNUICallback('repair',function(data, cb)
    if data.plate then
        local money = Callback('codem-garage:checkmoney2')
        if money then
            if not repaired[car] and car then
                repaired[car] = true
                TriggerServerEvent('codem-garage:repair',data.plate)
            else
                Config.ClientNotification(Config.NotificationText["ALREADYREPAIRED"].text, Config.NotificationText["ALREADYREPAIRED"].type, Config.NotificationText["ALREADYREPAIRED"].timeout)
            end
        else
            Config.ClientNotification(Config.NotificationText["NO_MONEY"].text, Config.NotificationText["NO_MONEY"].type, Config.NotificationText["NO_MONEY"].timeout)
        end
    end
    if cb then
        cb("ok")
    end
end)

RegisterNetEvent('codem-garage:openGarage')
AddEventHandler('codem-garage:openGarage', function(garageName)
    openGarage(garageName)
end)

RegisterNetEvent('codem-garage:storedVehicle')
AddEventHandler('codem-garage:storedVehicle', function(garageName,plate)
    TriggerServerEvent('codem-garage:stored',plate,0,garageName)
end)