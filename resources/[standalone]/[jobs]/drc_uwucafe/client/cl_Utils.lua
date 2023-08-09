lib.locale()

if Config.Framework == "ESX" then
    if Config.NewESX then
        ESX = exports["es_extended"]:getSharedObject()
    else
        ESX = nil
        CreateThread(function()
            while ESX == nil do
                TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)
                Wait(100)
            end
        end)
    end
elseif Config.Framework == "qbcore" then
    QBCore = nil
    QBCore = exports["qb-core"]:GetCoreObject()
elseif Config.Framework == "standalone" then
    -- ADD YOU FRAMEWORK
end

-- Your notification type settings
-- •» You can edit a type of notifications, with chaning type or triggering your own.
Notify = function(type, title, text)
    if Config.NotificationType == "ESX" then
        ESX.ShowNotification(text)
    elseif Config.NotificationType == "ox_lib" then
        if type == "info" then
            lib.notify({
                title = title,
                description = text,
                type = "inform"
            })
        elseif type == "error" then
            lib.notify({
                title = title,
                description = text,
                type = "error"
            })
        elseif type == "success" then
            lib.notify({
                title = title,
                description = text,
                type = "success"
            })
        end
    elseif Config.NotificationType == "qbcore" then
        if type == "success" then
            QBCore.Functions.Notify(text, "success")
        elseif type == "info" then
            QBCore.Functions.Notify(text, "primary")
        elseif type == "error" then
            QBCore.Functions.Notify(text, "error")
        end
    elseif Config.NotificationType == "custom" then
        print("add your notification system! in cl_Utils.lua")
        -- ADD YOUR NOTIFICATION | TYPES ARE info, error, success
    end
end

ProgressBar = function(duration, label)
    if Config.Progress == "ox_lib_square" then
        lib.progressBar({
            duration = duration,
            label = label,
            useWhileDead = false,
            canCancel = false
        })
    elseif Config.Progress == "ox_lib_circle" then
        lib.progressCircle({
            duration = duration,
            position = 'bottom',
            label = label,
            useWhileDead = false,
            canCancel = false
        })
    elseif Config.Progress == "qbcore" then
        QBCore.Functions.Progressbar(label, label, duration - 500, false, true, {
        }, {}, {}, {}, function()
        end)
        Wait(duration)
    elseif Config.Progress == "progressBars" then
        exports['progressBars']:startUI(duration, label)
        Wait(duration)
    end
end

Action = function(data)
    if Config.Framework == "ESX" then
        if data.status == "drunk" then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
            local playerPed = cache.ped
            DoScreenFadeOut(800)
            Wait(1000)
            RequestAnimSet("move_m@drunk@slightlydrunk")
            while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
                Wait(0)
            end
            SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
            SetTimecycleModifier("spectator5")
            SetPedMotionBlur(playerPed, true)
            SetPedIsDrunk(playerPed, true)
            DoScreenFadeIn(800)
            Wait(math.random(20000, 50000))
            DoScreenFadeOut(800)
            Wait(1000)
            ClearTimecycleModifier()
            ResetScenarioTypesEnabled()
            ResetPedMovementClipset(playerPed, 0)
            SetPedIsDrunk(playerPed, false)
            SetPedMotionBlur(playerPed, false)
            DoScreenFadeIn(800)
        else
            TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata[data.status] + data.add / 1000)
            --TriggerServerEvent("drc-consumables:server:add", data.status, data.add)
        end
    elseif Config.Framework == "qbcore" then
        if data.status == "drunk" then
            TriggerEvent("evidence:client:SetStatus", "alcohol", 200)
            local playerPed = cache.ped
            DoScreenFadeOut(800)
            Wait(1000)
            RequestAnimSet("move_m@drunk@slightlydrunk")
            while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
                Wait(0)
            end
            SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
            SetTimecycleModifier("spectator5")
            SetPedMotionBlur(playerPed, true)
            SetPedIsDrunk(playerPed, true)
            DoScreenFadeIn(800)
            Wait(math.random(20000, 50000))
            DoScreenFadeOut(800)
            Wait(1000)
            ClearTimecycleModifier()
            ResetScenarioTypesEnabled()
            ResetPedMovementClipset(playerPed, 0)
            SetPedIsDrunk(playerPed, false)
            SetPedMotionBlur(playerPed, false)
            DoScreenFadeIn(800)
        else
            TriggerServerEvent("drc-consumables:server:add", data.status,
                QBCore.Functions.GetPlayerData().metadata[data.status] + data.add / 10000)
        end
    end
end

--BossMenu
OpenBossMenu = function()
    if Config.BossMenu == "esx_society" then
        TriggerEvent('esx_society:openBossMenu', "uwu", function(data, menu)
            menu.close()
        end, { wash = false })
    elseif Config.BossMenu == "qb-management" then
        TriggerEvent("qb-bossmenu:client:OpenMenu")
    end
end

Target = function()
    if Config.Target == "qtarget" then
        return exports['qtarget']
    end
    if Config.Target == "qb-target" then
        return exports['qb-target']
    end
    if Config.Target == "ox_target" then
        return exports['qtarget']
    end
end

OpenStash = function(stash)
    if Config.Inventory == "qb" then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stash)
        TriggerEvent("inventory:client:SetCurrentStash", stash)
    elseif Config.Inventory == "ox" then
        exports.ox_inventory:openInventory('stash', stash)
    elseif Config.Inventory == "quasar" then
        TriggerServerEvent("inventory:server:OpenInventory", "stash", stash)
        TriggerEvent("inventory:client:SetCurrentStash", stash)
    elseif Config.Inventory == "chezza" then
        TriggerEvent('inventory:openStorage', "Stash", "stash"..stash, 100, 1000, nil)
    end
end

OpenCloakRoomMenu = function()
    lib.registerContext({
        id = 'uwu_cloakroom',
        title = 'CloakRoom',
        options = {
            ['Outfits'] = {
                arrow = false,
                event = 'drc_uwu:outfits'
            },
            ['Put on job outfit'] = {
                arrow = false,
                event = 'drc_uwu:joboutfit'
            }
        }
    })
    lib.showContext('uwu_cloakroom')
end
RegisterNetEvent("drc_uwu:joboutfit", function()
    if Config.Clothing == "qb-clothing" then
        if GetEntityModel(cache.ped) == `mp_m_freemode_01` then
			local Male = {
				outfitData = {
					["pants"]       = { item = 22, texture = 0},
					["arms"]        = { item = 6, texture = 0},  
					["t-shirt"]     = { item = 22, texture = 1},  
					["torso2"]      = { item = 11, texture = 7}, 
					["shoes"]       = { item = 21, texture = 9},  
                    ["chain"]         = { item = 20, texture = 2},  
				},
			}
			TriggerEvent('qb-clothing:client:loadOutfit', Male)
		else
			local Female = {
				outfitData = {
					["pants"]       = { item = 36, texture = 3},  
					["arms"]        = { item = 9, texture = 0},  
					["t-shirt"]     = { item = 185, texture = 0},  
					["vest"]        = { item = 0, texture = 0},  
					["torso2"]      = { item = 334, texture = 2}, 
					["shoes"]       = { item = 42, texture = 8}, 
                    ["chain"]         = { item = 23, texture = 0}, 
				},
			}
			TriggerEvent('qb-clothing:client:loadOutfit', Female)
		end
    end
    
    if Config.Clothing == "ox_appearance" or Config.Clothing == "fivem-appearance" then
        if GetEntityModel(cache.ped) == `mp_m_freemode_01` then
            arms = {component_id = 3, texture = 0, drawable = 6}
            torso = {component_id = 11, texture = 7, drawable = 11}
            undershirt = {component_id = 8, texture = 1, drawable = 22}
            pants = {component_id = 4, texture = 0, drawable = 22}
            shoes = {component_id = 6, texture = 9, drawable = 21}
            accesories = {component_id = 7, texture = 2, drawable = 20}
            exports['fivem-appearance']:setPedComponents(cache.ped, {torso, undershirt, pants, shoes, accesories, arms})
        else
            arms = {component_id = 3, texture = 0, drawable = 9}
            torso = {component_id = 11, texture = 2, drawable = 334}
            undershirt = {component_id = 8, texture = 0, drawable = 185}
            pants = {component_id = 4, texture = 3, drawable = 36}
            shoes = {component_id = 6, texture = 8, drawable = 42}
            bag = {component_id = 5, texture = 0, drawable = 0}
            accesories = {component_id = 7, texture = 0, drawable = 0}
            kevlar = {component_id = 9, texture = 0, drawable = 0}
            badge = {component_id = 10, texture = 0, drawable = 0}
            hat = {component_id = 0, texture = 0, drawable = 0}
            exports['fivem-appearance']:setPedComponents(cache.ped, {torso, undershirt, pants, shoes, bag, accesories, kevlar, badge, arms})
        end
    end
    if Config.Clothing == "esx_skin" then
        TriggerEvent('skinchanger:getSkin', function(skin)
        if GetEntityModel(cache.ped) == `mp_m_freemode_01` then
                TriggerEvent('skinchanger:loadSkin', {
                    tshirt_1 = 22,
                    tshirt_2 = 1,
                    arms     = 6,
                    torso_1  = 11,
                    torso_2  = 7,
                    pants_1  = 22,
                    pants_2  = 0,
                    shoes_1 = 11,
                    shoes_2 = 9,
                    chain_1 = 20,
                    chain_2 = 2,
                })
            else
                TriggerEvent('skinchanger:loadSkin', {
                    sex = 1,
                    tshirt_1 = 185,
                    tshirt_2 = 0,
                    arms = 9,
                    torso_1 = 334,
                    torso_2 = 2,
                    pants_1 = 36,
                    pants_2 = 3,
                    shoes_1 = 42,
                    shoes_2 = 8,
                })
            end
        end)
    end
end)
RegisterNetEvent("drc_uwu:outfits", function()
    if Config.Clothing == "esx_skin" then
        ESX.TriggerServerCallback('drc_uwu:getPlayerDressing', function(dressing)
            local elements = {}

            for i = 1, #dressing, 1 do
                table.insert(elements, {
                    label = dressing[i],
                    value = i
                })
            end

            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing', {
                title    = locale("CloakRoom"),
                align    = 'top-left',
                elements = elements
            }, function(data, menu)
                TriggerEvent('skinchanger:getSkin', function(skin)
                    ESX.TriggerServerCallback('drc_uwu:getPlayerOutfit', function(clothes)
                        TriggerEvent('skinchanger:loadClothes', skin, clothes)
                        TriggerEvent('esx_skin:setLastSkin', skin)

                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerEvent('esx_skin:save', skin)
                        end)
                    end, data.current.value)
                end)
            end, function(data, menu)
                menu.close()
            end)
        end)
    elseif Config.Clothing == "ox_appearance" then
        TriggerEvent("ox_appearance:wardrobe")
    elseif Config.Clothing == "fivem-appearance" then
        TriggerEvent("fivem-appearance:clothingShop")
    elseif Config.Clothing == "qb-clothing" then
        TriggerServerEvent("InteractSound_SV:PlayOnSource", "Clothes1", 0.4)
        TriggerEvent('qb-clothing:client:openOutfitMenu')
    end
end)
--Config.Blips creating
CreateThread(function()
    for _, v in pairs(Config.Blips) do
        local blip = AddBlipForCoord(v.BlipCoords)
        SetBlipSprite(blip, v.Sprite)
        SetBlipDisplay(blip, v.Display)
        SetBlipScale(blip, v.Scale)
        SetBlipColour(blip, v.Colour)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(v.Name)
        EndTextCommandSetBlipName(blip)
    end
end)

--job Blips
CreateThread(function()
    while not GetJob() do
        Wait(1000)
    end
    if GetJob() == Config.JobName and not ShopBlips then
        for _, v in pairs(Config.JobBlips) do
            local ShopBlips = AddBlipForCoord(v.BlipCoords)
            SetBlipSprite(ShopBlips, v.Sprite)
            SetBlipDisplay(ShopBlips, v.Display)
            SetBlipScale(ShopBlips, v.Scale)
            SetBlipColour(ShopBlips, v.Colour)
            SetBlipAsShortRange(ShopBlips, true)

            BeginTextCommandSetBlipName('STRING')
            AddTextComponentSubstringPlayerName(v.Name)
            EndTextCommandSetBlipName(ShopBlips)
        end
    end
end)

--Get Player job
function GetJob()
    if Config.Framework == "ESX" then
        if ESX.GetPlayerData().job then
            return ESX.GetPlayerData().job.name
        else
            return false
        end
    elseif Config.Framework == "qbcore" then
        if QBCore.Functions.GetPlayerData().job then
            return QBCore.Functions.GetPlayerData().job.name
        else
            return false
        end
    end
end

SpawnVehicle = function(model, coords, heading, livery)
    if Config.Framework == "ESX" then
        ESX.Game.SpawnVehicle(model, coords, heading, function(vehicle)
            SetEntityHeading(vehicle, heading)
            SetVehicleLivery(vehicle, livery)
        end)
    elseif Config.Framework == "qbcore" then
        QBCore.Functions.SpawnVehicle(model, function(vehicle)
            SetEntityHeading(vehicle, heading)
            SetVehicleLivery(vehicle, livery)
            TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(vehicle))
        end, coords, true)
    elseif Config.Framework == "standalone" then
        -- ADD YOU FRAMEWORK
    end
end

function SpawnObjects()
    CreateThread(function()
        IceMachine = CreateObject(`prop_bar_ice_01`, -589.35, -1068.52, 21.34, - 1.0, false, false,false)
        SetEntityHeading(IceMachine, 178.3965 + 0)
        FreezeEntityPosition(IceMachine, true)
    end)
    CreateThread(function()
        AlertButton = CreateObject(`hei_prop_bank_alarm_01`, -587.18, -1061.01, 22.878, - 1.0, false, false,false)
        SetEntityHeading(AlertButton, 88.66 + 0)
        FreezeEntityPosition(AlertButton, true)
    end)
    CreateThread(function()
        Phone = CreateObject(`v_res_fa_phone`, -588.1, -1054.34, 22.01, - 2.0, false, false,false)
        SetEntityHeading(Phone, 359.1)
        FreezeEntityPosition(Phone, true)
    end)
end

function CreateCat(model, coords)
    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(100)
    end
	local ped = CreatePed(0, model, coords.x, coords.y, coords.z-1.02, coords.w, false, false)
	SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
    return ped
end

function DeleteObjects()
    DeleteEntity(IceMachine)
end

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        DeleteObjects()
    end
end)

GetClosestCar = function(coords)
    if Config.Framework == "ESX" then
        return ESX.Game.GetClosestVehicle(coords)
    elseif Config.Framework == "qbcore" then
        return QBCore.Functions.GetClosestVehicle()
    elseif Config.Framework == "standalone" then
        -- ADD YOU FRAMEWORK
    end
end

Dispatch = function(coords)
    if Config.Dispatch.enabled then
        if Config.Dispatch.script == "cd_dispatch" then
            local data = exports['cd_dispatch']:GetPlayerInfo()
            TriggerServerEvent('cd_dispatch:AddNotification', {
                job_table = Config.PoliceJobs,
                coords = coords,
                title = "10-18 - Trespassing",
                message = "Trespassing reported in uwu cafe by citizen",
                flash = 0,
                unique_id = tostring(math.random(0000000, 9999999)),
                blip = {
                    sprite = sprite,
                    scale = 1.2,
                    colour = 3,
                    flashes = false,
                    text = text,
                    time = (5 * 60 * 1000),
                    sound = 1,
                }
            })
        elseif Config.Dispatch.script == "linden_outlawalert" then
            local data = { displayCode = "10-18", description = "Trespassing", isImportant = 1,
                recipientList = Config.PoliceJobs,
                length = '10000', infoM = 'fa-info-circle', info = "Trespassing reported in uwu cafe by citizen" }
            local dispatchData = { dispatchData = data, caller = 'citizen', coords = coords }
            TriggerServerEvent('wf-alerts:svNotify', dispatchData)
        elseif Config.Dispatch.script == "ps-disptach" then
            exports['ps-dispatch']:SuspiciousActivity()
        elseif Config.Dispatch.script == "custom" then
            print("add your dispatch system! in cl_Utils.lua")
        end
    end
end


ReduceStressFromCats = function()
    if Config.ReduceStress then
        if Config.Framework == "ESX" then
            amount = math.random(20000, 50000)
            TriggerServerEvent("drc-consumables:server:reduce", amount)
        elseif Config.Framework == "qbcore" then
            TriggerServerEvent('hud:server:RelieveStress', 5)
        elseif Config.Framework == "standalone" then
            -- ADD YOU FRAMEWORK
        end
    end
end

CompleteYoga = function()
    -- here add your code for Yoga completion
    if Config.ReduceStress then
        if Config.Framework == "ESX" then
            amount = math.random(10000, 50000)
            TriggerServerEvent("drc-consumables:server:reduce", amount)
        elseif Config.Framework == "qbcore" then
            TriggerServerEvent('hud:server:RelieveStress', 5)
        elseif Config.Framework == "standalone" then
            -- ADD YOU FRAMEWORK
        end
    end
end

WarmComplete = function()
    -- here add your code for Yoga completion
    if Config.ReduceStress then
        if Config.Framework == "ESX" then
            amount = math.random(10000, 20000)
            TriggerServerEvent("drc-consumables:server:reduce", amount)
        elseif Config.Framework == "qbcore" then
            TriggerServerEvent('hud:server:RelieveStress', 5)
        elseif Config.Framework == "standalone" then
            -- ADD YOU FRAMEWORK
        end
    end
end