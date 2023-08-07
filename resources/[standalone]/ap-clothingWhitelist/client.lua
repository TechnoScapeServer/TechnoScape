local QBCore = exports['qb-core']:GetCoreObject()

--test2

-- [Dynamic Variables]
local CitizenId = nil
local PlayerGang = nil

local playersClothes = {}
RegisterNetEvent('ap-whitelist:checkClothes', function()

    -- [[ Get The Players Gang Name ]]
    for k, v in pairs(apwhitelist.WhitelistedMembers) do
        for i = 1, #v do
            if v[i] == CitizenId then
                PlayerGang = k
            end
        end
    end

    -- [[ Check If The Player Is In A Gang & Remove Any Other Gangs Outfits ]]
    if PlayerGang ~= nil then
        for k, v in pairs(apwhitelist.GangOutfits) do
            if k ~= PlayerGang then
                for i = 1, #v do
                    if v[i] == CitizenId then
                        TriggerEvent('ap-clothing:RemoveOutfit', k)
                    end
                end
            end
        end
    else
        for k, v in pairs(apwhitelist.GangOutfits) do
            TriggerEvent('ap-clothing:RemoveOutfit', k)
        end
    end
end)

RegisterNetEvent('ap-clothing:RemoveOutfit', function(gang)

    print('Removing Outfit For: ' .. gang)

    local playerPed = PlayerPedId()
    local hats = GetPedPropIndex(playerPed, 0)
    local mask = GetPedDrawableVariation(playerPed, 1)
    local ears = GetPedPropIndex(playerPed, 2)
    local arms = GetPedDrawableVariation(playerPed, 3)
    local pants = GetPedDrawableVariation(playerPed, 4)
    local parachute = GetPedDrawableVariation(playerPed, 5)
    local shoes = GetPedDrawableVariation(playerPed, 6)
    local bags = GetPedDrawableVariation(playerPed, 7)
    local bracelets = GetPedPropIndex(playerPed, 7)
    local tops = GetPedDrawableVariation(playerPed, 8)
    local vest = GetPedDrawableVariation(playerPed, 9)
    local decals = GetPedDrawableVariation(playerPed, 10)
    local torso = GetPedDrawableVariation(playerPed, 11)
    local glasses = GetPedPropIndex(playerPed, 1)
    local watches = GetPedPropIndex(playerPed, 6)

    if apwhitelist.GangOutfits[gang] ~= nil then
        if apwhitelist.GangOutfits[gang]["Head"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Head"] do
                if apwhitelist.GangOutfits[gang]["Head"][i] == hats then
                    SetPedComponentVariation(playerPed, 0, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Head Has Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Mask"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Mask"] do
                if apwhitelist.GangOutfits[gang]["Mask"][i] == mask then
                    SetPedComponentVariation(playerPed, 1, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Mask Has Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Ears"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Ears"] do
                if apwhitelist.GangOutfits[gang]["Ears"][i] == ears then
                    SetPedPropIndex(playerPed, 2, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Ear Prop Have Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Arms"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Arms"] do
                if apwhitelist.GangOutfits[gang]["Arms"][i] == arms then
                    SetPedComponentVariation(playerPed, 3, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Arm Props Have Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Pants"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Pants"] do
                if apwhitelist.GangOutfits[gang]["Pants"][i] == pants then
                    SetPedComponentVariation(playerPed, 4, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Pants Have Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Parachute"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Parachute"] do
                if apwhitelist.GangOutfits[gang]["Parachute"][i] == parachute then
                    SetPedComponentVariation(playerPed, 5, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Parachute Has Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Shoes"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Shoes"] do
                if apwhitelist.GangOutfits[gang]["Shoes"][i] == shoes then
                    SetPedComponentVariation(playerPed, 6, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Shoes Have Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Bags"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Bags"] do
                if apwhitelist.GangOutfits[gang]["Bags"][i] == bags then
                    SetPedComponentVariation(playerPed, 7, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Bag Has Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Bracelets"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Bracelets"] do
                if apwhitelist.GangOutfits[gang]["Bracelets"][i] == bracelets then
                    SetPedPropIndex(playerPed, 7, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Bracelets Have Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Tops"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Tops"] do
                if apwhitelist.GangOutfits[gang]["Tops"][i] == tops then
                    SetPedComponentVariation(playerPed, 8, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Top Has Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Vest"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Vest"] do
                if apwhitelist.GangOutfits[gang]["Vest"][i] == vest then
                    SetPedComponentVariation(playerPed, 9, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Vest Has Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Decals"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Decals"] do
                if apwhitelist.GangOutfits[gang]["Decals"][i] == decals then
                    SetPedComponentVariation(playerPed, 10, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Decals Have Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Torso"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Torso"] do
                if apwhitelist.GangOutfits[gang]["Torso"][i] == torso then
                    SetPedComponentVariation(playerPed, 11, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Torso Has Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Glasses"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Glasses"] do
                if apwhitelist.GangOutfits[gang]["Glasses"][i] == glasses then
                    SetPedPropIndex(playerPed, 1, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Glasses Have Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
        if apwhitelist.GangOutfits[gang]["Watches"] ~= nil then
            for i = 1, #apwhitelist.GangOutfits[gang]["Watches"] do
                if apwhitelist.GangOutfits[gang]["Watches"][i] == watches then
                    SetPedPropIndex(playerPed, 6, 0, 0, 0)
                    TriggerEvent('QBCore:Notify', 'Your Watch Has Been Removed - This Is Gang Specific.' , "error")
                end
            end
        end
    end

end)

RegisterCommand('apollo', function()
    TriggerServerEvent('ap-clothing:GetPlayerIdentifier')
    Wait(1000)
    TriggerEvent('ap-whitelist:checkClothes')
end)

RegisterNetEvent('ap-clothing:ReturnPlayerIdentifier', function(_CitizenId)
    CitizenId = _CitizenId
    print('CitizenId: ' .. CitizenId)
end)