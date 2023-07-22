local fwork = Config.Framework

function getFramework()
    local Core = {}
    if fwork == "qbcore" then 
        local success, error = pcall(function()
            Core = exports[Config.FrameworkCustomName or "qb-core"]:GetCoreObject()
        end)
        if not success then 
            TriggerEvent('QBCore:GetObject', function(obj) 
                Core = obj 
            end)
        end
    else
        if Config.NewESX then
            Core = exports[Config.FrameworkCustomName or "es_extended"]:getSharedObject()
        else
            TriggerEvent('esx:getSharedObject', function(obj) Core = obj end)
        end
    end
    return Core
end

Framework = getFramework()


function Framework.GetIdentifier()
    local playerData = fwork == "qbcore" and Framework.Functions.GetPlayerData() or Framework.GetPlayerData()
    if not playerData then return end
    return fwork == "qbcore" and playerData.citizenid or playerData.identifier
end

function Framework.GetPlayerJob()
    local playerData = fwork == "qbcore" and Framework.Functions.GetPlayerData() or Framework.GetPlayerData()
    if not playerData then return end
    return playerData.job.name
end

function Framework.TriggerCallback(name, ...)
    local retval = promise:new()
    if fwork == "qbcore" then
        Framework.Functions.TriggerCallback(name, function(...)
            retval:resolve(...)
        end, ...)
    else
        Framework.TriggerServerCallback(name, function(...)
            retval:resolve(...)
        end, ...)
    end
    return Citizen.Await(retval)
end