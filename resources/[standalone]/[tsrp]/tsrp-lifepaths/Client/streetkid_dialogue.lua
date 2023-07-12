local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local sk1 = false
local sk2 = false

RegisterNetEvent('lifepaths:streetkid:Choice1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local menu = {
        {
            header = "Fix Nose 👃",
            params = {
                event = "lifepath:streetkid:fixNose",
            }
        },
        {
            header = "Take Shot 🥃",
            params = {
                event = "lifepath:streetkid:takeShot",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
    
    sk1 = true
    while sk1 do
        Wait(0)
        TriggerEvent('tsrp-dialogue:showtext', "Talk With Pepe")
    end
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    sk1 = false
    TriggerEvent('tsrp-dialogue:hidetext')
    exports['tsrp-dialogue']:showTextUI("~r~ Pepe: ~s~ Everything chill, mano?", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ Some bastard tried to mug me. I handled it.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Pepe: ~s~ Who? Local guy?", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ Ya really think somebody local'd try to mug me, Pepe?", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Pepe: ~s~ Listen "..PlayerName.."... I got a problem. Serious This Time", 5000)
    Wait(5050)
    TriggerEvent("lifepaths:streetkid:Dialogue2")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue2', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            header = "",
            txt = "Found yourself'n a hole, sounds like. You need help?",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue3-1",
            }
        },
        {
            header = "",
            txt = "C'mon, spin it - what is it now?",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue3-2",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue3-1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Pepe: ~s~ Ah, knew I could count on you. It's, uh, Kirk... I owe 'im. Don't pay by tomorrow, said he'd bust my legs. An' he dont joke about that stuff. Got cartels in his corner.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ You in it with Kirk?! Every man, woman and rat in Heywood knows he's a fuckin' shark.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~ Pepe: ~s~ My bro jumped the joint, deserved a hero's welcome... I know I fuck up "..PlayerName..".", 5000)
    Wait(5050)
    TriggerEvent("lifepaths:streetkid:Dialogue4")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue3-2', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Pepe: ~s~ It's, uh, Kirk... I owe 'im. Don't pay by tomorrow, said he'd bust my legs. An' he dont joke about that stuff. Got cartels in his corner.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ You in it with Kirk?! Every man, woman and rat in Heywood knows he's a fuckin' shark.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~ Pepe: ~s~ My bro jumped the joint, deserved a hero's welcome... I know I fuck up "..PlayerName..".", 5000)
    Wait(5050)
    TriggerEvent("lifepaths:streetkid:Dialogue4")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue4', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            header = "",
            txt = "I'll talk to Kirk. But then you're gonna owe me one.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue5-1",
            }
        },
        {
            header = "",
            txt = "Huh, you ever gonna get wise, Pepe? Least tell me your brother's doin' all right.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue5-2",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue5-1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Pepe: ~s~ And you're savin' my life, "..PlayerName..", truly.", 5000)
    sk2 = true
    while sk2 do
        Wait(0)
        TriggerEvent('tsrp-dialogue:showtext', "Find Kirk on the second floor.")
    end
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue5-2', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Pepe: ~s~ Ah, doing his thing, you know... So can you help?", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ I'll talk to Kirk. But then you're gonna owe me one.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Pepe: ~s~ And you're savin' my life, "..PlayerName..", truly.", 5000)
    sk2 = true
    while sk2 do
        Wait(0)
        TriggerEvent('tsrp-dialogue:showtext', "Find Kirk on the second floor.")
    end
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue6', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    sk2 = false
    TriggerEvent('tsrp-dialogue:hidetext')
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ Hey, Kirk, Wanna Talk.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ "..PlayerName..", been a while, Spin it - whatcha need?", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ Pepe asked me to talk you up", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ "..PlayerName..", What, he too shy to hand over the eddies hisself? Ah, tell him I don't bite. Not yet.", 7000)
    Wait(7050)
    TriggerEvent("lifepaths:streetkid:Dialogue7")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue7', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            header = "",
            txt = "I'll talk to Kirk. But then you're gonna owe me one.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue5-1",
            }
        },
        {
            header = "",
            txt = "What's he owe you?",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue8-1",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue8-1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Afraid that's client confidentiality. Call it a lot and leave it at that.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ A credshark with business ethics. Sounds too good to be true.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Well, Merry Fuckin' Christmas.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ Cut him some slack, will ya? He'll pay - just needs some more time.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Do I look like a priest that runs a charity to you?", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ You borrow eddies, you gotta pay 'em back - with interest. It's common fuckin' knowledge.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ You suggestin' I let a flaky cunt who can't keep a deal off the hook?", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ No, you let him off because it's me askin'", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Hah. You know me - I'm a man of the biz. So I need to know what I get out of it.", 7000)
    Wait(7050)
    TriggerEvent("lifepaths:streetkid:Dialogue9")
end)