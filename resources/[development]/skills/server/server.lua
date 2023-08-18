local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('skills:server:LevelUp', function (skill)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.SetMetaData(skill, Player.PlayerData.metadata[skill]+(1))
end)

RegisterServerEvent('skills:server:ResetXP', function (skill)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.SetMetaData(skill, 0)
end)

QBCore.Commands.Add('resetskills', 'Reset All Skills To 0', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetMetaData("endurance", 0)
    Player.Functions.SetMetaData("strength", 0)
    Player.Functions.SetMetaData("lungcapacity", 0)
    Player.Functions.SetMetaData("flying", 0)
    Player.Functions.SetMetaData("wheelie", 0)
    Player.Functions.SetMetaData("iq", 0)
    Player.Functions.SetMetaData("endurancexp", 0)
    Player.Functions.SetMetaData("strengthxp", 0)
    Player.Functions.SetMetaData("lungcapacityxp", 0)
    Player.Functions.SetMetaData("flyingxp", 0)
    Player.Functions.SetMetaData("wheeliexp", 0)
    Player.Functions.SetMetaData("iqxp", 0)
    TriggerClientEvent('QBCore:Notify', src, "Skills Reset!")
    TriggerClientEvent("skills:client:FetchSkills",src)
end,'admin')

QBCore.Commands.Add('maxskills', 'Max Skills Out', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.SetMetaData("endurance", 100)
    Player.Functions.SetMetaData("strength", 100)
    Player.Functions.SetMetaData("lungcapacity", 100)
    Player.Functions.SetMetaData("flying", 100)
    Player.Functions.SetMetaData("wheelie", 100)
    Player.Functions.SetMetaData("iq", 100)
    TriggerClientEvent('QBCore:Notify', src, "All Skills Maxed Out!")
    TriggerClientEvent("skills:client:FetchSkills",src)
end,'admin')

QBCore.Commands.Add('skills', 'Open Skills Viewer', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent("skills:menu:Open",src)
end,'user')

QBCore.Commands.Add('addlevel', 'Add Level To Skill', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local skill = args[1]
    local levelAmount = args[2]
    Player.Functions.SetMetaData(skill, Player.PlayerData.metadata[skill]+(levelAmount))
    TriggerClientEvent('QBCore:Notify', src, "Added "..levelAmount.. " to"..skill)
    TriggerClientEvent("skills:client:FetchSkills",src)
end,'admin')

QBCore.Commands.Add('addxp', 'Add XP To Skill', {}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local skillxp = args[1]
    local xpAmount = args[2]
    Player.Functions.SetMetaData(skillxp, Player.PlayerData.metadata[skillxp]+(xpAmount))
    TriggerClientEvent('QBCore:Notify', src, "Added "..xpAmount.. " to"..skillxp)
    TriggerClientEvent("skills:client:FetchSkills",src)
end,'admin')