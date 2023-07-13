local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn
local sk1 = false
local sk2 = false
local sk3 = false
local skd15p2 = false
local skd15p3 = false
local skd15p4 = false

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
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ What, he too shy to hand over the eddies hisself? Ah, tell him I don't bite. Not yet.", 7000)
    Wait(7050)
    TriggerEvent("lifepaths:streetkid:Dialogue7")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue7', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            header = "",
            txt = "Cut him some slack, will ya? He'll pay - just needs some more time.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue8-1",
            }
        },
        {
            header = "",
            txt = "What's he owe you?",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue8-2",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue8-1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
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

RegisterNetEvent('lifepaths:streetkid:Dialogue8-2', function()
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

RegisterNetEvent('lifepaths:streetkid:Dialogue9', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            header = "",
            txt = "Transactions go two ways, I get that. I'll owe you a favor.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue10-1",
            }
        },
        {
            header = "",
            txt = "Know what, Kirk? I sometimes get the impression you forget you are'nt from around here.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue10-2",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue10-1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Tempting... Got a nova idea already.", 5000)
    Wait(5050)
    TriggerEvent("lifepaths:streetkid:Dialogue11")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue10-2', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ Pop into Heywood for the occasional visit, sure, but you live far, far away, in Pacifica", 6000)
    Wait(6050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ What're you gettin' at?", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ Gettin' at you prolly needin' to think before you start somethin' with a local son.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Hmm... I'm open to other options.", 5000)
    Wait(5050)
    TriggerEvent("lifepaths:streetkid:Dialogue11")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue11', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            header = "",
            txt = "Mhm...?",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue12-1",
            }
        },
        {
            header = "",
            txt = "What's this?",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue12-2",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue12-1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Preem ride there on the page. Only four of 'em in NC as of now.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ One Rayfield regional director. Two - Mayor Rhyne. Three - a rental service.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ Uh huh. And four?", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Number four'll belong to my client - just as soon as you klep it for me, that is", 7000)
    Wait(7050)
    TriggerEvent("lifepaths:streetkid:Dialogue13")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue12-2', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Grab a look.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ Mhm...", 5000)
    Wait(5050)
    TriggerEvent("lifepaths:streetkid:Dialogue12-1")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue13', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            header = "",
            txt = "I am no thief. Even if I wanted to, stealin' a ride like that'd be a level beyond me. Hell, two levels.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue14-1",
            }
        },
        {
            header = "",
            txt = "I do this, and Pepe's debt is squared?",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue14-2",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue14-1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Beautiful thing is, a grand theft auto virgin like you don't need to know how. I already planned it.", 8000)
    Wait(8050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Whole thing's simple - you swipe the Rayfield for me, I clear Pepe's account. Even toss in a cut for you I'm such a nice guy.", 9000)
    Wait(9050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ My man Rick works a parking structure by Embers, club where our Rayfield driver likes to kick it. There every Friday night like clockwork", 9000)
    Wait(9050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Soon as you appear, security cams shut down, gate swings up - the road is yours. Just gotta grab the Rayfield and roll out. Simple", 9000)
    Wait(9050)
    TriggerEvent("lifepaths:streetkid:Dialogue15")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue14-2', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Course. I'm a man o' my word, you know that.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Whole thing's simple - you swipe the Rayfield for me, I clear Pepe's account. Even toss in a cut for you I'm such a nice guy.", 9000)
    Wait(9050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ My man Rick works a parking structure by Embers, club where our Rayfield driver likes to kick it. There every Friday night like clockwork", 9000)
    Wait(9050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Soon as you appear, security cams shut down, gate swings up - the road is yours. Just gotta grab the Rayfield and roll out. Simple", 9000)
    Wait(9050)
    TriggerEvent("lifepaths:streetkid:Dialogue15")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue15', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            header = "",
            txt = "How'm I supposed to do this? Expect me to slife under a chasis on a skateboard for a quick hotwire, fast an' easy?",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue16-1",
            }
        },
        {
            header = "",
            txt = "Who's the Owner",
            icon = "fas fa-comment",
            disabled = skd15p2,
            params = {
                event = "lifepaths:streetkid:Dialogue16-2",
            }
        },
        {
            header = "",
            txt = "Plan sounds shaky as fuck.",
            icon = "fas fa-comment",
            disabled = skd15p3,
            params = {
                event = "lifepaths:streetkid:Dialogue16-3",
            }
        },
        {
            header = "",
            txt = "And your man Rick...?",
            icon = "fas fa-comment",
            disabled = skd15p4,
            params = {
                event = "lifepaths:streetkid:Dialogue16-4",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue16-1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ Kirk, wheels like this got security systems. Good ones.", 6000)
    Wait(6050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ This bitty bop works like the key Rayfield techs use for repairs. Opens locks, bypasses identity authorization.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ A skeleton key for all Rayfields in the city, heh, c'mon, Kirk, even you don't buy that.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Kabuki's tech wizards sell more magical shit than this under the counter. Have a little faith.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ So... we all agreed, then?", 5000)
    Wait(5050)
    TriggerEvent("lifepaths:streetkid:Dialogue17")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue16-2', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Just an Arasaka suit from across the water, Spews cash outta every hole in his body.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ And his name?", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ How would I know? Why would I care? It's a hot item, and I know where to find it.", 5000)
    Wait(5050)
    skd15p2 = true
    TriggerEvent("lifepaths:streetkid:Dialogue15")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue16-3', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Oh? How so?", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~"..PlayerName..": ~s~ Sounds like you're lookin' for a sucker.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ This ain't no setup,"..PlayerName..". Heard you got a good head. Maybe we help each other make a few eddies", 7000)
    Wait(7050)
    skd15p3 = true
    TriggerEvent("lifepaths:streetkid:Dialogue15")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue16-4', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Trust him like my own brother.", 5000)
    Wait(5050)
    skd15p4 = true
    TriggerEvent("lifepaths:streetkid:Dialogue15")
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue17', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            header = "",
            txt = "We are.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue18-1",
            }
        },
        {
            header = "",
            txt = "Best keep your word, Kirk.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue18-2",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue18-1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Glad to hear it. Always said you were a bright bulb.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Head to Embers, in the Glen. Rick's in the garage, be waitin' for ya. You two'll hit it off.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Good luck out there. We'll be in touch.", 5000)
    sk3 = true
    while sk3 do
        Wait(0)
        TriggerEvent('tsrp-dialogue:showtext', "Leave the bar.")
    end
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue18-2', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Eeeaasy,"..PlayerName..". Job's gonna pad your wallet too, y'know.", 5000)
    Wait(5050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Head to Embers, in the Glen. Rick's in the garage, be waitin' for ya. You two'll hit it off.", 7000)
    Wait(7050)
    exports['tsrp-dialogue']:showTextUI("~r~ Kirk: ~s~ Good luck out there. We'll be in touch.", 5000)
    sk3 = true
    while sk3 do
        Wait(0)
        TriggerEvent('tsrp-dialogue:showtext', "Leave the bar.")
    end
end)
