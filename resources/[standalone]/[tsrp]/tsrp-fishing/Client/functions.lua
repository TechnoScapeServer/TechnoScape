local QBCore = exports['qb-core']:GetCoreObject()
--Fishing Difficulties
RegisterNetEvent('tk-fishing:functions:PierMinigameHard')
AddEventHandler('tk-fishing:functions:PierMinigameHard', function()
    local success = exports["skillbar"]:CreateSkillbar(4, "hard")
    if success == true then
        TriggerServerEvent('tk-fishing:Server:CheckBaitPier')
        TriggerEvent('tk-fishing:client:ResetFishing')
    else
        QBCore.Functions.Notify(Lang:t("notify_error.fish_escaped"),'error')
        TriggerEvent('tk-fishing:client:ResetFishing')
    end    
end)

RegisterNetEvent('tk-fishing:functions:PierMinigameMedium')
AddEventHandler('tk-fishing:functions:PierMinigameMedium', function()
    local success = exports["skillbar"]:CreateSkillbar(3, "medium")
    if success == true then
        TriggerServerEvent('tk-fishing:Server:CheckBaitPier')
        TriggerEvent('tk-fishing:client:ResetFishing')
    else
        QBCore.Functions.Notify(Lang:t("notify_error.fish_escaped"),'error')
        TriggerEvent('tk-fishing:client:ResetFishing')
    end
end)

RegisterNetEvent('tk-fishing:functions:PierMinigameNormal')
AddEventHandler('tk-fishing:functions:PierMinigameNormal', function()
    local success = exports["skillbar"]:CreateSkillbar(2, "normal")
    if success == true then
        TriggerServerEvent('tk-fishing:Server:CheckBaitPier')
        TriggerEvent('tk-fishing:client:ResetFishing')
    else
        QBCore.Functions.Notify(Lang:t("notify_error.fish_escaped"),'error')
        TriggerEvent('tk-fishing:client:ResetFishing')
    end
end)

RegisterNetEvent('tk-fishing:functions:PierMinigameEasy')
AddEventHandler('tk-fishing:functions:PierMinigameEasy', function()
    local success = exports["skillbar"]:CreateSkillbar(1, "easy")
    if success == true then
        TriggerServerEvent('tk-fishing:Server:CheckBaitPier')
        TriggerEvent('tk-fishing:client:ResetFishing')
    else
        QBCore.Functions.Notify(Lang:t("notify_error.fish_escaped"),'error')
        TriggerEvent('tk-fishing:client:ResetFishing')
    end
end)

RegisterNetEvent('tk-fishing:functions:OceanMinigameHard')
AddEventHandler('tk-fishing:functions:OceanMinigameHard', function()
    local success = exports["skillbar"]:CreateSkillbar(4, "hard")
    if success == true then
        TriggerServerEvent('tk-fishing:Server:CheckBaitOcean')
        TriggerEvent('tk-fishing:client:ResetFishing')
    else
        QBCore.Functions.Notify(Lang:t("notify_error.fish_escaped"),'error')
        TriggerEvent('tk-fishing:client:ResetFishing')
    end
end)

RegisterNetEvent('tk-fishing:functions:OceanMinigameMedium')
AddEventHandler('tk-fishing:functions:OceanMinigameMedium', function()
    local success = exports["skillbar"]:CreateSkillbar(3, "medium")
    if success == true then
        TriggerServerEvent('tk-fishing:Server:CheckBaitOcean')
        TriggerEvent('tk-fishing:client:ResetFishing')
    else
        QBCore.Functions.Notify(Lang:t("notify_error.fish_escaped"),'error')
        TriggerEvent('tk-fishing:client:ResetFishing')
    end
end)

RegisterNetEvent('tk-fishing:functions:OceanMinigameNormal')
AddEventHandler('tk-fishing:functions:OceanMinigameNormal', function()
    local success = exports["skillbar"]:CreateSkillbar(2, "normal")
    if success == true then
        TriggerServerEvent('tk-fishing:Server:CheckBaitOcean')
        TriggerEvent('tk-fishing:client:ResetFishing')
    else
        QBCore.Functions.Notify(Lang:t("notify_error.fish_escaped"),'error')
        TriggerEvent('tk-fishing:client:ResetFishing')
    end
end)

RegisterNetEvent('tk-fishing:functions:OceanMinigameEasy')
AddEventHandler('tk-fishing:functions:OceanMinigameEasy', function()
    local success = exports["skillbar"]:CreateSkillbar(1, "easy")
    if success == true then
        TriggerServerEvent('tk-fishing:Server:CheckBaitOcean')
        TriggerEvent('tk-fishing:client:ResetFishing')
    else
        QBCore.Functions.Notify(Lang:t("notify_error.fish_escaped"),'error')
        TriggerEvent('tk-fishing:client:ResetFishing')
    end
end)