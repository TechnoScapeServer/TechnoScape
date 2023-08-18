local QBCore = exports['qb-core']:GetCoreObject()

function FetchSkills()
    PlayerData = QBCore.Functions.GetPlayerData()
    --Base Game Skills
    if PlayerData.metadata.endurance ~= 100 then
        if PlayerData.metadata.endurancexp >= Config.ExperienceTable[PlayerData.metadata.endurance + 1] then
            exports["skills"]:UpdateSkill("endurance",PlayerData.metadata.endurance + 1)
            TriggerServerEvent("skills:server:ResetXP","endurancexp")
        end
    end
    if PlayerData.metadata.strength ~= 100 then
        if PlayerData.metadata.strengthxp >= Config.ExperienceTable[PlayerData.metadata.strength + 1] then
            exports["skills"]:UpdateSkill("strength",PlayerData.metadata.strength + 1)
            TriggerServerEvent("skills:server:ResetXP","strengthxp")
        end
    end
    if PlayerData.metadata.lungcapacity ~= 100 then
        if PlayerData.metadata.lungcapacityxp >= Config.ExperienceTable[PlayerData.metadata.lungcapacity + 1] then
            exports["skills"]:UpdateSkill("lungcapacity",PlayerData.metadata.lungcapacity + 1)
            TriggerServerEvent("skills:server:ResetXP","lungcapacityxp")
        end
    end
    if PlayerData.metadata.flying ~= 100 then
        if PlayerData.metadata.flyingxp >= Config.ExperienceTable[PlayerData.metadata.flying + 1] then
            exports["skills"]:UpdateSkill("flying",PlayerData.metadata.flying + 1)
            TriggerServerEvent("skills:server:ResetXP","flyingxp")
        end
    end
    --Custom Skills
    if PlayerData.metadata.iq ~= 100 then
        if PlayerData.metadata.iqxp >= Config.ExperienceTable[PlayerData.metadata.iq + 1] then
            exports["skills"]:UpdateSkill("iq",PlayerData.metadata.iq + 1)
            TriggerServerEvent("skills:server:ResetXP","iqxp")
        end
    end

    Config.Skills["endurance"]["Default"] = PlayerData.metadata.endurance
    Config.Skills["strength"]["Default"] = PlayerData.metadata.strength
    Config.Skills["lungcapacity"]["Default"] = PlayerData.metadata.lungcapacity
    Config.Skills["flying"]["Default"] = PlayerData.metadata.flying
    Config.Skills["iq"]["Default"] = PlayerData.metadata.iq

    RefreshSkills()
end

exports('UpdateSkill', function(skill,amount)
    RefreshSkills()
    if skill == "endurance" then
        QBCore.Functions.Notify("Your Endurance Has Leveled Up to: "..PlayerData.metadata.endurance + 1, "success", 3500)
        TriggerServerEvent("skills:server:LevelUp", "endurance")
    elseif skill == "strength" then
        QBCore.Functions.Notify("Your Strength Has Leveled Up to: "..PlayerData.metadata.strength + 1, "success", 3500)
        TriggerServerEvent("skills:server:LevelUp", "strength")
    elseif skill == "lungcapacity" then
        QBCore.Functions.Notify("Your Lung Capacity Has Leveled Up to: "..PlayerData.metadata.lungcapacity + 1, "success", 3500)
        TriggerServerEvent("skills:server:LevelUp", "lungcapacity")
    elseif skill == "flying" then
        QBCore.Functions.Notify("Your Flying Has Leveled Up to: "..PlayerData.metadata.flying + 1, "success", 3500)
        TriggerServerEvent("skills:server:LevelUp", "flying")
    elseif skill == "iq" then
        QBCore.Functions.Notify("Your IQ Has Leveled Up to: "..PlayerData.metadata.iq + 1, "success", 3500)
        TriggerServerEvent("skills:server:LevelUp", "iq")
    end
end)

function round(num) 
    return math.floor(num+.5) 
end

function RefreshSkills()
    for type, value in pairs(Config.Skills) do
        if Config.Debug then
            print(value["Label"].. ": " .. value['Default'])
        elseif Config.Debug and not Config.Skills[skill] then
            print("something went wrong")
        end
        if value["Stat"] then
            StatSetInt(value["Stat"], round(value["Default"]), true)
        end
    end
end

RegisterNetEvent('skills:client:FetchSkills')
AddEventHandler('skills:client:FetchSkills', function()
    FetchSkills()
end)