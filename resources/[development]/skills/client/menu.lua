
local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn

RegisterNetEvent('skills:menu:Open', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    local menu = {
        {
            isMenuHeader = true,
            header = "🔧 Skills",
        },
    }

    if PlayerData.metadata.endurance >= 100 then
        table.insert(menu,{
            header = "Endurance 🏃‍♂️",
            txt = "You have reached the max level : 100",
            disabled = true,
            params = {
                event = "",
            }
        })
    else
        table.insert(menu,{
            header = "Endurance 🏃‍♂️",
            txt = "Lvl: "..PlayerData.metadata.endurance .. "/100" .. " [Experience "..PlayerData.metadata.endurancexp .. "/"..Config.ExperienceTable[PlayerData.metadata.endurance + 1].."]",
            disabled = true,
            params = {
                event = "",
            }
        })
    end

    if PlayerData.metadata.strength >= 100 then
        table.insert(menu,{
            header = "Strength 💪",
            txt = "You have reached the max level : 100",
            disabled = true,
            params = {
                event = "",
            }
        })
    else
        table.insert(menu,{
            header = "Strength 💪",
            txt = "Lvl: "..PlayerData.metadata.strength .. "/100" .. " [Experience "..PlayerData.metadata.strengthxp .. "/"..Config.ExperienceTable[PlayerData.metadata.strength + 1].."]",
            disabled = true,
            params = {
                event = "",
            }
        })
    end

    if PlayerData.metadata.lungcapacity >= 100 then
        table.insert(menu,{
            header = "Lung Capacity 🫁",
            txt = "You have reached the max level : 100",
            disabled = true,
            params = {
                event = "",
            }
        })
    else
        table.insert(menu,{
            header = "Lung Capacity 🫁",
            txt = "Lvl: "..PlayerData.metadata.lungcapacity .. "/100" .. " [Experience "..PlayerData.metadata.lungcapacityxp .. "/"..Config.ExperienceTable[PlayerData.metadata.lungcapacity + 1].."]",
            disabled = true,
            params = {
                event = "",
            }
        })
    end

    if PlayerData.metadata.flying >= 100 then
        table.insert(menu,{
            header = "Flying ✈️",
            txt = "You have reached the max level : 100",
            disabled = true,
            params = {
                event = "",
            }
        })
    else
        table.insert(menu,{
            header = "Flying ✈️",
            txt = "Lvl: "..PlayerData.metadata.flying .. "/100" .. " [Experience "..PlayerData.metadata.flyingxp .. "/"..Config.ExperienceTable[PlayerData.metadata.flying + 1].."]",
            disabled = true,
            params = {
                event = "",
            }
        })
    end

    if PlayerData.metadata.iq >= 100 then
        table.insert(menu,{
            header = "IQ 🧠",
            txt = "You have reached the max level : 100",
            disabled = true,
            params = {
                event = "",
            }
        })
    else
        table.insert(menu,{
            header = "IQ 🧠",
            txt = "Lvl: "..PlayerData.metadata.iq .. "/100" .. " [Experience "..PlayerData.metadata.iqxp .. "/"..Config.ExperienceTable[PlayerData.metadata.iq + 1].."]",
            disabled = true,
            params = {
                event = "",
            }
        })
    end
    exports['qb-menu']:openMenu(menu)
end)