local QBCore = exports['qb-core']:GetCoreObject()

local DrugsToCheckFor = {
    'weed_baggy',
    'cocaine',
    'weapon_pistol',
    'phone'
}

RegisterNetEvent('Apollo:Server:CheckIfPlayerHasDrugs', function(CheckingPlayer)

    local src = source

    -- Check CheckingPlayers Inventory for Drugs
    local Player = QBCore.Functions.GetPlayer(CheckingPlayer)

    -- Search Player Inventory for Drugs
    local HasDrugs = false
    for k, v in pairs(DrugsToCheckFor) do
        if Player.PlayerData.items ~= nil then
            for i = 1, #Player.PlayerData.items, 1 do
                if Player.PlayerData.items[i].name == v then
                    HasDrugs = true
                end
            end
        end
    end

    -- If Drugs are found, send a message to the player
    if HasDrugs then
        TriggerClientEvent('QBCore:Notify', src, 'This player smells suspicous ...', 'error')
        TriggerClientEvent('Apollo:Client:DrawLineToPlayer', src, CheckingPlayer)
    else 
        TriggerClientEvent('QBCore:Notify', src, 'This player smells normal ...', 'success')
    end


end)