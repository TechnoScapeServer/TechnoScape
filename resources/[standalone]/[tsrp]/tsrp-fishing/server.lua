local QBCore = exports['qb-core']:GetCoreObject()
local fishAmount = 0

--Check Rod For Ocean Fishing
RegisterNetEvent('tk-fishing:Server:CheckRodOcean', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rod1 = Player.Functions.GetItemByName('homemadefishingrod')
    local rod2 = Player.Functions.GetItemByName('cheapfishingrod')
    local rod3 = Player.Functions.GetItemByName('midtierfishingrod')
    local rod4 = Player.Functions.GetItemByName('hightierfishingrod')
    local rod5 = Player.Functions.GetItemByName('masterrod')
    local bait1 = Player.Functions.GetItemByName('worms')
    local bait2 = Player.Functions.GetItemByName('minnows')
    local bait3 = Player.Functions.GetItemByName('cricket')
    local bait4 = Player.Functions.GetItemByName('grasshopper')
    local bait5 = Player.Functions.GetItemByName('leech')
    local illegalbait2 = Player.Functions.GetItemByName('cowcarcass')
    local illegalbait3 = Player.Functions.GetItemByName('pigcarcass')
    local illegalbait4 = Player.Functions.GetItemByName('seaweed')
    local frep = Player.PlayerData.metadata.fishingrep
    if frep == 5 then
        if rod5 ~= nil or rod4 ~= nil or rod3 ~= nil or rod2 ~= nil or rod1 ~= nil then
            if illegalbait4 ~= nil or illegalbait3 ~= nil or illegalbait2 ~= nil or bait5 ~= nil or bait4 ~= nil or bait3 ~= nil or bait2 ~= nil or bait1 ~= nil then
                TriggerClientEvent('tk-fishing:client:FishEasyOcean',src)
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have any bait", "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.no_rod"), "error")
        end
    elseif frep == 4 then 
        if rod5 ~= nil or rod4 ~= nil or rod3 ~= nil or rod2 ~= nil or rod1 ~= nil then
            if illegalbait4 ~= nil or illegalbait3 ~= nil or illegalbait2 ~= nil or bait5 ~= nil or bait4 ~= nil or bait3 ~= nil or bait2 ~= nil or bait1 ~= nil then
                TriggerClientEvent('tk-fishing:client:FishEasyOcean',src)
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have any bait", "error")
            end
            TriggerClientEvent('tk-fishing:client:FishNormalOcean',src)
        else
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.no_rod"), "error")
        end
    elseif frep == 3 then 
        if rod5 ~= nil or rod4 ~= nil or rod3 ~= nil or rod2 ~= nil or rod1 ~= nil then
            if illegalbait4 ~= nil or illegalbait3 ~= nil or illegalbait2 ~= nil or bait5 ~= nil or bait4 ~= nil or bait3 ~= nil or bait2 ~= nil or bait1 ~= nil then
                TriggerClientEvent('tk-fishing:client:FishMediumOcean',src)
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have any bait", "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.no_rod"), "error")
        end
    elseif frep == 2 then 
        if rod5 ~= nil or rod4 ~= nil or rod3 ~= nil or rod2 ~= nil or rod1 ~= nil then
            if illegalbait4 ~= nil or illegalbait3 ~= nil or illegalbait2 ~= nil or bait5 ~= nil or bait4 ~= nil or bait3 ~= nil or bait2 ~= nil or bait1 ~= nil then
                TriggerClientEvent('tk-fishing:client:FishHardOcean',src)
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have any bait", "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.no_rod"), "error")
        end
    elseif frep == 1 then 
        if rod5 ~= nil or rod4 ~= nil or rod3 ~= nil or rod2 ~= nil or rod1 ~= nil then
            if illegalbait4 ~= nil or illegalbait3 ~= nil or illegalbait2 ~= nil or bait5 ~= nil or bait4 ~= nil or bait3 ~= nil or bait2 ~= nil or bait1 ~= nil then
                TriggerClientEvent('tk-fishing:client:FishHardOcean',src)
            else
                TriggerClientEvent('QBCore:Notify', src,"You dont have any bait", "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.no_rod"), "error")
        end   
    end
end)

RegisterNetEvent('tk-fishing:server:giveRod', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local fisherman = Player.PlayerData.citizenid
    local frep = Player.PlayerData.metadata.fishingrep
        if frep == 1 then
            Player.Functions.AddItem('homemadefishingrod',1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['homemadefishingrod'], "add")
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.rod1"), "success")
        elseif frep == 2 then
            Player.Functions.AddItem('cheapfishingrod',1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cheapfishingrod'], "add")
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.rod2"), "success")
        elseif frep == 3 then
            Player.Functions.AddItem('midtierfishingrod',1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['midtierfishingrod'], "add")
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.rod3"), "success")
        elseif frep == 4 then
            Player.Functions.AddItem('hightierfishingrod',1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['hightierfishingrod'], "add")
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.rod4"), "success")
        elseif frep == 5 then
            Player.Functions.AddItem('masterrod',1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['masterrod'], "add")
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.rod5"), "success")
        end
end)

RegisterNetEvent('tk-fishing:server:LevelUp', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local frep = Player.PlayerData.metadata.fishingrep
    local caughtFish = Player.PlayerData.metadata.caughtfish
    if frep == 1 then
        if caughtFish >= Config.Level2FishAmount then
            local rod1 = Player.Functions.GetItemByName('homemadefishingrod')
            local rod2 = Player.Functions.GetItemByName('cheapfishingrod')
            if rod1 ~= nil then
                Player.Functions.AddItem('cheapfishingrod',1)
                Player.Functions.RemoveItem('homemadefishingrod',1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['homemadefishingrod'], "remove")
                TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.upgradecheap"), "success")
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cheapfishingrod'], "add")
                Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]-(Config.Level2FishAmount))
                Player.Functions.SetMetaData("fishingrep", Player.PlayerData.metadata["fishingrep"]+(1))
            else
                TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.no_lower_level_rod"), "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.not_enough_fish"), "error")
        end
    elseif frep >= 1 then
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.already_have_level"), "error")
    else
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.not_high_enough_level"), "error")
    end
end)

RegisterNetEvent('tk-fishing:server:LevelUp2', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local frep = Player.PlayerData.metadata.fishingrep
    local caughtFish = Player.PlayerData.metadata.caughtfish
    if frep == 2 then
        if caughtFish >= Config.Level3FishAmount then
            local rod1 = Player.Functions.GetItemByName('cheapfishingrod')
            local rod2 = Player.Functions.GetItemByName('midtierfishingrod')
            if rod1 ~= nil then
                Player.Functions.AddItem('midtierfishingrod',1)
                Player.Functions.RemoveItem('cheapfishingrod',1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cheapfishingrod'], "remove")
                TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.upgrade_mid"), "success")
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['midtierfishingrod'], "add")
                Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]-(Config.Level3FishAmount))
                Player.Functions.SetMetaData("fishingrep", Player.PlayerData.metadata["fishingrep"]+(1))
            else
                TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.no_lower_level_rod"), "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.not_enough_fish"), "error")
        end
    elseif frep >= 1 then
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.already_have_level"), "error")
    else
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.not_high_enough_level"), "error")
    end
end)

RegisterNetEvent('tk-fishing:server:LevelUp3', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local frep = Player.PlayerData.metadata.fishingrep
    local caughtFish = Player.PlayerData.metadata.caughtfish
    if frep == 3 then
        if caughtFish >= Config.Level4FishAmount then
            local rod1 = Player.Functions.GetItemByName('midtierfishingrod')
            local rod2 = Player.Functions.GetItemByName('hightierfishingrod')
            if rod1 ~= nil then
                Player.Functions.AddItem('hightierfishingrod',1)
                Player.Functions.RemoveItem('midtierfishingrod',1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['midtierfishingrod'], "remove")
                TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.upgrade_high"), "success")
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['hightierfishingrod'], "add")
                Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]-(Config.Level4FishAmount))
                Player.Functions.SetMetaData("fishingrep", Player.PlayerData.metadata["fishingrep"]+(1))
            else
                TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.no_lower_level_rod"), "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.not_enough_fish"), "error")
        end
    elseif frep >= 1 then
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.already_have_level"), "error")
    else
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.not_high_enough_level"), "error")
    end
end)

RegisterNetEvent('tk-fishing:server:LevelUp4', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local frep = Player.PlayerData.metadata.fishingrep
    local caughtFish = Player.PlayerData.metadata.caughtfish
    if frep == 4 then
        if caughtFish >= Config.Level5FishAmount then
            local rod1 = Player.Functions.GetItemByName('masterrod')
            local rod2 = Player.Functions.GetItemByName('hightierfishingrod')
            if rod2 ~= nil then
                Player.Functions.AddItem('masterrod',1)
                Player.Functions.RemoveItem('hightierfishingrod',1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['hightierfishingrod'], "remove")
                TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.upgrade_master"), "success")
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['masterrod'], "add")
                Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]-(Config.Level5FishAmount))
                Player.Functions.SetMetaData("fishingrep", Player.PlayerData.metadata["fishingrep"]+(1))
            else
                TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.no_lower_level_rod"), "error")
            end
        else
            TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.not_enough_fish"), "error")
        end
    elseif frep >= 1 then
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.already_have_level"), "error")
    else
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify_error.not_high_enough_level"), "error")
    end
end)

RegisterNetEvent('tk-fishing:Server:CheckBaitOcean', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local legalFish = (Config.LegalOceanFish[math.random(#Config.LegalOceanFish)])
    local caughtFish = Player.PlayerData.metadata.caughtfish
    local sharks = (Config.Sharks[math.random(#Config.Sharks)])
    local turtles = (Config.Turtles[math.random(#Config.Turtles)])
    local illegalbait2 = Player.Functions.GetItemByName('cowcarcass')
    local illegalbait3 = Player.Functions.GetItemByName('pigcarcass')
    local illegalbait4 = Player.Functions.GetItemByName('seaweed')
    local bait1 = Player.Functions.GetItemByName('worms')
    local bait2 = Player.Functions.GetItemByName('minnows')
    local bait3 = Player.Functions.GetItemByName('cricket')
    local bait4 = Player.Functions.GetItemByName('grasshopper')
    local bait5 = Player.Functions.GetItemByName('leech')
    if illegalbait4 ~= nil then
        Player.Functions.AddItem(turtles, 1)
        Player.Functions.RemoveItem('seaweed', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['seaweed'], "remove")
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.catch")..turtles, "success")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[turtles], "add")
        Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]+(1))
    elseif illegalbait3 ~= nil then
        Player.Functions.AddItem(sharks, 1)
        Player.Functions.RemoveItem('pigcarcass', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['pigcarcass'], "remove")
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.catch")..sharks, "success")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[sharks], "add")
        Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]+(1))
    elseif illegalbait2 ~= nil then
        Player.Functions.AddItem(sharks, 1)
        Player.Functions.RemoveItem('cowcarcass', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cowcarcass'], "remove")
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.catch")..sharks, "success")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[sharks], "add")
        Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]+(1))
    elseif bait5 ~= nil then
        Player.Functions.AddItem(legalFish, 1)
        Player.Functions.RemoveItem('leech', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['leech'], "remove")
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.catch")..legalFish, "success")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[legalFish], "add")
        Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]+(1))
    elseif bait4 ~= nil then
        Player.Functions.AddItem(legalFish, 1)
        Player.Functions.RemoveItem('grasshopper', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['grasshopper'], "remove")
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.catch")..legalFish, "success")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[legalFish], "add")
        Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]+(1))
    elseif bait3 ~= nil then
        Player.Functions.AddItem(legalFish, 1)
        Player.Functions.RemoveItem('cricket', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['cricket'], "remove")
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.catch")..legalFish, "success")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[legalFish], "add")
        Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]+(1))
    elseif bait2 ~= nil then
        Player.Functions.AddItem(legalFish, 1)
        Player.Functions.RemoveItem('minnows', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['minnows'], "remove")
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.catch")..legalFish, "success")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[legalFish], "add")
        Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]+(1))
    elseif bait1 ~= nil then
        print(bait1)
        Player.Functions.AddItem(legalFish, 1)
        Player.Functions.RemoveItem('worms', 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['worms'], "remove")
        TriggerClientEvent('QBCore:Notify', src,Lang:t("notify.catch")..legalFish, "success")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[legalFish], "add")
        Player.Functions.SetMetaData("caughtfish", Player.PlayerData.metadata["caughtfish"]+(1))
    else
        TriggerClientEvent('QBCore:Notify', source, "You dont have fishing bait", "error", 2500)
        ClearPedTasks(PlayerPedId())
    end
end)

RegisterNetEvent('tk-fishing:server:SellLegalFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 0
    if Player ~= nil then
        if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
            for k, v in pairs(Player.PlayerData.items) do
                if Player.PlayerData.items[k] ~= nil then
                    for _, v in pairs(Config.LegalFish) do
                        if v.name == Player.PlayerData.items[k].name then
                            price = price + (v.price * Player.PlayerData.items[k].amount)
                            Player.Functions.RemoveItem(Player.PlayerData.items[k].name,
                            Player.PlayerData.items[k].amount, k)
                        end
                    end
                end
            end
            if price == 0 then
                TriggerClientEvent('QBCore:Notify', src, Lang:t("notify_error.no_fish"),"error")
            else
                Player.Functions.AddMoney("cash", price, "sold-fish")
                TriggerClientEvent('QBCore:Notify', src, Lang:t("notify.sold_fish")..price,"success")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("notify_error.no_items"),"error")
        end
    end
end)

RegisterNetEvent('tk-fishing:server:SellIllegalFish', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local price = 0
    if Player ~= nil then
        if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
            for k, v in pairs(Player.PlayerData.items) do
                if Player.PlayerData.items[k] ~= nil then
                    for _, v in pairs(Config.IllegalFish) do
                        if v.name == Player.PlayerData.items[k].name then
                            price = price + (v.price * Player.PlayerData.items[k].amount)
                            Player.Functions.RemoveItem(Player.PlayerData.items[k].name,
                            Player.PlayerData.items[k].amount, k)
                        end
                    end
                end
            end
            if price == 0 then
                TriggerClientEvent('QBCore:Notify', src, Lang:t("notify_error.no_fish"),"error")
            else
                Player.Functions.AddMoney("cash", price, "sold-fish")
                TriggerClientEvent('QBCore:Notify', src, Lang:t("notify.sold_fish")..price,"success")
            end
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t("notify_error.no_items"),"error")
        end
    end
end)

QBCore.Functions.CreateCallback("tk-fishing:server:CheckForFishingRod", function(source, cb, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local rod1 = Player.Functions.GetItemByName('homemadefishingrod')
    local rod2 = Player.Functions.GetItemByName('cheapfishingrod')
    local rod3 = Player.Functions.GetItemByName('midtierfishingrod')
    local rod4 = Player.Functions.GetItemByName('hightierfishingrod')
    local rod5 = Player.Functions.GetItemByName('masterrod')

    if rod1 or rod2 or rod3 or rod4 or rod5 then
        cb(true)
    else
        cb(false)
    end
end)