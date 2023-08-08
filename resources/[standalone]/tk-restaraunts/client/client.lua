local QBCore = exports['qb-core']:GetCoreObject()
PlayerJob = {}
local CalledIngredients = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        PlayerGang = PlayerData.gang
    end) 
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
    PlayerGang = GangInfo
end)

AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        PlayerGang = PlayerData.gang
        onDuty = PlayerJob.onduty
    end)
end)

CreateThread(function()
	for _, loc in pairs(Config.Locations) do
		-- Base Variables
		local job, gang, bossroles, gangroles = nil, nil, {}, {}
        if loc.JobName then --Grab Boss role from the qb-core jobs.lua to make bossmenu accessible
            job = (loc.JobName or nil)
            for grade in pairs(QBCore.Shared.Jobs[job].grades) do
                if QBCore.Shared.Jobs[job].grades[grade].isboss then
                    if bossroles[job] then
                        if bossroles[job] > tonumber(grade) then bossroles[job] = tonumber(grade) end
                    else bossroles[job] = tonumber(grade) end
                end
            end
        elseif loc.gang then --Grab Boss role from the qb-core gangs.lua to make gangmenu accessible
            gang = (loc.gang or nil)
            for grade in pairs(QBCore.Shared.Gangs[gang].grades) do
                if QBCore.Shared.Gangs[gang].grades[grade].isboss then
                    if gangroles[gang] then
                        if gangroles[gang] > tonumber(grade) then gangroles[gang] = tonumber(grade) end
                    else gangroles[gang] = tonumber(grade)	end
                end
            end
        end
        if loc.DutyLocations then
            for k, v in pairs(loc.DutyLocations) do
                name = loc.label.."Clockin"..k

                local options = {}
                if gang then
                    options[#options+1] = { event = "qb-gangmenu:client:OpenMenu", icon = "fas fa-list", label = Loc[Config.Lan].target["gang_menu"], gang = gangroles }
                else
                    options[#options+1] = { type = "server", event = "QBCore:ToggleDuty", targeticon = 'fas fa-clipboard-list', icon = "fas fa-circle", label = "Go On/Off Duty", job = job, }
                end
                exports['qb-target']:AddBoxZone(name, v, 1, 1, { name=name, heading = v.w, debugPoly= Config.Debug, minZ= v.z - 1, maxZ= v.z + 2 },
                    { options = options, distance = 2.0 })

            end
        end

        if loc.WashHandsLocations then
            for k, v in pairs(loc.WashHandsLocations) do
                name = loc.label.."HandWash"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, { name=name, heading = v.w, debugPoly=Config.Debug, minZ= v.z - 1, maxZ= v.z + 2 },
                        { options = { { event = "tk-rc:client:washhands", targeticon = 'fas fa-soap', icon = "fas fa-circle", label = "Wash Hands"}, }, distance = 1.5 })
            end
        end

        if loc.Storage then
            for k, v in pairs(loc.Storage) do
                name = loc.label.."Storage"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, { name=name, heading = v.w, debugPoly=Config.Debug, minZ= v.z - 1, maxZ= v.z + 2 },
                    { 
                        options = {
                            {
                                type = "client",
                                action = function()
                                    TriggerEvent('tk-rc:client:OpenStorage',loc.label.."Storage",k)
                                end,
                                targeticon = 'fas fa-box',
                                icon = 'fas fa-circle',
                                label = "Open Storage",
                                job = loc.JobName
                            },
                            {
                                type = "client",
                                action = function()
                                    TriggerEvent('tk-rc:unloadPallete',loc.PalleteItem,loc.Items)
                                end,
                                event = "tk-rc:unloadPallete",
                                icon = 'fas fa-box',
                                label = "Unload Pallete",
                                job = loc.JobName
                            },
                        },
                    })
            end
        end

        if loc.Tables then
            for k, v in pairs(loc.Tables) do
                name = loc.label.."Tables"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, { name=name, heading = v.w, debugPoly=Config.Debug, minZ= v.z - 1, maxZ= v.z + 2 },
                    { 
                        options = {
                            {
                                type = "client",
                                action = function()
                                    TriggerEvent('tk-rc:client:OpenStorage',loc.label.."Table",k)
                                end,
                                targeticon = 'fas fa-box',
                                icon = 'fas fa-circle',
                                label = "Open Table",
                            },
                        },
                    })
            end
        end

        if loc.TrayLocations then
            for k, v in pairs(loc.TrayLocations) do
                name = loc.label.."TrayLocations"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, { name=name, heading = v.w, debugPoly=Config.Debug, minZ= v.z - 1, maxZ= v.z + 2 },
                    { 
                        options = {
                            {
                                type = "client",
                                action = function()
                                    TriggerEvent('tk-rc:client:OpenStorage',loc.label.."TrayLocations",k)
                                end,
                                targeticon = 'fas fa-search',
                                icon = 'fas fa-circle',
                                label = "Open Tray",
                            },
                        },
                    })
            end
        end

        if loc.IceMakers then
            for k, v in pairs(loc.IceMakers) do
                name = loc.label.."IceMakers"..k
                exports['qb-target']:AddBoxZone(name, v, 0.7, 1, {
                    name = name,
                    heading = v.w,
                    debugPoly = Config.Debug,
                    minZ = v.z - 1,
                    maxZ = v.z + 1,
                    }, {
                    options = {
                        {
                            type = "client",
                            event = "tk-rc:menu:OpenMenu",
                            targeticon = 'fas fa-icicles',
                            icon = 'fas fa-circle',
                            label = "Open Ice Box",
                            craftable = loc.CraftingMenus["Icebox"],
                            header = "Ice Box",
                            location = loc,
                            coords = v,
                            job = loc.JobName
                        },
                    },
                    distance = 3.0
                })
            end
        end

        if loc.Taps then
            for k, v in pairs(loc.Taps) do
                name = loc.label.."Taps"..k
                exports['qb-target']:AddBoxZone(name, v, 0.5, 0.5, {
                    name = name,
                    heading = v.w,
                    debugPoly = Config.Debug,
                    minZ = v.z - 1,
                    maxZ = v.z + 1,
                    }, {
                    options = {
                        {
                            type = "client",
                            event = "tk-rc:menu:OpenMenu",
                            targeticon = 'fas fa-icicles',
                            icon = 'fas fa-circle',
                            label = "Open Tap",
                            craftable = loc.CraftingMenus["Tap"],
                            header = "Tap",
                            location = loc,
                            coords = v,
                            job = loc.JobName
                        },
                    },
                    distance = 3.0
                })
            end
        end

        if loc.Fridges then
            for k, v in pairs(loc.Fridges) do
                name = loc.label.."Fridges"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, {
                    name = name,
                    heading = v.w,
                    debugPoly = Config.Debug,
                    minZ = v.z - 1,
                    maxZ = v.z + 1,
                    }, {
                    options = {
                        {
                            type = "client",
                            action = function()
                                TriggerEvent('tk-rc:client:OpenStorage',loc.label.."Fridges",k)
                            end,
                            targeticon = 'fas fa-box',
                            icon = 'fas fa-circle',
                            label = "Use Fridge",
                            job = loc.JobName
                        },
                    },
                    distance = 3.0
                })
            end
        end

        if loc.BarLocations then
            for k, v in pairs(loc.BarLocations) do
                name = loc.label.."BarLocations"..k
                exports['qb-target']:AddBoxZone(name, v, 0.7, 3, {
                    name = name,
                    heading = v.w,
                    debugPoly = Config.Debug,
                    minZ = v.z - 1,
                    maxZ = v.z + 2,
                    }, {
                    options = {
                        {
                            type = "client",
                            action = function()
                                TriggerEvent('tk-rc:client:OpenStorage',loc.label.."Bar",k)
                            end,
                            targeticon = 'fas fa-box',
                            icon = 'fas fa-circle',
                            label = "Grab Drinks",
                            job = loc.JobName
                        },
                        {
                            type = "client",
                            event = "tk-rc:menu:OpenMenu",
                            targeticon = 'fas fa-wine-glass',
                            icon = 'fas fa-circle',
                            label = "Make Drinks",
                            craftable = loc.CraftingMenus["Bar"],
                            header = "Bar",
                            location = loc,
                            coords = v,
                            job = loc.JobName
                        },
                    },
                    distance = 3.0
                })
            end
        end

        if loc.WarehouseLocation then
            name = loc.label.."WarehouseLocation"
            exports['qb-target']:AddBoxZone(name, loc.WarehouseLocation, 1, 5, {
                name = name,
                heading = loc.WarehouseLocation.w,
                debugPoly = Config.Debug,
                minZ = loc.WarehouseLocation.z - 1,
                maxZ = loc.WarehouseLocation.z + 2.5,
                }, {
                options = {
                    {
                        type = "client",
                        action = function()
                            TriggerEvent("tk-rc:client:warehouse",loc.PalleteItem,loc.Storage[1])
                        end,
                        targeticon = 'fas fa-box',
                        icon = 'fas fa-circle',
                        label = "Retrieve Order",
                        job = loc.JobName
                    },
                },
                distance = 3.0
            })
        end

        if loc.OvenLocations then
            for k, v in pairs(loc.OvenLocations) do
                name = loc.label.."OvenLocations"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, {
                    name = name,
                    heading = v.w,
                    debugPoly = Config.Debug,
                    minZ = v.z - 1,
                    maxZ = v.z + 2,
                    }, {
                    options = {
                        {
                            type = "client",
                            event = "tk-rc:menu:OpenMenu",
                            targeticon = 'fas fa-fire',
                            icon = 'fas fa-circle',
                            label = "Use Oven",
                            craftable = loc.CraftingMenus["Oven"],
                            header = "Oven",
                            location = loc,
                            coords = v,
                            job = loc.JobName
                        },
                    },
                    distance = 3.0
                })
            end
        end

        if loc.FryerLocations then
            for k, v in pairs(loc.FryerLocations) do
                name = loc.label.."FryerLocations"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, {
                    name = name,
                    heading = v.w,
                    debugPoly = Config.Debug,
                    minZ = v.z - 1,
                    maxZ = v.z + 2,
                    }, {
                    options = {
                        {
                            type = "client",
                            event = "tk-rc:menu:OpenMenu",
                            targeticon = 'fas fa-fire',
                            icon = 'fas fa-circle',
                            label = "Use Fryer",
                            craftable = loc.CraftingMenus["Fryer"],
                            header = "Fryer",
                            location = loc,
                            coords = v,
                            job = loc.JobName
                        },
                    },
                    distance = 3.0
                })
            end
        end

        if loc.CuttingBoardLocations then
            for k, v in pairs(loc.CuttingBoardLocations) do
                name = loc.label.."CuttingBoardLocations"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, {
                    name = name,
                    heading = v.w,
                    debugPoly = Config.Debug,
                    minZ = v.z - 1,
                    maxZ = v.z + 2,
                    }, {
                    options = {
                        {
                            type = "client",
                            event = "tk-rc:menu:OpenMenu",
                            targeticon = 'fas fa-shop',
                            icon = 'fas fa-circle',
                            label = "Use Cutting Board",
                            craftable = loc.CraftingMenus["CuttingBoard"],
                            header = "Cutting Board",
                            location = loc,
                            coords = v,
                            job = loc.JobName
                        },
                    },
                    distance = 3.0
                })
            end
        end

        if loc.CoffeeMachineLocations then
            for k, v in pairs(loc.CoffeeMachineLocations) do
                name = loc.label.."CoffeeMachineLocations"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, {
                    name = name,
                    heading = v.w,
                    debugPoly = Config.Debug,
                    minZ = v.z - 1,
                    maxZ = v.z + 2,
                    }, {
                    options = {
                        {
                            type = "client",
                            event = "tk-rc:menu:OpenMenu",
                            targeticon = 'fas fa-mug-hot',
                            icon = 'fas fa-circle',
                            label = "Use Coffee Machine",
                            craftable = loc.CraftingMenus["CoffeeMachine"],
                            header = "Coffee Machine",
                            location = loc,
                            coords = v,
                            job = loc.JobName
                        },
                    },
                    distance = 3.0
                })
            end
        end

        if loc.BlenderLocations then
            for k, v in pairs(loc.BlenderLocations) do
                name = loc.label.."BlenderLocations"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, {
                    name = name,
                    heading = v.w,
                    debugPoly = Config.Debug,
                    minZ = v.z - 1,
                    maxZ = v.z + 2,
                    }, {
                    options = {
                        {
                            type = "client",
                            event = "tk-rc:menu:OpenMenu",
                            targeticon = 'fas fa-blender',
                            icon = 'fas fa-circle',
                            label = "Use Blender",
                            craftable = loc.CraftingMenus["Blender"],
                            header = "Blender",
                            location = loc,
                            coords = v,
                            job = loc.JobName
                        },
                    },
                    distance = 3.0
                })
            end
        end

        if loc.SodaMachineLocations then
            for k, v in pairs(loc.SodaMachineLocations) do
                name = loc.label.."SodaMachineLocations"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, {
                    name = name,
                    heading = v.w,
                    debugPoly = Config.Debug,
                    minZ = v.z - 1,
                    maxZ = v.z + 2,
                    }, {
                    options = {
                        {
                            type = "client",
                            event = "tk-rc:menu:OpenMenu",
                            targeticon = 'fas fa-fire',
                            icon = 'fas fa-circle',
                            label = "Use Soda Machine",
                            craftable = loc.CraftingMenus["Soda"],
                            header = "Soda Machine",
                            location = loc,
                            coords = v,
                            job = loc.JobName
                        },
                    },
                    distance = 3.0
                })
            end
        end

        if loc.PrepLocations then
            for k, v in pairs(loc.SodaMachineLocations) do
                name = loc.label.."PrepLocations"..k
                exports['qb-target']:AddBoxZone(name, v, 1, 1, {
                    name = name,
                    heading = v.w,
                    debugPoly = Config.Debug,
                    minZ = v.z - 1,
                    maxZ = v.z + 2,
                    }, {
                    options = {
                        {
                            type = "client",
                            event = "tk-rc:menu:OpenMenu",
                            targeticon = 'fas fa-fire',
                            icon = 'fas fa-circle',
                            label = "Prepare Food",
                            craftable = loc.CraftingMenus["Prep"],
                            header = "Prep",
                            location = loc,
                            coords = v,
                            job = loc.JobName
                        },
                    },
                    distance = 3.0
                })
            end
        end

        if loc.BossComputerLocation then
            name = loc.label.."BossComputerLocation"
            exports['qb-target']:AddBoxZone(name, loc.BossComputerLocation, 1, 1, {
                name = name,
                heading = loc.BossComputerLocation.w,
                debugPoly = Config.Debug,
                minZ = loc.BossComputerLocation.z - 1,
                maxZ = loc.BossComputerLocation.z + 2,
                }, {
                options = {
                    {   type = "client",
                        event = "qb-bossmenu:client:OpenMenu",
                        icon = "fas fa-list",
                        label = "Open Boss Menu",
                        job = bossroles
                    },
                    {
                        type = "client",
                        action = function()
                            TriggerEvent("tk-rc:client:getStock",loc.JobName,loc.BossGradeLevel,loc.WarehouseLocation,loc.StockPrice)
                        end,
                        icon = 'fas fa-box',
                        label = "Order Ingredients",
                        job = loc.JobName
                    },
                },
                distance = 3.0
            })
        end
	end
end)

--Events

RegisterNetEvent('tk-rc:client:washhands')
AddEventHandler('tk-rc:client:washhands', function(coords)
    QBCore.Functions.Progressbar('washing_hands', 'Washing Hands..', 5000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = false,
    }, {
        animDict = "mp_arresting",
        anim = "a_uncuff",
        flags = 8,
    }, {}, {}, function() -- Done
        WashedHands = true
        QBCore.Functions.Notify('Washed Hands', 'success')
    end, function()
        TriggerEvent('inventory:client:busy:status', false)
        QBCore.Functions.Notify('Cancelled', 'error')
        
    end,"fas fa-hand-holding-water")
end)

RegisterNetEvent('tk-rc:client:OpenStorage')
AddEventHandler('tk-rc:client:OpenStorage', function(name,index)
    TriggerEvent("inventory:client:SetCurrentStash", name..index)
    TriggerServerEvent("inventory:server:OpenInventory", "stash", name..index, {
        maxweight = 4000,
        slots = 30,
    })
end)

RegisterNetEvent('tk-rc:client:getStock')
AddEventHandler('tk-rc:client:getStock', function(job,level,warehouselocation,stockprice)
    if QBCore.Functions.GetPlayerData().job.grade.level == level then
        QBCore.Functions.TriggerCallback('tk-rc:takeManagementFunds', function(haspaid)
            if haspaid then
                SetNewWaypoint(warehouselocation)
                CalledIngredients = true
            end
        end,job,stockprice)
    else
        QBCore.Functions.Notify("You are Not an Owner", "error")
    end
end)

RegisterNetEvent('tk-rc:unloadPallete', function(pallete_item,items)
    local HasItem = HasItem(pallete_item, 1)
        if HasItem then
            print("Gave Items")
            TriggerEvent('tk-rc:items',pallete_item,items)
        else
            QBCore.Functions.Notify('You don\'t have any crates.', 'error')
        end
end)

RegisterNetEvent('tk-rc:items', function(pallete_item,items)
    local HasItem = HasItem(pallete_item, 1)
    if HasItem then
        TriggerServerEvent('tk-rc:server:toggleItem',false,pallete_item,1)
        for k, v in pairs(items) do
            TriggerServerEvent('tk-rc:server:toggleItem',true,v.name,v.amount)
        end
        QBCore.Functions.Notify('Ingredients have been unpacked!', 'success')
    end
end)

RegisterNetEvent('tk-rc:client:warehouse', function(pallete_item,storagelocation)
    if CalledIngredients then
        TriggerServerEvent('tk-rc:server:toggleItem',true,pallete_item,1)
        QBCore.Functions.Notify('Deliver the ingredients back to the Bar', 'success')
        SetNewWaypoint(storagelocation)
        CalledIngredients = false
    else
        QBCore.Functions.Notify('You didnt call the warehouse first..', 'error')
    end
end)

RegisterNetEvent('tk-rc:Client:MakeItem', function(data)
	local bartext = ""
	for i = 1, #data.location.CraftingMenus["Icebox"] do
		for k, v in pairs(data.location.CraftingMenus["Icebox"][i]) do
			if data.item == k then
				bartext = "Pouring"
				bartime = 3000
				animDictNow = "mp_ped_interaction"
				animNow = "handshake_guy_a"
			end
		end
	end
    for i = 1, #data.location.CraftingMenus["Oven"] do
		for k, v in pairs(data.location.CraftingMenus["Oven"][i]) do
			if data.item == k then
				bartext = "Baking "
				bartime = 6000
				animDictNow = "anim@heists@prison_heiststation@cop_reactions"
				animNow = "cop_b_idle"
			end
		end
	end
    for i = 1, #data.location.CraftingMenus["CuttingBoard"] do
		for k, v in pairs(data.location.CraftingMenus["CuttingBoard"][i]) do
			if data.item == k then
				bartext = "Making "
				bartime = 4000
				animDictNow = "mp_arresting"
				animNow = "a_uncuff"
			end
		end
	end
    for i = 1, #data.location.CraftingMenus["Prep"] do
		for k, v in pairs(data.location.CraftingMenus["Prep"][i]) do
			if data.item == k then
				bartext = "Preparing "
				bartime = 4000
				animDictNow = "anim@heists@prison_heiststation@cop_reactions"
				animNow = "cop_b_idle"
			end
		end
	end
    for i = 1, #data.location.CraftingMenus["Blender"] do
		for k, v in pairs(data.location.CraftingMenus["Blender"][i]) do
			if data.item == k then
				bartext = "Blending "
				bartime = 4000
				animDictNow = "mp_ped_interaction"
				animNow = "handshake_guy_a"
			end
		end
	end
    for i = 1, #data.location.CraftingMenus["CoffeeMachine"] do
		for k, v in pairs(data.location.CraftingMenus["CoffeeMachine"][i]) do
			if data.item == k then
				bartext = "Pouring "
				bartime = 4000
				animDictNow = "mp_ped_interaction"
				animNow = "handshake_guy_a"
			end
		end
	end
    for i = 1, #data.location.CraftingMenus["Soda"] do
		for k, v in pairs(data.location.CraftingMenus["Soda"][i]) do
			if data.item == k then
				bartext = "Pouring "
				bartime = 4000
				animDictNow = "mp_ped_interaction"
				animNow = "handshake_guy_a"
			end
		end
	end
    for i = 1, #data.location.CraftingMenus["Fryer"] do
		for k, v in pairs(data.location.CraftingMenus["Fryer"][i]) do
			if data.item == k then
				bartext = "Pouring"
				bartime = 3000
				animDictNow = "mp_ped_interaction"
				animNow = "handshake_guy_a"
			end
		end
	end
	QBCore.Functions.Progressbar('making_food', bartext..QBCore.Shared.Items[data.item].label, bartime, false, true, { disableMovement = true, disableCarMovement = false, disableMouse = false, disableCombat = false, },
	{ animDict = "mp_ped_interaction", anim = "handshake_guy_a", flags = 8, },
	{}, {}, function()
		TriggerServerEvent('tk-rc:server:GetItem', data.item, data.craft)
		Wait(500)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
	end, data.item)
end)
