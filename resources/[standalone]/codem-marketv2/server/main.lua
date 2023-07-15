frameworkObject = nil

Citizen.CreateThread(
    function()
        frameworkObject, Config.Framework = GetCore()
        if Config.Framework == "esx" then
            frameworkObject.RegisterServerCallback(
                "codem-report:playername",
                function(source, cb)
                    local src = source
                    local name = GetName(src)
                    cb(name)
                end
            )
        else
            frameworkObject.Functions.CreateCallback(
                "codem-report:playername",
                function(source, cb)
                    local src = source
                    local name = GetName(src)
                    cb(name)
                end
            )
        end
    end
)

RegisterServerEvent("codem-market:additem")
AddEventHandler(
    "codem-market:additem",
    function(itemData,paytype)
        if Config.Framework == "esx" then
            local xPlayer = frameworkObject.GetPlayerFromId(source)
            local money = xPlayer.getMoney()
            local banks = xPlayer.getAccount('bank').money
            local price = getTotalMoney(itemData)
            if paytype == "cash" then
                if tonumber(money) >= tonumber(price) then
                    for k,v in pairs(itemData) do  
                      xPlayer.addInventoryItem(v.buyItemName, v.count)
                    end
                    
                    xPlayer.removeMoney(price)
                    TriggerClientEvent("codem-report:refresharea", source)
                else
                    Config.Notification(
                        Config.Notifications["notcashh"].message,
                        Config.Notifications["notcashh"].type,
                        true,
                        source
                    )
                end
            else
                if tonumber(banks) >= tonumber(price) then
                    for k,v in pairs(itemData) do  
                      xPlayer.addInventoryItem(v.buyItemName, v.count)
                    end
                    
                    xPlayer.removeAccountMoney("bank", price)

                    TriggerClientEvent("codem-report:refresharea", source)
                else
                    Config.Notification(
                        Config.Notifications["notbankcash"].message,
                        Config.Notifications["notbankcash"].type,
                        true,
                        source
                    )
                end
            end
        elseif Config.Framework == "newqb" or Config.Framework == "oldqb" then
            local Player = frameworkObject.Functions.GetPlayer(source)
            local money = Player.Functions.GetMoney("cash")

            local banks = Player.Functions.GetMoney("bank")
            local price = getTotalMoney(itemData)
            if paytype == "cash" then
           
                if tonumber(money) >= tonumber(price) then
                    for k,v in pairs(itemData) do  
                      Player.Functions.AddItem(v.buyItemName, v.count)
                    end

                    Player.Functions.RemoveMoney("cash", price)
                    TriggerClientEvent("codem-report:refresharea", source)
                else
                    Config.Notification(
                        Config.Notifications["notcashh"].message,
                        Config.Notifications["notcashh"].type,
                        true,
                        source
                    )
                end
            else
                if tonumber(banks) >= tonumber(price) then
                    for k,v in pairs(itemData) do  
                      Player.Functions.AddItem(v.buyItemName, v.count)
                    end

                    Player.Functions.RemoveMoney("bank", price)
                    TriggerClientEvent("codem-report:refresharea", source)
                else
                    Config.Notification(
                        Config.Notifications["notbankcash"].message,
                        Config.Notifications["notbankcash"].type,
                        true,
                        source
                    )
                end
            end
        end
    end
)

function getTotalMoney(items)
  local totalMoney = 0
  for k,v in pairs(items) do 
    totalMoney = totalMoney + tonumber(v.buyItemPrice)
  end
  return totalMoney
end