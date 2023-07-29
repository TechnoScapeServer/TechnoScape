local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local vehicle = nil

RegisterCommand("testcarmod", function(source, args)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleModKit(vehicle, 0)
    SetVehicleMod(vehicle, tonumber(args[1]), tonumber(args[2]), false)
    print("Set vehicle Mod")
end)

RegisterCommand("testchasecars", function(source, args)
    SpawnChaseCars()
end)

local performanceModIndices = { 11, 12, 13, 15, 16 }
function SpawnChaseCars()
    local chaseveh = nil
    local chaseveh2 = nil
    local coords = vector3(1187.65, -1405.8, 34.37)
    local coords2 = vector3(1191.29, -1405.66, 34.49)
    RequestModel(GetHashKey("elegy"))
    while not HasModelLoaded(GetHashKey("elegy")) do
        Citizen.Wait(1) 
    end
    chaseveh = CreateVehicle('elegy',coords.x,coords.y,coords.z,0.00,true,true)
    chaseveh2 = CreateVehicle('elegy',coords2.x,coords2.y,coords2.z,0.00,true,true)

    --Vehicle Customization
    SetVehicleColours(chaseveh, 12, 0) -- Matte Black
    SetVehicleNeonLightEnabled(chaseveh,0,true) --Left Neon Light
    SetVehicleNeonLightEnabled(chaseveh,1,true) --Right Neon Light
    SetVehicleNeonLightEnabled(chaseveh,2,true) --Front Neon Light
    SetVehicleNeonLightEnabled(chaseveh,3,true) --Back Neon Light
    SetVehicleNeonLightsColour(chaseveh,15,3,255) -- Blacklight
    for _, modType in ipairs(performanceModIndices) do
        max = GetNumVehicleMods(chaseveh, tonumber(modType)) - 1
        SetVehicleMod(chaseveh, modType, max, customWheels)
    end
    ToggleVehicleMod(chaseveh, 18, true) -- Turbo

    SetVehicleColours(chaseveh2, 12, 0) -- Matte Black
    SetVehicleNeonLightEnabled(chaseveh2,0,true) --Left Neon Light
    SetVehicleNeonLightEnabled(chaseveh2,1,true) --Right Neon Light
    SetVehicleNeonLightEnabled(chaseveh2,2,true) --Front Neon Light
    SetVehicleNeonLightEnabled(chaseveh2,3,true) --Back Neon Light
    SetVehicleNeonLightsColour(chaseveh2,15,3,255) -- Blacklight
    for _, modType in ipairs(performanceModIndices) do
        max = GetNumVehicleMods(chaseveh2, tonumber(modType)) - 1
        SetVehicleMod(chaseveh2, modType, max, customWheels)
    end


    RequestModel(GetHashKey("g_m_importexport_01"))
    while not HasModelLoaded(GetHashKey("g_m_importexport_01")) do
        Citizen.Wait(1) 
    end
    local playerPos = GetEntityCoords(PlayerPedId())
    local ped = CreatePedInsideVehicle(chaseveh, 1, 'g_m_importexport_01', -1, true, true)
    local ped2 = CreatePedInsideVehicle(chaseveh, 1, 'g_m_importexport_01', 0, true, true)
    local ped3 = CreatePedInsideVehicle(chaseveh2,1, 'g_m_importexport_01',-1, true, true)
    local ped4 = CreatePedInsideVehicle(chaseveh2,1, 'g_m_importexport_01',0, true, true)

    --Driver 1
    SetPedArmour(ped, 100)
    SetPedAccuracy(ped, 25)
    SetPedSeeingRange(ped, 100000000.0)
    SetPedHearingRange(ped, 100000000.0)
    SetPedFleeAttributes(ped, 0, 0)
    SetPedCombatAttributes(ped, 46, 1)
    SetPedCombatAbility(ped, 100)
    SetPedCombatMovement(ped, 2)
    SetPedCombatRange(ped, 2)
    TaskVehicleChase(ped, PlayerPedId())

    -- Shooter 1
    SetPedArmour(ped2, 100)
    SetPedAccuracy(ped2, 25)
    SetPedSeeingRange(ped2, 100000000.0)
    SetPedHearingRange(ped2, 100000000.0)
    SetPedFleeAttributes(ped2, 0, 0)
    SetPedCombatAttributes(ped2, 46, 1)
    SetPedCombatAbility(ped2, 100)
    SetPedCombatMovement(ped2, 2)
    SetPedCombatRange(ped2, 2)
    GiveWeaponToPed(ped2, GetHashKey('WEAPON_PISTOL'), 255, false, false)
    TaskCombatPed(ped2,PlayerPedId(),0,16)
    
    --Driver 2
    SetPedArmour(ped3, 100)
    SetPedAccuracy(ped3, 25)
    SetPedSeeingRange(ped3, 100000000.0)
    SetPedHearingRange(ped3, 100000000.0)
    SetPedFleeAttributes(ped3, 0, 0)
    SetPedCombatAttributes(ped3, 46, 1)
    SetPedCombatAbility(ped3, 100)
    SetPedCombatMovement(ped3, 2)
    SetPedCombatRange(ped3, 2)
    TaskVehicleChase(ped3, PlayerPedId())

    --Shooter 2
    SetPedArmour(ped4, 100)
    SetPedAccuracy(ped4, 25)
    SetPedSeeingRange(ped4, 100000000.0)
    SetPedHearingRange(ped4, 100000000.0)
    SetPedFleeAttributes(ped4, 0, 0)
    SetPedCombatAttributes(ped4, 46, 1)
    SetPedCombatAbility(ped4, 100)
    SetPedCombatMovement(ped4, 2)
    SetPedCombatRange(ped4, 2)
    GiveWeaponToPed(ped4, GetHashKey('WEAPON_PISTOL'), 255, false, false)
    TaskCombatPed(ped4,PlayerPedId(),0,16)
end


local performanceModIndices = { 11, 12, 13, 15, 16 }
local ModIndices = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 14,17,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49 }
function UpgradeVehicle(vehicle, customWheels)
    customWheels = customWheels or false
    local max
    local max2
    if DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
        SetVehicleModKit(vehicle, 0)
        for _, modType in ipairs(ModIndices) do
            max = GetNumVehicleMods(vehicle, tonumber(modType)) - 1
            if max ~= 0 and max ~= -1 then
                random = math.random(1,max)
                SetVehicleMod(vehicle, modType, random, customWheels)
            end
        end
        for _, modType in ipairs(performanceModIndices) do
            max2 = GetNumVehicleMods(vehicle, tonumber(modType)) - 1
            SetVehicleMod(vehicle, modType, max2, customWheels)
        end
        ToggleVehicleMod(vehicle, 18, true) -- Turbo
	    SetVehicleFixed(vehicle)
    end
end

function SpawnCar(coords,carhash)
    local primaryColor = math.random(0, 242)
    QBCore.Functions.SpawnVehicle(carhash, function(veh)
        vehicle = veh
        SetEntityHeading(veh, coords.w)
        exports["LegacyFuel"]:SetFuel(veh, 100.0)
        SetEntityAsMissionEntity(veh,true,true)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
    end, coords, true)
    UpgradeVehicle(vehicle)
    vehicleSpawned = true
    if primaryColor ~= nil then
        SetVehicleColours(vehicle, primaryColor, 0)
    else
        SetVehicleColours(vehicle, 0, 0)
    end
end

RegisterNetEvent('tk-smallresources:client:randomvehicle', function()
    local coords = GetEntityCoords(PlayerPedId(),true)
    local randomCar = (Config.RandomVehicleSpawnerVehicles[math.random(#Config.RandomVehicleSpawnerVehicles)])
    SpawnCar(coords,randomCar)
end)

RegisterNetEvent('tk-smallresources:client:randomaddonvehicle', function()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsUsing(ped)
    local coords = GetEntityCoords(PlayerPedId(),true)
    if IsPedInAnyVehicle(ped) then
        DeleteVehicle(veh)
    end
    local randomCar = (Config.RandomAddonVehicleSpawnerVehicles[math.random(#Config.RandomAddonVehicleSpawnerVehicles)])
    SpawnCar(coords,randomCar)
end)

CreateThread(function()
    while true do
        Wait(1000)
        SetPedCanLosePropsOnDamage(PlayerPedId(), false, 0)
    end
end)