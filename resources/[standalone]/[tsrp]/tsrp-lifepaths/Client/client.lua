
local QBCore = exports['qb-core']:GetCoreObject()
local isUIOpen = false -- Track the state of the UI
local pedsSpawned = false
local lifepath = nil

function SpawnPeds()
	if not Config.LifepathSelectorNPC or not next(Config.LifepathSelectorNPC) or pedsSpawned then return end
	local current = Config.LifepathSelectorNPC[1]
	current.model = type(current.model) == 'string' and joaat(current.model) or current.model
	RequestModel(current.model)
	while not HasModelLoaded(current.model) do
		Wait(0)
	end
	local ped = CreatePed(0, current.model, current.coords.x, current.coords.y, current.coords.z, current.coords.w, false, false)
	FreezeEntityPosition(ped, true)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	current.pedHandle = ped
	local opts = nil
	opts = {
		label = "Choose Your Lifepath",
		icon = 'fas fa-comment-dots',
		type = "client",
		event = "lifepath:openUI",
	}
	if opts then
		exports['qb-target']:AddTargetEntity(ped, {
			options = {opts},
			distance = 2.0
		})
	end
	pedsSpawned = true
end

local function DeletePeds()
    if not pedsSpawned then return end
	local current = Config.LifepathSelectorNPC[1]
	if current.pedHandle then
		DeletePed(current.pedHandle)
	end
end

CreateThread(function()

end)

-- Open the UI with a command in FiveM
function openUI()
    SetDisplay(true)
end

RegisterNUICallback("exit", function(data)
    SetDisplay(false)
end)

function SetDisplay(bool)
    isUIOpen = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "openUI",
        display = bool,
    })
end

-- Trigger the NUI open event
RegisterCommand("lifepath", function(source, args, rawCommand)
    if not isUIOpen then
        TriggerEvent('lifepath:openUI')
    else
        closeUI()
    end
end)

-- NUI callback for lifepath selection
RegisterNUICallback('selectLifepath', function(data, cb)
    lifepath = data.lifepath
    cb('ok')
    TriggerEvent('lifepath:StartTutorial')
end)

-- Event handler for lifepath UI open event
RegisterNetEvent('lifepath:openUI')
AddEventHandler('lifepath:openUI', function()
    openUI()
end)

RegisterNetEvent('lifepath:StartTutorial')
AddEventHandler('lifepath:StartTutorial', function()
    if lifepath == "corpo" then
        TriggerServerEvent("tsrp-lifepaths:server:SyncLifepathMetadata","corpo")
        DoScreenFadeOut(2000)
        Wait(2000)
        SetEntityCoords(PlayerPedId(),Config.CorpoSpawnCoords)
        Wait(3000)
        DoScreenFadeIn(2000)
    elseif lifepath == "streetkid" then
        TriggerServerEvent("tsrp-lifepaths:server:SyncLifepathMetadata","streetkid")
        DoScreenFadeOut(2000)
        Wait(2000)
        SetEntityCoords(PlayerPedId(),Config.StreetKidSpawnCoords)
        Wait(3000)
        DoScreenFadeIn(2000)
    elseif lifepath == "nomad" then
        TriggerServerEvent("tsrp-lifepaths:server:SyncLifepathMetadata","nomad")
        DoScreenFadeOut(2000)
        Wait(2000)
        SetEntityCoords(PlayerPedId(),Config.NomadSpawnCoords)
        Wait(3000)
        DoScreenFadeIn(2000)
    elseif lifepath == "ncpd" then
        TriggerServerEvent("tsrp-lifepaths:server:SyncLifepathMetadata","ncpd")
        DoScreenFadeOut(2000)
        Wait(2000)
        SetEntityCoords(PlayerPedId(),Config.NCPDSpawnCoords)
        Wait(3000)
        DoScreenFadeIn(2000)
    elseif lifepath == "trauma" then
        TriggerServerEvent("tsrp-lifepaths:server:SyncLifepathMetadata","trauma")
        DoScreenFadeOut(2000)
        Wait(2000)
        SetEntityCoords(PlayerPedId(),Config.TraumaTeamSpawnCoords)
        Wait(3000)
        DoScreenFadeIn(2000)
    end
end)

RegisterNetEvent('tsrp-lifepaths:server:CheckLifepath')
AddEventHandler('tsrp-lifepaths:server:CheckLifepath', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
	local lifepath = PlayerData.metadata.lifepath
    print(lifepath)
end)

-- UI page initialization
Citizen.CreateThread(function()
    local uiReady = false

    while not uiReady do
        Citizen.Wait(0)
        if not isUIOpen then
            SendNUIMessage({
                type = 'uiReady'
            })
            uiReady = true
        end
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
		SpawnPeds()
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    DeletePeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    SpawnPeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    DeletePeds()
end)
