local QBCore = exports['qb-core']:GetCoreObject()
local menuLocation = 'topright'
local MenuTheme = 'default'
local playingAsDog = false

local MenuColor = {
    R = 0,
    G = 231,
    B = 206
}

local K9Menu = MenuV:CreateMenu(false, '--    K9 Menu    -- ', menuLocation, MenuColor.R, MenuColor.G, MenuColor.B,
    'size-150', MenuTheme, false, false)
local ClothingOptions = MenuV:CreateMenu(false, 'K9 Clothing', menuLocation, MenuColor.R, MenuColor.G, MenuColor.B,
    'size-150', MenuTheme, 'menuv', 'test1')
local K9Emotes = MenuV:CreateMenu(false, 'K9 Emotes', menuLocation, MenuColor.R, MenuColor.G, MenuColor.B,
    'size-150', MenuTheme, 'menuv', 'test2')


local RevertToHuman = K9Menu:AddCheckbox({
    icon = '👨‍🦲',
    label = 'Back To Human',
    value = K9Menu,
    description = 'Revert To Human'
})
RevertToHuman:On('change', function(item, checked)
    playingAsDog = false
    QBCore.Functions.Notify('Decreased Stamina', 'success')
    TriggerEvent("fivem-appearance:client:reloadSkin", source)
end)

local SpawnAsK9 = K9Menu:AddCheckbox({
    icon = '🐶',
    label = 'Spawn As K9',
    value = K9Menu,
    description = 'Spawn As K9'
})
SpawnAsK9:On('change', function(item, checked)
    playingAsDog = true
    QBCore.Functions.Notify('Increased Stamina', 'success')
    TriggerEvent('ApolloK9:client:ChangeToDoggyPed')
end)

local K9Button2 = K9Menu:AddButton({
    icon = '👕',
    label = 'K9 Clothing [WIP]',
    value = ClothingOptions,
    description = 'Edit Your K9 Appearance'
})

local K9Button3 = K9Menu:AddButton({
    icon = '🕺',
    label = 'K9 Emotes',
    value = K9Emotes,
    description = 'Play Some K9 Emotes'
})

local K9EmoteButtonx = K9Emotes:AddCheckbox({
    icon = '🛑',
    label = '[!] STOP ALL EMOTES [!]',
    value = K9Emotes,
    description = 'Stop All Emotes'
})
K9EmoteButtonx:On('change', function(item)
    TriggerEvent('ApolloK9:client:PlayEmote','stop', 'stop', 10)
end)
for k, v in pairs(ApolloConfig.DoggyEmotes) do
    local K9EmoteButton = K9Emotes:AddCheckbox({
        icon = '🕺',
        label = v.label,
        value = K9Emotes,
        description = 'Play Some K9 Emotes'
    })
    K9EmoteButton:On('change', function(item)
        TriggerEvent('ApolloK9:client:PlayEmote', v.animDict, v.anim, v.flag)
    end)
end


RegisterCommand('openk9menu', function()
    K9Menu:Open()
end)

-- [!] Lets Run Some Doggy Threads
Citizen.CreateThread(function()
    while true do
        if playingAsDog then
            
            ResetPlayerStamina(PlayerId())

            -- listen for key press
            if IsControlJustPressed(0, 38) then
                local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
                TriggerServerEvent('Apollo:Server:CheckIfPlayerHasDrugs', GetPlayerServerId(closestPlayer))
            end
            
        end
        Wait(0)
    end
end)

RegisterNetEvent('Apollo:Client:DrawLineToPlayer', function(Player)
    
    local player = PlayerPedId()
    local target = GetPlayerPed(GetPlayerFromServerId(Player))
    local playerCoords = GetEntityCoords(player)
    local targetCoords = GetEntityCoords(target)

    -- draw a line for 5 seconds
    for i = 1, 50 do
        DrawLine(playerCoords.x, playerCoords.y, playerCoords.z, targetCoords.x, targetCoords.y, targetCoords.z, 255, 0, 0, 255)
        Wait(0)
    end
    
end)