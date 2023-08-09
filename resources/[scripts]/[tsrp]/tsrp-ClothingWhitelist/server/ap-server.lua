local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ap-clothing:GetPlayerIdentifier', function()
    local player = source
    local Player = QBCore.Functions.GetPlayer(player)
    local CitizenId = Player.PlayerData.citizenid
    TriggerClientEvent('ap-clothing:ReturnPlayerIdentifier', player, CitizenId)
end)