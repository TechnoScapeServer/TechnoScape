RegisterCommand(Config.Commands['changetype'], function()
    if not CurrentHouse then return SendTextMessage(Lang("HOUSING_NOTIFICATION_NO_INSIDE_HOUSE") 'error') end
    local iplData = Config.Houses[CurrentHouse].ipl
    local menuThemes = iplData.themes
    local interiorId = iplData.theme.interiorId
    local interiorData = Config.IplData[iplData.houseName]?.export
    if not interiorData then return SendTextMessage(Lang("HOUSING_NOTIFICATION_IPL_NO_THEMES"), 'error') end
    interiorData = interiorData()

    ChangeTypeMenu(menuThemes, interiorData)
end)

RegisterCommand(Config.Commands['createhouse'], function()
    if PlayerData and PlayerData.job and PlayerData.job.name and Config.Realestatejob[PlayerData.job.name] then
        OpenHouseMenuRealEstate()
    end
end)

if Config.RealEstateMenu then
    RegisterKeyMapping(Config.Commands['createhouse'], 'Real estate menu', 'keyboard', Config.KeyHouseMenuRealEstate)
end

RegisterCommand(Config.Commands['checkhouse'], function()
    if not closesthouse then 
        return SendTextMessage(Lang("HOUSING_NOTIFICATION_NO_HOUSES_NEARBY"), 'error') 
    end
    TriggerServerCallback('housing:server:getCreditState', function(state)
        if state then
            SendTextMessage(Lang("HOUSING_NOTIFICATION_IN_DEBT"), 'inform')
        else
            SendTextMessage(Lang("HOUSING_NOTIFICATION_NO_DEBT"), 'inform')
        end
    end, closesthouse)
end)

RegisterCommand(Config.Commands['housemenu'], function()
    if Config.Houses[closesthouse].mlo and inGreenArea[closesthouse] then
        if closesthouse ~= nil and hasKey then 
            OpenHouseMenu()
        end
    end
end)

RegisterCommand(Config.Commands['housingfix'], function()
    if inside or DecoMode then
        SetEntityCoords(PlayerPedId(), Config.Houses[CurrentHouse].coords.enter.x, Config.Houses[CurrentHouse].coords.enter.y, Config.Houses[CurrentHouse].coords.enter.z, 0, 0, 0, false)
        Citizen.Wait(500)
        inside = false
        TriggerServerEvent('housing:server:setInside', CurrentHouse, false)
        TriggerServerEvent('housing:server:leaveBucket')
        CurrentHouse = nil
        CloseFullDecoration()
        DebugPrint("Debug command enabled, back to default options!")
    end
end)
