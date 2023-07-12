local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local streetkidChoice1prompted = false
local streetkidChoice1 = false
Peds = {
    ['Bar'] = {},
}

--Lifepath Functions

function SpawnSKPeds()
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
end

function DeleteSKPeds()
    DeleteEntity(Peds['Bar'][0])
    DeleteEntity(Peds['Bar'][1])
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
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    DeleteSKPeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    DeleteSKPeds()
end)