Config  = {}

if GetResourceState('es_extended') ~= 'missing' then 
    Config.Framework = "ESX"
elseif GetResourceState('qb-core') ~= 'missing' then 
    Config.Framework = "QB"
else
    print("[^3WARNING^7] NO COMPATIBLE FRAMEWORK FOUND")
end

if GetResourceState('ox_target') ~= 'missing' or GetResourceState('qtarget') ~= 'missing' then 
    Config.UseTargetExport = 'qtarget'
elseif GetResourceState('qb-target') ~= 'missing' then 
    Config.UseTargetExport = "qb-target"
else
    Config.UseTargetExport = false
    print("[^3WARNING^7] NO TARGET SCRIPT FOUND")
end

if GetResourceState('ox_lib') ~= 'missing' then 
    Config.ContextMenu = 'ox_lib'
elseif GetResourceState('esx_context') ~= 'missing' then 
    Config.ContextMenu = 'esx_context'
elseif GetResourceState('qb-menu') ~= 'missing' then 
    Config.ContextMenu = 'qb-menu'
else
    print("[^3WARNING^7] NO COMPATIBLE MENU SCRIPT FOUND")
end

if GetResourceState('ox_inventory') ~= 'missing' then 
    Config.inventory = 'ox_inventory'
elseif GetResourceState('qb-inventory') ~= 'missing' then 
    Config.inventory = 'qb-inventory'
elseif GetResourceState('chezza_inventory') ~= 'missing' then 
    Config.inventory = 'chezza_inventory'
elseif GetResourceState('core_inventory') ~= 'missing' then 
    Config.inventory = 'core_inventory'
elseif GetResourceState('qs-inventory') ~= 'missing' then 
    Config.inventory = 'qs-inventory'
else
    print("[^3WARNING^7] NO COMPATIBLE INVENTORY SCRIPT FOUND (Storages will not work)")
end

function SetLocales(lang)
    local newLocales = {}
    if languages[lang] then
        for k,v in pairs(languages['en']) do
            if languages[lang][k] then
                newLocales[k] = languages[lang][k]
            else
                newLocales[k] = v.." (translation missing) "..k
            end
        end
    else
        newLocales = languages['en']
        print("[^3WARNING^7] LANGUAGE '"..lang.."' NOT FOUND IN locales.lua FILE")
    end
    return newLocales
end

------------------------------------------------------------------------------------
---------------------- CONFIG ------------------------------------------------------
------------------------------------------------------------------------------------
Config.Locales = SetLocales('en')

Config.disableExplosiveOptionOnOwnedProp = true --- if true you will not be able to explode your own props

Config.UseProgressBar = true -- if false progressbar will not be used

Config.showTutorial = true --- show tutorial information when positioning a prop

Config.usingBlackout = true ---- if not using blackout the light will only function at night even if turned on

Config.usingOldInventoryMethod = false --------- set this true if you have storages created on the script versions before the Config.inventory existed, check "OnStorageOpen" function if you want to understand better what changed

Config.useRoutingBuckets = false --- if you want to have routing bucket working
Config.useRoutingBucketsThread = false --- go check the server unlocked part i would recomend using the trigger on the script who changes bucket, if you don't have that option this way works but is not ideal

Config.basesDrawDistance = 300.0 ---- not recomended to edit

Config.needCodeLockItem = "codelock" ---- here you can choose an item to be the code lock item, if you keep this as false code lock item will not be necessary 
Config.doorsLockedByDefault = true ---- when you put a door it will be locked to everyone except you and your friends
Config.storagesLockedByDefault = true ---- when you put a storage it will be locked to everyone except you and your friends

Config.propAlpha = 180

Config.poolSizeProtection = 2000 ------------ this is a protection against building in a masseive Ymap, will not let you build in a zone with more than 2000 props around you

Config.maxCrewMembers = 10 -------- limit of members per Crew (false if you don't want this limit)

Config.maxPropsPerIdentifier = 800 ---- limit of props per identifier (false if you don't want this limit)

Config.lightSensorDistance = 60.0 --------- minimum distance from the light for it to turn on (only for blackout mode)

Config.generatorRadius = 10.0 -------- radius of the generator 

Config.onlyOneBed = true ----- each player can only have one bed

Config.wrongCodesPerRestart = 10 ---- each player can only set the code wrong on doors and storages 10 times per server restart

Config.crewBypassCodeLock = false --- the crew members will need to set the code like everyone else

Config.ProgressBars = { 
    ["prop_upgrade"] = {
        duration = 5000,
        label = Config.Locales['prog_prop_upgrade'],
        animation = {
            task  = 'WORLD_HUMAN_HAMMERING'
        }
    },
    ["prop_repair"] = {
        duration = 5000,
        label = Config.Locales['prog_prop_repair'],
        animation = {
            task  = 'WORLD_HUMAN_HAMMERING'
        }
    },
    ["plant_c4"] = {
        duration = 7000,
        label = Config.Locales['prog_plant_c4'],
        animation = {
            animDict = 'anim@heists@ornate_bank@thermal_charge',
            anim = 'thermal_charge'
        }
    },
    ["health_regen_bed"] = {
        duration = 20000,
        label = Config.Locales['prog_health_regen_bed'],
        animation = {
            animDict = 'anim@mp_bedmid@left_var_02',
            anim = 'f_sleep_l_loop_bighouse'
        }
    },
    ["health_regen_sofa"] = {
        duration = 30000,
        label = Config.Locales['prog_health_regen_sofa'],
        animation = {
            animDict = 'anim@amb@business@cfid@cfid_desk_no_work_bgen_chair_no_work@',
            anim = 'noddingoff_sleep_lazyworker'
        }
    },
    ["prop_remove"] = {
        duration = 8000,
        label = Config.Locales['prog_prop_remove'],
        animation = {
            task  = "WORLD_HUMAN_HAMMERING"
        }
    },
    ["add_fuel"] = {
        duration = 8000,
        label = Config.Locales['prog_add_fuel'],
        animation = {
            animDict = 'amb@prop_human_bum_bin@base',
            anim = 'base'
        }
    },
    ["prop_build"] = {
        duration = 2000,
        label = Config.Locales['prog_prop_build'],
        animation = {
            task  = "WORLD_HUMAN_HAMMERING"
        }
    },
}

Config.explosionItems = {
    ["weapon_stickybomb"] = {
        damage = 7500.0, -- damage to the prop
        delay = 5 -- time to explode (seconds)
    },
    ["weapon_grenade"] = {
        damage = 4000.0,
        delay = 5
    },
} -- if you want to use items for raiding 

Config.weaponsDamage = {
    [`weapon_rpg`] = 20000.0
} -- if you want to use weapons for raiding you can use this, to choose the damage they give to props

Config.fuelItem = "gasoline"

Config.saveOnStopScriptOnly = false  ------ only saves props health on restart (i used the txadmin event to force save, but you can do it in other ways is all in the opensource) 

Config.disableBuildingBlips = {
    label = "No build Zones",
    color = 1,
    alpha = 128,
    scale = 1.0,
    sprite = 364,
    shortRange = true      
} ----------- if you don't want blips just do (Config.disableBuildingBlips = false)

Config.disableBuilding = {
    {coords = vector3(215.578, -1135.859, 29.29675),radius = 400.0}
} ----------- zones to disable building

Config.refreshTime = 300000 ------ ms (300000ms = 5min)
Config.refreshTimeLifeRemove = 2.5 ------ life removed every Config.refreshTime ms (FLOAT VALUE)
Config.refreshTimeFuelRemove = 1 ------ fuel removed every Config.refreshTime ms (if ON) (INT VALUE)

Config.claimPropType = {
    ["foundations"] = {radius = 9.0},
    ["bigwall"] = {radius = 9.0}
} ----- props that claim an area, if repaired they repair the all base

Config.deadStorage = GetHashKey("prop_money_bag_01") ------- if you change this you have to add it in the Config.Models

Config.Models = {
    --- doors
    ["model_door_wood"] = {
        item = "model_door_wood",
        life = 10000.0,
        type = "doors",
        subtype = "zrotate",
        upgrade = GetHashKey("model_door_stone"),
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["model_door_stone"] = {
        item = "model_door_stone",
        life = 15000.0,
        type = "doors",
        subtype = "zrotate",
        upgrade = GetHashKey("model_door_metal"),
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_door_metal"] = {
        item = "model_door_metal",
        life = 20000.0,
        type = "doors",
        subtype = "zrotate",
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },

    --- windows
    ["model_window_wood"] = {
        item = "model_window_wood",
        life = 10000.0,
        type = "windows",
        subtype = "zrotate",
        upgrade = GetHashKey("model_window_stone"),
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["model_window_stone"] = {
        item = "model_window_stone",
        life = 15000.0,
        type = "windows",
        subtype = "zrotate",
        upgrade = GetHashKey("model_window_metal"),
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_window_metal"] = {
        item = "model_window_metal",
        life = 20000.0,
        type = "windows",
        subtype = "zrotate",
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },

    --- stairs
    ["model_stairs_wood"] = {
        item = "model_stairs_wood",
        life = 10000.0,
        type = "walls",
        subtype = 'stairs',
        --upgrade = GetHashKey("model_windowway_stone"),
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["model_stairs_stone"] = {
        item = "model_stairs_stone",
        life = 15000.0,
        type = "walls",
        subtype = 'stairs',
        --upgrade = GetHashKey("model_windowway_stone"),
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_stairs_metal"] = {
        item = "model_stairs_metal",
        life = 20000.0,
        type = "walls",
        subtype = 'stairs',
        --upgrade = GetHashKey("model_windowway_stone"),
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },
    --- walls
    ["model_windowway_wood"] = {
        item = "model_windowway_wood",
        life = 10000.0,
        type = "walls",
        workAsPillar = true,
        subtype = "windowway",
        upgrade = GetHashKey("model_windowway_stone"),
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["model_windowway_stone"] = {
        item = "model_windowway_stone",
        life = 15000.0,
        type = "walls",
        workAsPillar = true,
        upgrade = GetHashKey("model_windowway_metal"),
        subtype = "windowway",
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_windowway_metal"] = {
        item = "model_windowway_metal",
        life = 20000.0,
        type = "walls",
        workAsPillar = true,
        subtype = "windowway",
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },

    ["model_wall_wood"] = {
        item = "model_wall_wood",
        life = 10000.0,
        type = "walls",
        workAsPillar = true,
        upgrade = GetHashKey("model_wall_stone"),
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["model_wall_stone"] = {
        item = "model_wall_stone",
        life = 15000.0,
        type = "walls",
        workAsPillar = true,
        upgrade = GetHashKey("model_wall_metal"),
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_wall_metal"] = {
        item = "model_wall_metal",
        life = 20000.0,
        type = "walls",
        workAsPillar = true,
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },

    --- small walls
    
    ["model_wall_wood_small"] = {
        item = "model_wall_wood_small",
        life = 10000.0,
        type = "walls",
        upgrade = GetHashKey("model_wall_stone_small"),
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["model_wall_stone_small"] = {
        item = "model_wall_stone_small",
        life = 15000.0,
        type = "walls",
        upgrade = GetHashKey("model_wall_metal_small"),
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_wall_metal_small"] = {
        item = "model_wall_metal_small",
        life = 20000.0,
        type = "walls",
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },

    --- roofs

    ["model_wall_wood_roof_triangle"] = {
        item = "model_wall_wood_roof_triangle",
        life = 10000.0,
        type = "walls",
        subtype = "roof",
        upgrade = GetHashKey("model_wall_stone_roof_triangle"),
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["model_wall_stone_roof_triangle"] = {
        item = "model_wall_stone_roof_triangle",
        life = 15000.0,
        type = "walls",
        subtype = "roof",
        upgrade = GetHashKey("model_wall_metal_roof_triangle"),
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_wall_metal_roof_triangle"] = {
        item = "model_wall_metal_roof_triangle",
        life = 20000.0,
        type = "walls",
        subtype = "roof",
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },

    ["model_wall_wood_roof"] = {
        item = "model_wall_wood_roof",
        life = 10000.0,
        type = "walls",
        subtype = "roof",
        upgrade = GetHashKey("model_wall_stone_roof"),
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["model_wall_stone_roof"] = {
        item = "model_wall_stone_roof",
        life = 15000.0,
        type = "walls",
        subtype = "roof",
        upgrade = GetHashKey("model_wall_metal_roof"),
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_wall_metal_roof"] = {
        item = "model_wall_metal_roof",
        life = 20000.0,
        type = "walls",
        subtype = "roof",
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },

    --- triangle walls

    ["model_wall_wood_triangle"] = {
        item = "model_wall_wood_triangle",
        life = 10000.0,
        type = "walls",
        upgrade = GetHashKey("model_wall_stone_triangle"),
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["model_wall_stone_triangle"] = {
        item = "model_wall_stone_triangle",
        life = 15000.0,
        type = "walls",
        upgrade = GetHashKey("model_wall_metal_triangle"),
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_wall_metal_triangle"] = {
        item = "model_wall_metal_triangle",
        life = 20000.0,
        type = "walls",
        upgrade = GetHashKey("model_wall_metal"),
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },

    --- doorway

    ["model_doorway_wood"] = {
        item = "model_doorway_wood",
        life = 10000.0,
        type = "walls",
        subtype = "doorway",
        workAsPillar = true,
        upgrade = GetHashKey("model_doorway_stone"),
        crafting = {
            {name = "wood",count = 20}
        }  
    },

    ["model_doorway_stone"] = {
        item = "model_doorway_stone",
        life = 15000.0,
        type = "walls",
        subtype = "doorway",
        workAsPillar = true,
        upgrade = GetHashKey("model_doorway_metal"),
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_doorway_metal"] = {
        item = "model_doorway_metal",
        life = 20000.0,
        type = "walls",
        workAsPillar = true,
        subtype = "doorway",
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },

    --- gate frame

    ["model_gateway_wood"] = {
        item = "model_gateway_wood",
        life = 10000.0,
        type = "walls",
        workAsPillar = true,
        subtype = "gateway",
        upgrade = GetHashKey("model_gateway_stone"),
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["model_gateway_stone"] = {
        item = "model_gateway_stone",
        life = 15000.0,
        type = "walls",
        workAsPillar = true,
        subtype = "gateway",
        upgrade = GetHashKey("model_gateway_metal"),
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_gateway_metal"] = {
        item = "model_gateway_metal",
        life = 20000.0,
        type = "walls",
        workAsPillar = true,
        subtype = "gateway",
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },
    
    -------- Base
    ["model_base_wood"] = {
        item = "model_base_wood",
        life = 10000.0,
        type = "foundations",
        subtype = "floor",
        geometry = 'square',
        upgrade = GetHashKey("model_base_stone"),
        crafting = {
            {name = "wood",count = 20}
        },
        disableIteract = true
    },

    ["model_base_stone"] = {
        item = "model_base_stone",
        life = 15000.0,
        type = "foundations",
        subtype = "floor",
        geometry = 'square',
        upgrade = GetHashKey("model_base_metal"),
        crafting = {
            {name = "stone",count = 20}
        },
        disableIteract = true
    },

    ["model_base_metal"] = {
        item = "model_base_metal",
        life = 20000.0,
        type = "foundations",
        subtype = "floor",
        geometry = 'square',
        crafting = {
            {name = "metalscrap",count = 20}
        },
        disableIteract = true
    },

    ["model_base_wood_triangle"] = {
        item = "model_base_wood_triangle",
        life = 10000.0,
        type = "foundations",
        subtype = "floor",
        geometry = 'triangle',
        upgrade = GetHashKey("model_base_stone_triangle"),
        crafting = {
            {name = "wood",count = 20}
        },
        disableIteract = true
    },

    ["model_base_stone_triangle"] = {
        item = "model_base_stone_triangle",
        life = 15000.0,
        type = "foundations",
        subtype = "floor",
        geometry = 'triangle',
        upgrade = GetHashKey("model_base_metal_triangle"),
        crafting = {
            {name = "stone",count = 20}
        },
        disableIteract = true
    },

    ["model_base_metal_triangle"] = {
        item = "model_base_metal_triangle",
        life = 20000.0,
        type = "foundations",
        subtype = "floor",
        geometry = 'triangle',
        crafting = {
            {name = "metalscrap",count = 20}
        },
        disableIteract = true
    },

    ------ Ceiling

    ["model_ceiling_wood"] = {
        item = "model_ceiling_wood",
        life = 10000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'square',
        upgrade = GetHashKey("model_ceiling_stone"),
        crafting = {
            {name = "wood",count = 20}
        },
        disableIteract = true
    },

    ["model_ceiling_stone"] = {
        item = "model_ceiling_stone",
        life = 10000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'square',
        upgrade = GetHashKey("model_ceiling_metal"),
        crafting = {
            {name = "stone",count = 20}
        },
        disableIteract = true
    },

    ["model_ceiling_metal"] = {
        item = "model_ceiling_metal",
        life = 20000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'square',
        crafting = {
            {name = "metalscrap",count = 20}
        },
        disableIteract = true
    },

    ["model_ceiling_wood_triangle"] = {
        item = "model_ceiling_wood_triangle",
        life = 10000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'triangle',
        upgrade = GetHashKey("model_ceiling_stone_triangle"),
        crafting = {
            {name = "wood",count = 20}
        },
        disableIteract = true
    },

    ["model_ceiling_stone_triangle"] = {
        item = "model_ceiling_stone_triangle",
        life = 15000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'triangle',
        upgrade = GetHashKey("model_ceiling_metal_triangle"),
        crafting = {
            {name = "stone",count = 20}
        },
        disableIteract = true
    },

    ["model_ceiling_metal_triangle"] = {
        item = "model_ceiling_metal_triangle",
        life = 20000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'triangle',
        crafting = {
            {name = "metalscrap",count = 20}
        },
        disableIteract = true
    },

    --- Stairs

    ["model_ceilingstairs_wood"] = {
        item = "model_ceilingstairs_wood",
        life = 10000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'square',
        upgrade = GetHashKey("model_ceilingstairs_stone"),
        crafting = {
            {name = "wood",count = 20}
        },
        disableIteract = true
    },

    ["model_ceilingstairs_stone"] = {
        item = "model_ceilingstairs_stone",
        life = 15000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'square',
        upgrade = GetHashKey("model_ceilingstairs_metal"),
        crafting = {
            {name = "stone",count = 20}
        },
        disableIteract = true
    },

    ["model_ceilingstairs_metal"] = {
        item = "model_ceilingstairs_metal",
        life = 20000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'square',
        crafting = {
            {name = "metalscrap",count = 20}
        },
        disableIteract = true
    },

    ----- ladder
    ["model_ceilingladder_wood_triangle"] = {
        item = "model_ceilingladder_wood_triangle",
        life = 10000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'triangle',
        upgrade = GetHashKey("model_ceilingladder_stone_triangle"),
        crafting = {
            {name = "wood",count = 20}
        },
        disableIteract = true
    },

    ["model_ceilingladder_stone_triangle"] = {
        item = "model_ceilingladder_stone_triangle",
        life = 15000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'triangle',
        upgrade = GetHashKey("model_ceilingladder_metal_triangle"),
        crafting = {
            {name = "stone",count = 20}
        },
        disableIteract = true
    },

    ["model_ceilingladder_metal_triangle"] = {
        item = "model_ceilingladder_metal_triangle",
        life = 10000.0,
        type = "ceiling",
        subtype = "floor",
        geometry = 'triangle',
        crafting = {
            {name = "metal",count = 20}
        },
        disableIteract = true
    },

    ----- pillar 

    ["model_pillar_wood"] = {
        item = "model_pillar_wood",
        life = 10000.0,
        type = "pillar",
        upgrade = GetHashKey("model_pillar_stone"),
        crafting = {
            {name = "wood",count = 20}
        },
        disableIteract = true
    },

    ["model_pillar_stone"] = {
        item = "model_pillar_stone",
        life = 15000.0,
        type = "pillar",
        upgrade = GetHashKey("model_pillar_metal"),
        crafting = {
            {name = "stone",count = 20}
        },
        disableIteract = true
    },

    ["model_pillar_metal"] = {
        item = "model_pillar_metal",
        life = 20000.0,
        type = "pillar",
        crafting = {
            {name = "metalscrap",count = 20}
        },
        disableIteract = true
    },

    ----- gate

    ["model_gate_wood"] = {
        item = "model_gate_wood",
        life = 10000.0,
        type = "gate",
        upgrade = GetHashKey("model_gate_stone"),
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["model_gate_stone"] = {
        item = "model_gate_stone",
        life = 15000.0,
        type = "gate",
        upgrade = GetHashKey("model_gate_metal"),
        crafting = {
            {name = "stone",count = 20}
        }
    },

    ["model_gate_metal"] = {
        item = "model_gate_metal",
        life = 20000.0,
        type = "gate",
        crafting = {
            {name = "metalscrap",label = "Scrap Metal",count = 20}
        }
    },

    ------ bed

    ["bkr_prop_biker_campbed_01"] = {
        item = "bkr_prop_biker_campbed_01",
        life = 10000.0,
        type = "beds",
        subtype = "findGroud",
        TriggerEvent = { 
            type = "client",
            event = "hrs_base_building:Regen",
            args = {"hrs_base_entity","bed",'health_regen_bed',90},
            entityAsArg = "hrs_base_entity" --- in the arguments, this word will be replaced by the Entity
        },
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ------- sofa

    ["v_tre_sofa_mess_b_s"] = {
        item = "v_tre_sofa_mess_b_s",
        life = 10000.0,
        type = "beds",
        subtype = "findGroud",
        TriggerEvent = {
            type = "client",
            event = "hrs_base_building:Regen",
            --args = {"hrs_base_entity","bed",'health_regen_bed',90},
            args = {"hrs_base_entity","sofa",'health_regen_sofa',180},
            entityAsArg = "hrs_base_entity" --- in the arguments, this word will be replaced by the Entity
        },
        crafting = {
            {name = "wood",count = 20}
        },
    },

    ----- crafting tables

    ["prop_tool_bench02_ld"] = {
        item = "prop_tool_bench02_ld",
        life = 10000.0,
        type = "crafting",
        subtype = "findGroud",
        noFoundationNeed = true,
        TriggerEvent = {
            type = "client",
            event = "ox_inventory:craftingEvent",
            args = {1}, --- agrs in order
            entityAsArg = "hrs_base_entity" --- in the arguments, this word will be replaced by the Entity
        },
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["bkr_prop_meth_table01a"] = {
        item = "bkr_prop_meth_table01a",
        life = 20000.0,
        type = "crafting",
        subtype = "findGroud",
        TriggerEvent = {
            type = "client",
            event = "ox_inventory:craftingEvent",
            args = {2}, --- agrs in order
        },
        crafting = {
            {name = "wood",count = 20},
            {name = "metalscrap",count = 20}
        }
    },

    ["gr_prop_gr_bench_02a"] = {
        item = "gr_prop_gr_bench_02a",
        life = 20000.0,
        type = "crafting",
        subtype = "findGroud",
        TriggerEvent = {
            type = "client",
            event = "ox_inventory:craftingEvent",
            args = {3}, --- agrs in order
        },
        crafting = {
            {name = "wood",count = 20},
            {name = "metalscrap",count = 20}
        }
    },

    -------- generator

    ["prop_generator_01a"] = {
        item = "prop_generator_01a",
        life = 20000.0,
        fuelTank = 10.0,
        type = "generator",
        subtype = "findGroud",
        noFoundationNeed = true,
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },

    ----- storages 

    ["prop_box_wood01a"] = {
        weight = 50000,
        item = "prop_box_wood01a",
        life = 10000.0,
        type = "storages",
        subtype = "findGroud",
        slots = 50,
        coreStashName = "stash", ---stash type on core_inventory
        crafting = {
            {name = "wood",count = 20}
        }
    },

    ["prop_money_bag_01"] = {
        item = "prop_money_bag_01",
        type = "storages",
        subtype = "deadStorage",
        toDeleteOnRestart = true,
        life = 100.0,
        notUseable = true,
    }, ------- (DO NOT REMOVE THIS PROP)

    ["gr_prop_gr_gunlocker_01a"] = {
        weight = 150000,
        item = "gr_prop_gr_gunlocker_01a",
        life = 20000.0,
        type = "storages",
        subtype = "findGroud",
        slots = 75,
        coreStashName = "small_storage", ---stash type on core_inventory
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },

    ["p_v_43_safe_s"] = {
        weight = 300000,
        item = "p_v_43_safe_s",
        life = 40000.0,
        type = "storages",
        subtype = "findGroud",
        slots = 100,
        coreStashName = "big_storage", ---stash type on core_inventory
        crafting = {
            {name = "metalscrap",count = 40}
        }
    },

    --------- Recycle machine

    ["prop_planer_01"] = {
        item = "prop_planer_01",
        life = 20000.0,
        type = "recycle",
        subtype = "findGroud",
        TriggerEvent = {
            type = "client",
            event = "example:event",
            args = {}
        },
        needsEletricity = true,
        crafting = {
            {name = "metalscrap",count = 20}
        }
    },
    
    -----  campfire 

    ["gr_prop_gr_hobo_stove_01"] = {
        item = "gr_prop_gr_hobo_stove_01",
        life = 5000.0,
        type = "cook",
        subtype = "findGroud",
        TriggerEvent = {
            type = "client",
            event = "example:event",
            args = {}
        },
        noPermission = true, ------ 
        mapProp = true, ----- you can interact with Ymap props 
        crafting = {
            {name = "metalscrap",count = 5}
        }
    },

    ----- lamps 

    ["prop_worklight_02a"] = {
        item = "prop_worklight_02a",
        life = 20000.0,
        type = "light",
        subtype = "findGroud",
        noFoundationNeed = true,
        zChange = 0.40,
        crafting = {
            {name = "metalscrap",count = 5}
        }
    },

    ["prop_worklight_01a"] = {
        item = "prop_worklight_01a",
        life = 20000.0,
        type = "light",
        subtype = "findGroud",
        noFoundationNeed = true,
        zChange = 1.80,
        fChange = 0.10,
        crafting = {
            {name = "metalscrap",count = 5}
        }
    },

    ["prop_worklight_04c"] = {
        item = "prop_worklight_04c",
        life = 20000.0,
        type = "light",
        subtype = "findGroud",
        noFoundationNeed = true,
        zChange = 0.20,
        fChange = 0.10,
        crafting = {
            {name = "metalscrap",count = 5}
        }
    },

    -------- Big walls stuff 

    ["model_bigwall_wood"] = {
        item = "model_bigwall_wood",
        life = 30000.0,
        type = "bigwall",
        noFoundationSearch = true,
        crafting = {
            {name = "wood",count = 40}
        }
    },

    ["model_biggateway_wood"] = {
        item = "model_biggateway_wood",
        life = 30000.0,
        type = "bigwall",
        subtype = "biggateway",
        noFoundationSearch = true,
        crafting = {
            {name = "wood",count = 40}
        }
    },

    ["model_biggate_wood"] = {
        item = "model_biggate_wood",
        life = 30000.0,
        type = "biggate",
        noFoundationSearch = true,
        crafting = {
            {name = "wood",count = 40}
        }
    },  

    -- ------ test ----
    -- ["xm3_prop_xm3_whshelf_03a"] = {
    --     item = "xm3_prop_xm3_whshelf_03a",
    --     life = 30000.0,
    --     type = "upkeep",
    --     noFoundationNeed = true,
    --     crafting = {
    --         {name = "wood",count = 40}
    --     }
    -- }, 

    
}

local backupTab = {}
for k,v in pairs(Config.Models) do
    backupTab[GetHashKey(k)] = v
    backupTab[GetHashKey(k)].modelName = k  
end

Config.Models = backupTab

------- ONLY IF YOU ARE NOT USING QB-CORE OR OX-INVENTORY OR IF THE PROP OR ITEM DOES NOT REALLY EXIST ---------------
Config.itemLabels = {
    
	-- WOOD BUILDING
	['model_door_wood'] = 'Wood Door', --- example 
	['model_window_wood'] = 'Wood Window', 
	['model_windowway_wood'] = 'Wood Window Frame', 
	['model_wall_wood'] = 'Wood Wall', 
	['model_doorway_wood'] = 'Wood Door Frame', 
	['model_gateway_wood'] = 'Wood Gate Frame', 
	['model_base_wood'] = 'Wood Foundation', 
	['model_ceiling_wood'] = 'Wood Ceiling', 
	['model_ceilingstairs_wood'] = 'Wood Ceiling Stairs', 	
	['model_pillar_wood'] = 'Wood Pillar', 
	['model_gate_wood'] = 'Wood Gate', 
	['model_bigwall_wood'] = 'Big Wall Wood', 
    ['model_biggateway_wood'] = 'Big Gate Frame Wood', 
    ['model_biggate_wood'] = 'Big Gate Wood', 
	['model_base_wood_triangle'] =  'Wood Triangle Foundation',
	['model_ceiling_wood_triangle'] =  'Wood Triangle Foundation',
	['model_wall_wood_roof'] =  'Wood Roof',
	['model_wall_wood_roof_triangle'] =  'Wood Triangle Roof',
	['model_wall_wood_small'] =  'Wood Small Wall',
	['model_wall_wood_triangle'] =  'Wood Triangle Wall',
	["model_stairs_wood"] 	   = "Wood stairs",
	["model_ceilingladder_wood_triangle"] 	   = "Wood Triangle Ceiling Ladder",
	
	-- STONE BUILDING
	["model_door_stone"] 			   = "Stone Door",
    ["model_window_stone"] 			   = "Stone Window", 
    ["model_windowway_stone"] 		   = "Stone Window Frame", 
    ["model_wall_stone"] 			   = "Stone Wall", 					
    ["model_doorway_stone"] 			   = "Stone Door Frame", 				
    ["model_gateway_stone"] 			   ="Stone Gate Frame", 				
    ["model_base_stone"] 			   = "Stone Foundation", 				
    ["model_ceiling_stone"] 			   ="Stone Ceiling", 				
    ["model_ceilingstairs_stone"] 	   = "Stone Stairs", 					
    ["model_pillar_stone"] 			   = "Stone Pillar", 					
    ["model_gate_stone"] 			   ="Stone Gate", 					
    ["model_base_stone_triangle"] 	   = "Stone Triangle Foundation",
	["model_ceiling_stone_triangle"]    = "Stone Triangle Ceiling", 					
    ["model_wall_stone_roof"] 		    = "Stone Roof", 			 		
    ["model_wall_stone_roof_triangle"]  = "Stone Triangle Roof", 						
    ["model_wall_stone_small"] 		   = "Stone Small Wall", 					
    ["model_wall_stone_triangle"] 	   = "Stone Triangle Wall", 				
    ["model_ceilingladder_stone_triangle"] 	   = "Stone Triangle Ceiling Ladder", 				
    ["model_stairs_stone"] 	   = "Stone stairs",
	
	-- METAL BUILDING
	['model_door_metal'] = 'Metal Door', 
	['model_window_metal'] = 'Metal Window', 
	['model_windowway_metal'] = 'Metal Window', 
	['model_wall_metal'] = 'Metal Wall', 
	['model_doorway_metal'] = 'Metal Door Frame', 
	['model_gateway_metal'] = 'Metal Gate Frame', 
	['model_base_metal'] = 'Metal Foundation', 
	['model_ceiling_metal'] = 'Metal Ceiling', 
	['model_ceilingstairs_metal'] = 'Metal Ceiling Stairs', 
	['model_pillar_metal'] = 'Metal Pillar', 
	['model_gate_metal'] = 'Metal Gate', 
	['model_base_metal_triangle'] =  'Metal Triangle Foundation',
	['model_ceiling_metal_triangle'] =  'Metal Triangle Ceiling',
	['model_wall_metal_roof'] =  'Metal Roof',
	['model_wall_metal_roof_triangle'] =  'Metal Triangle Roof',
	['model_wall_metal_small'] =  'Metal Small Wall',
	['model_wall_metal_triangle'] =  'Metal Triangle Wall',
	["model_ceiling_metal_triangle"]   = "Metal Triangle Ceiling", 	
	["model_ceilingladder_metal_triangle"] 	   = "Metal Triangle Ceiling Ladder", 
	["model_stairs_metal"] 	   = "Metal stairs",
		
    -- FURNITURE
	['bkr_prop_biker_campbed_01'] = 'Wood Bed', 
    ['v_tre_sofa_mess_b_s'] = 'Wood Sofa', 
	['prop_box_wood01a'] = 'Wood Storage', 
    ['gr_prop_gr_gunlocker_01a'] = 'Metal Storage', 
    ['p_v_43_safe_s'] = 'Metal Storage Lv2', 
	['prop_worklight_02a'] = 'Lamp', 
    ['prop_worklight_04c'] = 'Lamp 2', 
    
	-- CRAFTING TABLES
	['prop_tool_bench02_ld'] = 'Wood Crafting Table', 
    ['bkr_prop_meth_table01a'] = 'Medical Table', 
    ['gr_prop_gr_bench_02a'] = 'Weapons Table', 
	['prop_planer_01'] = 'Recycle Machine', 
    
	-- UTILITIES
	['prop_generator_01a'] = 'Generator', 
    ['gr_prop_gr_hobo_stove_01'] = 'Campfire', 
   
    -- RESOURCES
    ['wood'] = 'wood', 
    ['metalscrap'] = 'Scrap Metal', 
    ['prop_money_bag_01'] = 'Bag', 
  
}





  







