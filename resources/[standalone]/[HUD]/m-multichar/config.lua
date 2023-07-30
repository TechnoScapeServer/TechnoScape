Config = {}
Config.QBCoreVersion = "newqb" -- newqb or oldqb || only working qbcore
Config.Clothes = "illenium-appearance" -- default - illenium-appanceare 
Config.MySQL = "oxmysql" -- oxmysql , mysql-async , ghmattimysql
Config.UseQBApartments = false
Config.DefaultSpawn = vector3(5.75, -1750.18, 542.32) -- Default spawn coords if you have start apartments disabled
Config.HiddenCoords = vector4(-812.23, 182.54, 76.74, 156.5) -- 156.5 == heading
Config.Slots = {
    [1] = {tebex = false, id = 1},
    [2] = {tebex = false, id = 2},
    [3] = {tebex = false, id = 3},
    [4] = {tebex = false, id = 4},
    [5] = {tebex = false, id = 5},
    --[6] = {tebex = true, id = 6},
    -- [7] = {tebex = true, id = 7},
    -- [8] = {tebex = true, id = 8},
    -- [9] = {tebex = true, id = 9},
    -- [10] = {tebex = true, id = 10},
}
Config.Animations = {
    ["unemployed"] = {
        camwiewcoord = {coord = vector3(81.53, -1771.14, 26.04), rot = -15.5}, 
        car = {coord = vector4(81.417953491211,-1762.6013183594,26.056529998779,136.69873046875), hash = "t66avenger"}, -- car hash
        Peds = {
            {
                coord = vector4(-829.995, 172.3521, 70.403, 170.0), -- npc coord 170.0 heading
                hash = "g_m_y_ballaorig_01", -- npc hash
                isPlayerPed = false,
                animation = {"missheist_jewelleadinout", "jh_int_outro_loop_a"},
            },
            {
                coord = vector4(-828.049, 170.8139, 70.291, 170.0),
                hash = "mp_m_famdd_01",
                isPlayerPed = false,
                animation = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a"},
            },
            {
                coord = vector4(82.43, -1768.73, 26.05, 145.93),
                hash = nil,
                isPlayerPed = true, -- this ped have a player clothes
                animation = {"timetable@amanda@ig_2", "ig_2_base_amanda"},
            },
        }
    },
    ["police"] = {
        camwiewcoord = {coord = vector3(497.3135, -987.479, 27.969), rot = 88.0}, 
        car = {coord = vector4(492.0758, -987.542, 27.633, -90.0), hash = "police2"}, -- car hash
        Peds = {
            {
                coord = vector4(489.6207, -985.963, 27.628, -90.0),
                hash = "mp_m_securoguard_01",
                isPlayerPed = false,
                animation = {"missheist_jewelleadinout", "jh_int_outro_loop_a"},
            },
            {
                coord = vector4(489.7647, -989.271, 27.655, -90.0),
                hash = "s_m_m_armoured_02",
                isPlayerPed = false,
                animation = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a"},
            },
            {
                coord = vector4(494.9454, -987.481, 27.434, -90.0),
                hash = nil,
                isPlayerPed = true, -- this ped have a player clothes
                animation = {"timetable@amanda@ig_2", "ig_2_base_amanda"},
            },
        }
    },
    ["traumateam"] = {
        camwiewcoord = {coord = vector3(301.9914, -1439.41, 29.998), rot = 140.0}, 
        car = {coord = vector4(297.3335, -1444.75, 29.860, 0.0), hash = "atlus"}, -- car hash
        Peds = {
            {
                coord = vector4(297.7074, -1441.08, 29.797, -40.0),
                hash = "s_m_m_doctor_01",
                isPlayerPed = false,
                animation = {"missheist_jewelleadinout", "jh_int_outro_loop_a"},
            },
            {
                coord = vector4(299.7201, -1445.90, 29.804, -40.0),
                hash = "s_m_m_paramedic_01",
                isPlayerPed = false,
                animation = {"amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a"},
            },
            {
                coord = vector4(300.7377, -1440.94, 29.794, -40.0),
                hash = nil,
                isPlayerPed = true, -- this ped have a player clothes
                animation = {"timetable@amanda@ig_2", "ig_2_base_amanda"},
            },
        }
    }
}

Config.SetSpawnTrigger = function(src, plyData, isNew) -- when player create a new char isNew variaton getting true
    if Config.UseQBApartments then
        TriggerClientEvent('apartments:client:setupSpawnUI', src, plyData) -- plyData.cid // plyData.charinfo
    else
        if isNew then
            TriggerClientEvent('m-multichar-creatingFirstChar',src) -- instead your spawn trigger for create first character 
        else -- instead your spawn trigger for load player 
            TriggerClientEvent('qb-spawn:client:setupSpawns',src, plyData, false, nil)
            TriggerClientEvent('qb-spawn:client:openUI',src , true)
        end 
    end
end

function SecondsToClock(seconds)
    if seconds ~= nil then
        local seconds = tonumber(seconds)

        if seconds <= 0 then
            return "0H 0M PLAYTIME"; -- you can change here //
        else
            hours = string.format("%0.f", math.floor(seconds/3600));
            mins = string.format("%0.f", math.floor(seconds/60 - (hours*60)));
            return hours.."H "..mins.."M PLAYTIME" -- you can change here //
        end
    end
end