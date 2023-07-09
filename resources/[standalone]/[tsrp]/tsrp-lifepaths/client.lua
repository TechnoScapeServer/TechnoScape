-- Add this to your client-side Lua file in your FiveM resource
local isUIOpen = false -- Track the state of the UI
local pedsSpawned = false

function SpawnPeds()
	if not Config.OrginSelectorNPC or not next(Config.OrginSelectorNPC) or pedsSpawned then return end
	local current = Config.OrginSelectorNPC[1]
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
	local current = Config.OrginSelectorNPC[1]
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
    print("Selected Lifepath:", data.lifepath)
    TriggerEvent('chat:addMessage', {
        color = {255, 255, 0},
        multiline = true,
        args = {"Selected Lifepath: ", data.lifepath}
    })
    cb('ok')
end)

-- Event handler for lifepath UI open event
RegisterNetEvent('lifepath:openUI')
AddEventHandler('lifepath:openUI', function()
    openUI()
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
