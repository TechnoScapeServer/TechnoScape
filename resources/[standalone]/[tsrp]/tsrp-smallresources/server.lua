local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add('randomcar', 'Spawn a Random Car', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("tk-smallresources:client:randomvehicle",src)
end,'admin')

QBCore.Commands.Add('randomaddoncar', 'Spawn a Random Addon Car', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("tk-smallresources:client:randomaddonvehicle",src)
end,'admin')