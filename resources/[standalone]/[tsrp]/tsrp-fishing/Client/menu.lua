local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn

-- First Time Talking Cletus
RegisterNetEvent('tk-fishing:menu:main', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local menu = {
        {
            isMenuHeader = true,
            header = Lang:t("menu.fishing_main_menu_header"),
        },
        {
            header = Lang:t("menu.open_bait_shop_header"),
            txt = Lang:t("menu.open_bait_shop_text"),
            params = {
                event = "tk-fishing:client:OpenBaitShop",
            }
        },
        {
            header = Lang:t("menu.fishing_rod_header"),
            txt = Lang:t("menu.fishing_rod_text"),
            params = {
                event = "tk-fishing:client:giveRod",
            }
        },
        {
            header = Lang:t("menu.level_up_header"),
            txt = Lang:t("menu.level_up_text"),
            params = {
                event = "tk-fishing:client:OpenLevelMenu",
            }
        },
    }
    exports['qb-menu']:openMenu(menu)
end)

--Level Menu
RegisterNetEvent('tk-fishing:client:OpenLevelMenu')
AddEventHandler('tk-fishing:client:OpenLevelMenu', function()
    exports['qb-menu']:openMenu({
        {
            header = Lang:t("menu.level_menu_header"),
            isMenuHeader = true, -- Set to true to make a nonclickable title
        },
        {
            header = Lang:t("menu.level_up_2_header"),
            txt = Lang:t("menu.level_up_2_text"),
            params = {
                event = "tk-fishing:client:LevelUp",
            }
        },
        {
            header = Lang:t("menu.level_up_3_header"),
            txt = Lang:t("menu.level_up_3_header"),
            params = {
                event = "tk-fishing:client:LevelUp2",
            }
        },
        {
            header = Lang:t("menu.level_up_4_header"),
            txt = Lang:t("menu.level_up_4_header"),
            params = {
                event = "tk-fishing:client:LevelUp3",
            }
        },
        {
            header = Lang:t("menu.level_up_5_header"),
            txt = Lang:t("menu.level_up_5_header"),
            params = {
                event = "tk-fishing:client:LevelUp4",
            }
        },
    })
end)