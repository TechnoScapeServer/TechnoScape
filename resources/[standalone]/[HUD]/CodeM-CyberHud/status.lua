Citizen.CreateThread(function()
    while true do
        if Config.Framework == "newqb" or Config.Framework == "oldqb"  then
            while frameworkObject == nil do
                Citizen.Wait(0)
            end
            while frameworkObject.Functions.GetPlayerData() == nil do
                Citizen.Wait(0)
            end
            while frameworkObject.Functions.GetPlayerData().metadata == nil do
                Citizen.Wait(0)
            end
            local myhunger = frameworkObject.Functions.GetPlayerData().metadata["hunger"]
            local mythirst = frameworkObject.Functions.GetPlayerData().metadata["thirst"]
            
            SendNUIMessage({
                type = "hunger_update",
                hunger = myhunger,
            })
            SendNUIMessage({
                type = "thirsty_update",
                thirsty = mythirst,
            })
        end
        if Config.Framework == "esx" then
            TriggerEvent('esx_status:getStatus', 'hunger', function(hunger)
                TriggerEvent('esx_status:getStatus', 'thirst', function(thirst)
                    local myhunger = hunger.getPercent()
                    local mythirst = thirst.getPercent()
                    SendNUIMessage({
                        type = "hunger_update",
                        hunger = myhunger,
                    })
                    SendNUIMessage({
                        type = "thirsty_update",
                        thirsty = mythirst,
                    })
                end)
            end)
        end
        Citizen.Wait(1500)
    end
end)