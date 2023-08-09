local vehicles = {}
local function OpenCarModelsMenu(category)
    VehNameMenu:ClearItems()
    MenuV:OpenMenu(VehNameMenu)
    for k, v in pairs(category) do
        VehNameMenu:AddButton({
            label = v["name"],
            value = k,
            description = 'Spawn ' .. v["name"],
            select = function()
                TriggerServerEvent('qb-admin:server:spawnVehicle', k)
            end
        })
    end
end
VehicleMenu:AddButton({
    icon = '🚗',
    label = Lang:t("menu.spawn_vehicle"),
    value = VehCategorieMenu,
    description = Lang:t("desc.spawn_vehicle_desc"),
    select = function()
        VehCategorieMenu:ClearItems()
        for k, v in pairs(QBCore.Shared.Vehicles) do
            local category = v["category"]
            if vehicles[category] == nil then
                vehicles[category] = { }
            end
            vehicles[category][k] = v
        end
        for k, v in pairs(vehicles) do
            VehCategorieMenu:AddButton({
                label = k,
                value = v,
                description = Lang:t("menu.category_name"),
                select = function(btn)
                    local select = btn.Value
                    OpenCarModelsMenu(select)
                end
            })
        end
    end
})

VehicleMenu:AddButton({
    icon = '🔧',
    label = Lang:t("menu.fix_vehicle"),
    description = Lang:t("desc.fix_vehicle_desc"),
    select = function()
        TriggerServerEvent('QBCore:CallCommand', "fix", {})
    end
})