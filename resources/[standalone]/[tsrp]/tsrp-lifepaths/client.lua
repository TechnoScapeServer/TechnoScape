-- Add this to your client-side Lua file in your FiveM resource
local isUIOpen = false -- Track the state of the UI

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
