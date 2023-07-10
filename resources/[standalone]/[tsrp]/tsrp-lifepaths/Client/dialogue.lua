local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn

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
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local menu = {
        {
            isMenuHeader = true,
            header = "Pepe is Talking...",
            txt = "Everything chill, mano?",
            icon = "fa-solid fa-star"
        },
        {
            header = "",
            txt = "Some bastard tried to mug me. I handled it.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue2",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue2', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local menu = {
        {
            isMenuHeader = true,
            header = "Pepe is Talking...",
            txt = "Who? Local guy?",
            icon = "fa-solid fa-star"
        },
        {
            header = "",
            txt = "Ya really think somebody local'd try to mug me, Pepe?",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue3",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue3', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            isMenuHeader = true,
            header = "Pepe is Talking...",
            txt = "Listen "..PlayerName.."... I got a problem. Serious This Time",
            icon = "fa-solid fa-star"
        },
        {
            header = "",
            txt = "Found yourself'n a hole, sounds like. You need help?",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue4-1",
            }
        },
        {
            header = "",
            txt = "C'mon, spin it - what is it now?",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue4-2",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue4-1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            isMenuHeader = true,
            header = "Pepe is Talking...",
            txt = "Ah, knew I could count on you. It's, uh, Kirk... I owe 'im. Don't pay by tomorrow, said he'd bust my legs. An' he dont joke about that stuff. Got cartels in his corner.",
            icon = "fa-solid fa-star"
        },
        {
            header = "",
            txt = "You in it with Kirk?! Every man, woman and rat in Heywood knows he's a fuckin' shark.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue5",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue4-2', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            isMenuHeader = true,
            header = "Pepe is Talking...",
            txt = "It's, uh, Kirk... I owe 'im. Don't pay by tomorrow, said he'd bust my legs. An' he dont joke about that stuff. Got cartels in his corner.",
            icon = "fa-solid fa-star"
        },
        {
            header = "",
            txt = "You in it with Kirk?! Every man, woman and rat in Heywood knows he's a fuckin' shark.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue5",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue5', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            isMenuHeader = true,
            header = "Pepe is Talking...",
            txt = "My bro jumped the joint, deserved a hero's welcome... I know I fuck up, V.",
            icon = "fa-solid fa-star"
        },
        {
            header = "",
            txt = "I'll talk to Kirk. But then you're gonna owe me one.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue6",
            }
        },
        {
            header = "",
            txt = "Huh, you ever gonna get wise, Pepe? Least tell me your brother's doin' all right.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue5-1",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue5-1', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            isMenuHeader = true,
            header = "Pepe is Talking...",
            txt = "Ah, doing his thing, you know... So can you help?",
            icon = "fa-solid fa-star"
        },
        {
            header = "",
            txt = "I'll talk to Kirk. But then you're gonna owe me one.",
            icon = "fas fa-comment",
            params = {
                event = "lifepaths:streetkid:Dialogue6",
            }
        },
        {
            header = "",
            txt = "Huh, you ever gonna get wise, Pepe? Least tell me your brother's doin' all right.",
            icon = "fas fa-comment",
            disabled = true,
            params = {
                event = "lifepaths:streetkid:Dialogue5-1",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

RegisterNetEvent('lifepaths:streetkid:Dialogue6', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local PlayerName = PlayerData.charinfo.firstname
    local menu = {
        {
            isMenuHeader = true,
            header = "Pepe is Talking...",
            txt = "And you're savin' my life, "..PlayerName..", truly.",
            icon = "fa-solid fa-star"
        },
        {
            header = "",
            txt = "[End Coversation]",
            icon = "fas fa-ban",
            params = {
                event = "",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)