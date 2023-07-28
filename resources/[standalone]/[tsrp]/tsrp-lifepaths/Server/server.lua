local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("tsrp-lifepaths:server:SyncLifepathMetadata")
AddEventHandler("tsrp-lifepaths:server:SyncLifepathMetadata", function(lifepath)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetMetaData("lifepath", lifepath)
end)

QBCore.Commands.Add('checklifepath', 'Checks Your Lifepath', {}, false, function(source, args)
    local src = source
    TriggerClientEvent("tsrp-lifepaths:server:CheckLifepath",src)
end)