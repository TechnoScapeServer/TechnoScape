SelfMenu:AddCheckbox({
    icon = '🎥',
    label = Lang:t("menu.noclip"),
    description = Lang:t("desc.noclip_desc"),
    onchange = function()
        TriggerServerEvent('QBCore:CallCommand', 'noclip')
    end
})

SelfMenu:AddButton({
    icon = '🏥',
    label = Lang:t("menu.revive"),
    description = Lang:t("desc.revive_desc"),
    select = function()
        TriggerEvent('hospital:client:Revive')
        TriggerServerEvent('qb-admin:server:handleLog', 'revive')
    end
})

local Invisible = false
local function ToggleInvisible()
    Invisible = not Invisible
    TriggerServerEvent('qb-admin:server:handleLog', 'invis')
    if not Invisible then return end
    while Invisible do
        Wait(0)
        SetEntityVisible(PlayerPedId(), false, 0)
    end
    SetEntityVisible(PlayerPedId(), true, 0)
end
SelfMenu:AddCheckbox({
    icon = '👻',
    label = Lang:t("menu.invisible"),
    description = Lang:t("desc.invisible_desc"),
    onchange = function()
        ToggleInvisible()
    end
})

SelfMenu:AddCheckbox({
    icon = '📋',
    label = Lang:t("menu.names"),
    description = Lang:t("desc.names_desc"),
    onchange = function()
        TriggerServerEvent('QBCore:CallCommand', 'names')
    end
})

SelfMenu:AddCheckbox({
    icon = '📍',
    label = Lang:t("menu.blips"),
    description = Lang:t("desc.blips_desc"),
    onchange = function()
        TriggerServerEvent('QBCore:CallCommand', 'blips')
    end
})

SelfMenu:AddButton({
    icon = '🗺️',
    label = Lang:t("menu.teleport_locations"),
    value = SelfMenuTeleport,
    description = Lang:t("desc.teleport_locations_desc")
})

for k in pairs(Locations) do
    SelfMenuTeleport:AddButton({
        label = k,
        select = function()
            TriggerServerEvent('qb-admin:server:teleportlocation', k)
        end
    })
end