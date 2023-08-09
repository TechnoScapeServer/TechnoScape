RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
end)

RegisterCommand('traumateam', function()
    SendNUIMessage({
        action = "open"
    })
    SetNuiFocus(true, true)
end, false)

