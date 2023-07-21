local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local streetkidChoice1prompted = false
local streetkidChoice1 = false
local vehicle = nil
local gangVehicle = nil
local inVehicle = false
local gangMemberDistance = false
local gangMemberDistance2 = false
local Zones = {}
local skzone5 = {
    vector2(-555.84, -84.99),
    vector2(-562.08, -82.15),
    vector2(-550.86, -54.71),
    vector2(-544.65, -58.13)
}
local skzone6= {
    vector2(-79.51, -552.81),
    vector2(-81.6, -558.28),
    vector2(-54.74, -567.35),
    vector2(-52.73, -562.09)
}
local zonename = nil
local currentZone = nil 
local waitingForTrigger = false
local waitingForTrigger2 = false
Peds = {
    ['Bar'] = {},
    ['Gang'] = {},
}

--Lifepath Functions

function SpawnSKPeds()
    --Vehicles
    QBCore.Functions.SpawnVehicle(Config.LifepathSettings["streetkid"]['PadreVehicleModel'], function(veh)
        vehicle = veh
        SetEntityHeading(veh, Config.LifepathSettings["streetkid"]['PadreCarLocation'].w)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        exports['LegacyFuel']:SetFuel(veh, 100.0)
        SetEntityAsMissionEntity(veh,true,true)
    end, Config.LifepathSettings["streetkid"]['PadreCarLocation'], true)
    --Peds
    loadModel(Config.LifepathSettings["streetkid"]['PepeModel'])
    Peds['Bar'][0] = CreatePed(26, GetHashKey(Config.LifepathSettings["streetkid"]['PepeModel']), Config.LifepathSettings["streetkid"]['PepeLocation'], Config.LifepathSettings["streetkid"]['PepeLocation'].w, true, true)
    NetworkRegisterEntityAsNetworked(Peds['Bar'][0])
    networkID = NetworkGetNetworkIdFromEntity(Peds['Bar'][0])
    SetNetworkIdCanMigrate(networkID, true)
    SetNetworkIdExistsOnAllMachines(networkID, true)
    SetPedRandomComponentVariation(Peds['Bar'][0], 0)
    SetPedRandomProps(Peds['Bar'][0])
    SetEntityAsMissionEntity(Peds['Bar'][0])
    SetEntityVisible(Peds['Bar'][0], true)
    FreezeEntityPosition(Peds['Bar'][0], true)
    SetBlockingOfNonTemporaryEvents(Peds['Bar'][0], true)
    SetEntityInvincible(Peds['Bar'][0], true)
    local opts = nil
    opts = {
        label = "Talk With Pepe",
        icon = 'fas fa-comment-dots',
        type = "client",
        event = "lifepaths:streetkid:Dialogue1",
    }
    if opts then
        exports['qb-target']:AddTargetEntity(Peds['Bar'][0], {
            options = {opts},
            distance = 2.0
        })
    end
    loadModel(Config.LifepathSettings["streetkid"]['KirkModel'])
    Peds['Bar'][1] = CreatePed(26, GetHashKey(Config.LifepathSettings["streetkid"]['KirkModel']), Config.LifepathSettings["streetkid"]['KirkLocation'], Config.LifepathSettings["streetkid"]['KirkLocation'].w, true, true)
    NetworkRegisterEntityAsNetworked(Peds['Bar'][1])
    networkID = NetworkGetNetworkIdFromEntity(Peds['Bar'][1])
    SetNetworkIdCanMigrate(networkID, true)
    SetNetworkIdExistsOnAllMachines(networkID, true)
    SetPedRandomComponentVariation(Peds['Bar'][1], 0)
    SetPedRandomProps(Peds['Bar'][1])
    SetEntityAsMissionEntity(Peds['Bar'][1])
    SetEntityVisible(Peds['Bar'][1], true)
    FreezeEntityPosition(Peds['Bar'][1], true)
    SetBlockingOfNonTemporaryEvents(Peds['Bar'][1], true)
    SetEntityInvincible(Peds['Bar'][1], true)
    local opts2 = nil
    opts2 = {
        label = "Talk With Kirk",
        icon = 'fas fa-comment-dots',
        type = "client",
        event = "lifepaths:streetkid:Dialogue6",
    }
    if opts2 then
        exports['qb-target']:AddTargetEntity(Peds['Bar'][1], {
            options = {opts2},
            distance = 2.0
        })
    end
    loadModel(Config.LifepathSettings["streetkid"]['PadreModel'])
    Peds['Bar'][2] = CreatePed(26, GetHashKey(Config.LifepathSettings["streetkid"]['PadreModel']), Config.LifepathSettings["streetkid"]['PadreLocation'], Config.LifepathSettings["streetkid"]['PadreLocation'].w, true, true)
    NetworkRegisterEntityAsNetworked(Peds['Bar'][2])
    networkID = NetworkGetNetworkIdFromEntity(Peds['Bar'][2])
    SetNetworkIdCanMigrate(networkID, true)
    SetNetworkIdExistsOnAllMachines(networkID, true)
    SetPedRandomComponentVariation(Peds['Bar'][2], 0)
    SetPedRandomProps(Peds['Bar'][2])
    SetEntityAsMissionEntity(Peds['Bar'][2])
    SetEntityVisible(Peds['Bar'][2], true)
    FreezeEntityPosition(Peds['Bar'][2], true)
    SetBlockingOfNonTemporaryEvents(Peds['Bar'][2], true)
    SetEntityInvincible(Peds['Bar'][2], true)
    local opts3 = nil
    opts3 = {
        label = "Talk With Padre",
        icon = 'fas fa-comment-dots',
        type = "client",
        event = "lifepaths:streetkid:Dialogue19",
    }
    if opts3 then
        exports['qb-target']:AddTargetEntity(Peds['Bar'][2], {
            options = {opts3},
            distance = 2.0
        })
    end
    loadModel(Config.LifepathSettings["streetkid"]['PadreBGModel'])
    Peds['Bar'][3] = CreatePed(26, GetHashKey(Config.LifepathSettings["streetkid"]['PadreBGModel']), Config.LifepathSettings["streetkid"]['PadreBGLocation'], Config.LifepathSettings["streetkid"]['PadreBGLocation'].w, true, true)
    NetworkRegisterEntityAsNetworked(Peds['Bar'][3])
    networkID = NetworkGetNetworkIdFromEntity(Peds['Bar'][3])
    SetNetworkIdCanMigrate(networkID, true)
    SetNetworkIdExistsOnAllMachines(networkID, true)
    SetPedRandomComponentVariation(Peds['Bar'][3], 0)
    SetPedRandomProps(Peds['Bar'][3])
    SetEntityAsMissionEntity(Peds['Bar'][3])
    SetEntityVisible(Peds['Bar'][3], true)
    FreezeEntityPosition(Peds['Bar'][3], true)
    SetBlockingOfNonTemporaryEvents(Peds['Bar'][3], true)
    SetEntityInvincible(Peds['Bar'][3], true)
end

function padreEnterVehicle()
    FreezeEntityPosition(Peds['Bar'][2], false)
    FreezeEntityPosition(Peds['Bar'][3], false)
    TaskEnterVehicle(Peds['Bar'][2], vehicle, -1, 1, 1.0, 1, 0)
    TaskEnterVehicle(Peds['Bar'][3], vehicle, -1, -1, 1.0, 1, 0)
    TaskEnterVehicle(PlayerPedId(), vehicle, -1, 2, 1.0, 1, 0)
end

function padreDrive()
    TaskVehicleDriveToCoord(Peds['Bar'][3],vehicle,Config.LifepathSettings["streetkid"]['PadreDriveL1'].x,Config.LifepathSettings["streetkid"]['PadreDriveL1'].y,Config.LifepathSettings["streetkid"]['PadreDriveL1'].z,20.0,0,Config.LifepathSettings["streetkid"]['PadreVehicleModel'],387,2.0)
    SetPedKeepTask(Peds['Bar'][3], true)
    waitingForTrigger = true
    TriggerEvent("lifepaths:streetkid:Dialogue23")
end

function PadreDriveAway()
    TaskVehicleDriveToCoord(Peds['Bar'][3],vehicle,Config.LifepathSettings["streetkid"]['PadreDriveL2'].x,Config.LifepathSettings["streetkid"]['PadreDriveL2'].y,Config.LifepathSettings["streetkid"]['PadreDriveL2'].z,20.0,0,Config.LifepathSettings["streetkid"]['PadreVehicleModel'],387,2.0)
    SetPedKeepTask(Peds['Bar'][3], true)
    waitingForTrigger2 = true
end

function padreEnterVehicle()
    FreezeEntityPosition(Peds['Bar'][2], false)
    FreezeEntityPosition(Peds['Bar'][3], false)
    TaskEnterVehicle(Peds['Bar'][2], vehicle, -1, 1, 1.0, 1, 0)
    TaskEnterVehicle(Peds['Bar'][3], vehicle, -1, -1, 1.0, 1, 0)
    TaskEnterVehicle(PlayerPedId(), vehicle, -1, 2, 1.0, 1, 0)
end

function LetPlayerOut()
    SetVehicleDoorsLocked(vehicle,1)
    TaskLeaveVehicle(PlayerPedId(), vehicle,0)
    --Change Mission Text
    ClearPedTasks(Peds['Bar'][3])
    Wait(10000)
    DeleteSKPeds()
end

function SpawnGangVehicle()
    loadModel(Config.LifepathSettings["streetkid"]['GangModel'])
    loadModel(Config.LifepathSettings["streetkid"]['GangVehicleModel'])
    QBCore.Functions.SpawnVehicle(Config.LifepathSettings["streetkid"]['GangVehicleModel'], function(veh2)
        gangVehicle = veh2
        SetEntityHeading(veh2, Config.LifepathSettings["streetkid"]['GangVehicleLocation'].w)
        exports['LegacyFuel']:SetFuel(veh2, 100.0)
        SetEntityAsMissionEntity(veh2,true,true)
    end, Config.LifepathSettings["streetkid"]['GangVehicleLocation'], true)
    waitingForTrigger = false
    Peds['Gang'][0] = CreatePedInsideVehicle(gangVehicle,1,GetHashKey(Config.LifepathSettings["streetkid"]['GangModel']),-1,true,true)
    Peds['Gang'][1] = CreatePedInsideVehicle(gangVehicle,1,GetHashKey(Config.LifepathSettings["streetkid"]['GangModel']),0,true,true)
    Peds['Gang'][2] = CreatePedInsideVehicle(gangVehicle,1,GetHashKey(Config.LifepathSettings["streetkid"]['GangModel']),1,true,true)
    Peds['Gang'][3] = CreatePedInsideVehicle(gangVehicle,1,GetHashKey(Config.LifepathSettings["streetkid"]['GangModel']),2,true,true)
    NetworkRegisterEntityAsNetworked(Peds['Gang'][0])
    SetPedRandomComponentVariation(Peds['Gang'][0], 0)
    SetPedRandomProps(Peds['Gang'][0])
    SetEntityAsMissionEntity(Peds['Gang'][0])
    SetEntityVisible(Peds['Gang'][0], true)
    FreezeEntityPosition(Peds['Gang'][0], true)
    SetBlockingOfNonTemporaryEvents(Peds['Gang'][0], true)
    SetEntityInvincible(Peds['Gang'][0], true)
    
    NetworkRegisterEntityAsNetworked(Peds['Gang'][1])
    SetPedRandomComponentVariation(Peds['Gang'][1], 0)
    SetPedRandomProps(Peds['Gang'][1])
    SetEntityAsMissionEntity(Peds['Gang'][1])
    SetEntityVisible(Peds['Gang'][1], true)
    FreezeEntityPosition(Peds['Gang'][1], true)
    SetBlockingOfNonTemporaryEvents(Peds['Gang'][1], true)
    SetEntityInvincible(Peds['Gang'][1], true)

    NetworkRegisterEntityAsNetworked(Peds['Gang'][2])
    SetPedRandomComponentVariation(Peds['Gang'][2], 0)
    SetPedRandomProps(Peds['Gang'][2])
    SetEntityAsMissionEntity(Peds['Gang'][2])
    SetEntityVisible(Peds['Gang'][2], true)
    FreezeEntityPosition(Peds['Gang'][2], true)
    SetBlockingOfNonTemporaryEvents(Peds['Gang'][2], true)
    SetEntityInvincible(Peds['Gang'][2], true)

    NetworkRegisterEntityAsNetworked(Peds['Gang'][3])
    SetPedRandomComponentVariation(Peds['Gang'][3], 0)
    SetPedRandomProps(Peds['Gang'][3])
    SetEntityAsMissionEntity(Peds['Gang'][3])
    SetEntityVisible(Peds['Gang'][3], true)
    FreezeEntityPosition(Peds['Gang'][3], true)
    SetBlockingOfNonTemporaryEvents(Peds['Gang'][3], true)
    SetEntityInvincible(Peds['Gang'][3], true)
    Wait(1000)
    TaskVehicleDriveToCoord(Peds['Gang'][0],gangVehicle,Config.LifepathSettings["streetkid"]['GangDriveL1'].x,Config.LifepathSettings["streetkid"]['GangDriveL1'].y,Config.LifepathSettings["streetkid"]['GangDriveL1'].z,20.0,0,Config.LifepathSettings["streetkid"]['GangVehicleModel'],956,4.0)
    SetPedKeepTask(Peds['Gang'][0], true)
end

CreateThread(function()
    while true do
        Wait(1000)
        if GetVehiclePedIsIn(PlayerPedId(),vehicle) == vehicle and GetVehiclePedIsIn(Peds['Bar'][2],vehicle) == vehicle and GetVehiclePedIsIn(Peds['Bar'][3],vehicle) == vehicle and not inVehicle then
            inVehicle = true
            SetVehicleDoorsLocked(vehicle,4)
            SetFollowVehicleCamViewMode(4)
	        SetFollowPedCamViewMode(4)
            TriggerEvent("lifepaths:streetkid:Dialogue22")
        end
    end
end)

function DeleteSKPeds()
    DeleteEntity(Peds['Bar'][0]) -- Pepe
    DeleteEntity(Peds['Bar'][1]) -- Kirk
    DeleteEntity(Peds['Bar'][2]) -- Padre
    DeleteEntity(Peds['Bar'][3]) -- PadreBG
    DeleteEntity(vehicle) -- PadreCar
    DeleteEntity(Peds['Gang'][0]) -- Gang Member Driver
    DeleteEntity(Peds['Gang'][1]) -- Gang Member Passenger
    DeleteEntity(Peds['Gang'][2]) -- Gang Member Driver Side Passenger
    DeleteEntity(Peds['Gang'][3]) -- Gang Member Passenger Side Passenger
    DeleteEntity(gangVehicle) -- GangCar
end

function StreetkidLifepath()
    DoScreenFadeOut(2000)
    Wait(3000)
    SetEntityCoords(PlayerPedId(),Config.LifepathSettings["streetkid"]["SpawnLocation"])
    SetEntityHeading(PlayerPedId(), Config.LifepathSettings["streetkid"]["SpawnLocation"].w)
    FreezeEntityPosition(PlayerPedId(),true)
    DoScreenFadeIn(2000)
    streetkidChoice1prompted = true
    SpawnSKPeds()
    TriggerEvent("lifepaths:streetkid:Choice1")
end

--Streetkid Functions

RegisterNetEvent('lifepath:streetkid:fixNose')
AddEventHandler('lifepath:streetkid:fixNose', function()
    streetkidChoice1 = true
    TriggerEvent('animations:client:EmoteCommandStart', {"adjusttie"})
    FreezeEntityPosition(PlayerPedId(),false)
    Wait(3000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
end)

RegisterNetEvent('lifepath:streetkid:takeShot')
AddEventHandler('lifepath:streetkid:takeShot', function()
    streetkidChoice1 = true
    TriggerEvent('animations:client:EmoteCommandStart', {"whiskey"})
    Wait(15000)
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    FreezeEntityPosition(PlayerPedId(),false)
end)

CreateThread(function()
    Zones[1] = PolyZone:Create(skzone5, {
        name = 'SKSGT',
        minZ = 	40,
        maxZ = 46,
        debugPoly = true,
    })
    Zones[1]:onPlayerInOut(function(isPointInside)
        if isPointInside and waitingForTrigger == true then
        elseif isPointInside == false and waitingForTrigger == true then
            SpawnGangVehicle()
        end
    end)
    Zones[2] = PolyZone:Create(skzone6, {
        name = 'SKGOT',
        minZ = 	38,
        maxZ = 44,
        debugPoly = true,
    })
    Zones[2]:onPlayerInOut(function(isPointInside)
        if isPointInside and waitingForTrigger2 == true then
        elseif isPointInside == false and waitingForTrigger2 == true then
            TriggerEvent("lifepaths:streetkid:Dialogue33")
            waitingForTrigger2 = false
        end
    end)
end)

CreateThread(function()
    while true do
        Wait(1000)
        if streetkidChoice1prompted ~= false then
            while streetkidChoice1 == false do
                if streetkidChoice1prompted ~= false and streetkidChoice1 ~= true then
                    -- Player Was Prompted but then closed out of the menu
                    TriggerEvent("lifepaths:streetkid:Choice1")
                end
                Wait(1000)
            end
        end
        gangVehicleCoords = GetEntityCoords(gangVehicle)
        gangMemberCoords = GetEntityCoords(Peds['Gang'][3])
        playerCoords = GetEntityCoords(PlayerPedId())
        print(GetDistanceBetweenCoords(gangVehicleCoords.x, gangVehicleCoords.y, gangVehicleCoords.z, Config.LifepathSettings["streetkid"]['GangDriveL1'].x, Config.LifepathSettings["streetkid"]['GangDriveL1'].y, Config.LifepathSettings["streetkid"]['GangDriveL1'].z, true))
        if GetDistanceBetweenCoords(gangVehicleCoords.x, gangVehicleCoords.y, gangVehicleCoords.z, Config.LifepathSettings["streetkid"]['GangDriveL1'].x, Config.LifepathSettings["streetkid"]['GangDriveL1'].y, Config.LifepathSettings["streetkid"]['GangDriveL1'].z, true) <= 15 and gangMemberDistance == false then
            Wait(4000)
            FreezeEntityPosition(Peds['Gang'][3],false)
            TaskLeaveVehicle(Peds['Gang'][3], gangVehicle, 0)
            Wait(2000)
            TaskGoStraightToCoord(Peds['Gang'][3], playerCoords, 1.2, -1, 0.0, 0.0)
            gangMemberDistance = true
        end
        if GetDistanceBetweenCoords(gangMemberCoords,playerCoords, true) <= 10 and gangMemberDistance2 == false and gangMemberDistance == true then
            TriggerEvent("lifepaths:streetkid:Dialogue28")
            gangMemberDistance2 = true
        end 
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    DeleteSKPeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    DeleteSKPeds()
end)