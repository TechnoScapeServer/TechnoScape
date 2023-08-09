local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local created_ped = nil
local pedsSpawned = false
local isFishing = false

function IsFacingWater()
    local ped = PlayerPedId()
    local headPos = GetPedBoneCoords(ped, 31086, 0.0, 0.0, 0.0)
    local offsetPos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 50.0, -25.0)
    local hit, hitPos = TestProbeAgainstWater(headPos.x, headPos.y, headPos.z, offsetPos.x, offsetPos.y, offsetPos.z)
    return hit
  end

Citizen.CreateThread(function()
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        if ped ~= nil and  IsFacingWater() and GetVehiclePedIsIn(PlayerPedId(),false) == 0 and IsPedSwimming(PlayerPedId()) == false and isFishing == false then
            QBCore.Functions.TriggerCallback('tk-fishing:server:CheckForFishingRod', function(result)
                if result == true then
                    ShowHelpNotification(Lang:t("notify.fishing_input"))
                    if IsControlJustReleased(0,304) then
                        TriggerServerEvent('tk-fishing:Server:CheckRodOcean')
                    end
                end
            end)
        end
    end
end)

--Bait Store and Selling Points
CreateThread(function()
	local coords = Config.BaitShopLocation
    local coords2 = Config.LegalSellLocation
	local x = AddBlipForCoord(coords.x, coords.y, coords.z)
    local y = AddBlipForCoord(coords2.x, coords2.y, coords2.z)
	SetBlipSprite (x, 68)
	SetBlipDisplay(x, 4)
	SetBlipScale  (x, 1.0)
	SetBlipAsShortRange(x, true)
    SetBlipColour(x, 3)
    BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName(Lang:t("blips.bait_store"))
	EndTextCommandSetBlipName(x)
    SetBlipSprite (y, 68)
	SetBlipDisplay(y, 4)
	SetBlipScale  (y, 1.0)
	SetBlipAsShortRange(y, true)
    SetBlipColour(y, 3)
    BeginTextCommandSetBlipName("STRING")
	AddTextComponentSubstringPlayerName(Lang:t("blips.fishery"))
	EndTextCommandSetBlipName(y)
end)

 --3rd Eye Stuff
CreateThread(function()
    exports['qb-target']:AddBoxZone("BaitShop", Config.BaitShopLocation, 1, 1, {
        name = "BaitShop",
        heading = Config.BaitShopLocation.h,
        debugPoly = false,
        minZ = Config.BaitShopMinZ,
        maxZ = Config.BaitShopMaxZ,
        }, {
        options = {
            {
                type = "client",
                event = "tk-fishing:menu:main",
                targeticon = 'fas fa-fish',
                label = Lang:t("target.bait_shop_label")
            },
        },
        distance = 3.0
    })
    exports['qb-target']:AddBoxZone("IllegalBaitShop", Config.IllegalBaitShopLocation, 1, 1, {
        name = "IllegalBaitShop",
        heading = Config.IllegalBaitShopLocation.h,
        debugPoly = false,
        minZ = Config.IllegalBaitShopMinZ,
        maxZ = Config.IllegalBaitShopMaxZ,
        }, {
        options = {
            {
                type = "client",
                event = "tk-fishing:client:OpenIllegalBaitShop",
                targeticon = 'fas fa-fish',
                label = Lang:t("target.illegal_bait_shop_label")
            },
        },
        distance = 3.0
    })
    exports['qb-target']:AddBoxZone("LegalBaitSell", Config.LegalSellLocation, 1, 1, {
        name = "LegalBaitSell",
        heading = Config.LegalSellLocation.h,
        debugPoly = false,
        minZ = Config.LegalSellMinZ,
        maxZ = Config.LegalSellMaxZ,
        }, {
        options = {
            {
                type = "server",
                event = "tk-fishing:server:SellLegalFish",
                targeticon = 'fas fa-fish',
                label = Lang:t("target.sell_fish")
            },
        },
        distance = 3.0
    })
    exports['qb-target']:AddBoxZone("IllegalBaitSell", Config.IllegalSellLocation, 1, 1, {
        name = "IllegalBaitSell",
        heading = Config.IllegalSellLocation.h,
        debugPoly = false,
        minZ = Config.IllegalSellLocationMinZ,
        maxZ = Config.IllegalSellLocationMaxZ,
        }, {
        options = {
            {
                type = "server",
                event = "tk-fishing:server:SellIllegalFish",
                targeticon = 'fas fa-fish',
                label = Lang:t("target.sell_illegal_fish")
            },
        },
        distance = 3.0
    })
end)

 RegisterNetEvent('tk-fishing:client:LevelUp')
 AddEventHandler('tk-fishing:client:LevelUp', function()
    TriggerServerEvent('tk-fishing:server:LevelUp')
 end)

 RegisterNetEvent('tk-fishing:client:LevelUp2')
 AddEventHandler('tk-fishing:client:LevelUp2', function()
    TriggerServerEvent('tk-fishing:server:LevelUp2')
 end)

 RegisterNetEvent('tk-fishing:client:LevelUp3')
 AddEventHandler('tk-fishing:client:LevelUp3', function()
    TriggerServerEvent('tk-fishing:server:LevelUp3')
 end)

 RegisterNetEvent('tk-fishing:client:LevelUp4')
 AddEventHandler('tk-fishing:client:LevelUp4', function()
    TriggerServerEvent('tk-fishing:server:LevelUp4')
 end)

--Shops
 RegisterNetEvent('tk-fishing:client:OpenBaitShop')
AddEventHandler('tk-fishing:client:OpenBaitShop', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "BaitShop", Config.Items)
end)

RegisterNetEvent('tk-fishing:client:OpenIllegalBaitShop')
AddEventHandler('tk-fishing:client:OpenIllegalBaitShop', function()
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "IllegalBaitShop", Config.IllegalItems)
end)

RegisterNetEvent('tk-fishing:client:giveRod')
AddEventHandler('tk-fishing:client:giveRod', function()
    TriggerServerEvent('tk-fishing:server:giveRod')
end)

--Help Function
function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

RegisterNetEvent('tk-fishing:client:ResetFishing')
AddEventHandler('tk-fishing:client:ResetFishing', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    isFishing = false
end)

--Fishing Difficulties
RegisterNetEvent('tk-fishing:client:FishHard')
AddEventHandler('tk-fishing:client:FishHard', function()
    isFishing = true
    TriggerEvent('animations:client:EmoteCommandStart', {"fishing2"})
    
    if Config.Delay == true then
        Wait(Config.DelayTime * 1000)
    end
    QBCore.Functions.Notify(Lang:t("notify.bite"), 'success')
    TriggerEvent('tk-fishing:functions:PierMinigameHard')
end)

RegisterNetEvent('tk-fishing:client:FishMedium')
AddEventHandler('tk-fishing:client:FishMedium', function()
    isFishing = true
    TriggerEvent('animations:client:EmoteCommandStart', {"fishing2"})
    if Config.Delay == true then
        Wait(Config.DelayTime * 1000)
    end
    QBCore.Functions.Notify(Lang:t("notify.bite"), 'success')
    TriggerEvent('tk-fishing:functions:PierMinigameMedium')
end)

RegisterNetEvent('tk-fishing:client:FishNormal')
AddEventHandler('tk-fishing:client:FishNormal', function()
    isFishing = true
    TriggerEvent('animations:client:EmoteCommandStart', {"fishing2"})
    if Config.Delay == true then
        Wait(Config.DelayTime * 1000)
    end
    QBCore.Functions.Notify(Lang:t("notify.bite"), 'success')
    TriggerEvent('tk-fishing:functions:PierMinigameNormal')
end)

RegisterNetEvent('tk-fishing:client:FishEasy')
AddEventHandler('tk-fishing:client:FishEasy', function()
    isFishing = true
    TriggerEvent('animations:client:EmoteCommandStart', {"fishing2"})
    if Config.Delay == true then
        Wait(Config.DelayTime * 1000)
    end
    QBCore.Functions.Notify(Lang:t("notify.bite"), 'success')
    TriggerEvent('tk-fishing:functions:PierMinigameEasy')
end)

RegisterNetEvent('tk-fishing:client:FishHardOcean')
AddEventHandler('tk-fishing:client:FishHardOcean', function()
    isFishing = true
    TriggerEvent('animations:client:EmoteCommandStart', {"fishing2"})
    if Config.Delay == true then
        Wait(Config.DelayTime * 1000)
    end
    QBCore.Functions.Notify(Lang:t("notify.bite"), 'success')
    TriggerEvent('tk-fishing:functions:OceanMinigameHard')
end)

RegisterNetEvent('tk-fishing:client:FishMediumOcean')
AddEventHandler('tk-fishing:client:FishMediumOcean', function()
    isFishing = true
    TriggerEvent('animations:client:EmoteCommandStart', {"fishing2"})
    if Config.Delay == true then
        Wait(Config.DelayTime * 1000)
    end
    QBCore.Functions.Notify(Lang:t("notify.bite"), 'success')
    TriggerEvent('tk-fishing:functions:OceanMinigameMedium')
end)

RegisterNetEvent('tk-fishing:client:FishNormalOcean')
AddEventHandler('tk-fishing:client:FishNormalOcean', function()
    isFishing = true
    TriggerEvent('animations:client:EmoteCommandStart', {"fishing2"})
    if Config.Delay == true then
        Wait(Config.DelayTime * 1000)
    end
    QBCore.Functions.Notify(Lang:t("notify.bite"), 'success')
    TriggerEvent('tk-fishing:functions:OceanMinigameNormal')
end)

RegisterNetEvent('tk-fishing:client:FishEasyOcean')
AddEventHandler('tk-fishing:client:FishEasyOcean', function()
    isFishing = true
    TriggerEvent('animations:client:EmoteCommandStart', {"fishing2"})
    if Config.Delay == true then
        Wait(Config.DelayTime * 1000)
    end
    QBCore.Functions.Notify(Lang:t("notify.bite"), 'success')
    TriggerEvent('tk-fishing:functions:OceanMinigameEasy')
end)

local function spawnPeds()
    if not Config.Peds or not next(Config.Peds) or pedsSpawned then return end
    for i = 1, #Config.Peds do
        local current = Config.Peds[i]
        current.model = type(current.model) == 'string' and joaat(current.model) or current.model
        RequestModel(current.model)
        while not HasModelLoaded(current.model) do
            Wait(0)
        end
        local ped = CreatePed(0, current.model, current.coords.x, current.coords.y, current.coords.z, current.coords.w, false, false)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        current.pedHandle = ped
    end
    pedsSpawned = true
end

local function deletePeds()
    if not Config.Peds or not next(Config.Peds) or not pedsSpawned then return end
    for i = 1, #Config.Peds do
        local current = Config.Peds[i]
        if current.pedHandle then
            DeletePed(current.pedHandle)
        end
    end
end

Citizen.CreateThread(function()
    spawnPeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
    isLoggedIn = true
    spawnPeds()
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    PlayerData = {}
    isLoggedIn = false
    deletePeds()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
    PlayerData = val
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    deletePeds()
end)



