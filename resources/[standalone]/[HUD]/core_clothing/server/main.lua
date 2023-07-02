QBCore = exports["qb-core"]:GetCoreObject()

Clothing = {}

Citizen.CreateThread(
    function()
        for k, v in pairs(Config.Stores) do
            local file = LoadResourceFile(GetCurrentResourceName(), './clothing_'.. k ..'.json')
            Clothing = json.decode(file) or {}
            SaveResourceFile(GetCurrentResourceName(), './clothing_'.. k ..'.json', json.encode(Clothing), -1)
        end
    end
)

QBCore.Functions.CreateCallback(
    "core_clothing:server:getClothes",
    function(source, cb, CurrentStore)
        local Player = QBCore.Functions.GetPlayer(source)

        local file = LoadResourceFile(GetCurrentResourceName(), './clothing_'.. CurrentStore ..'.json')
        Clothing = json.decode(file) or {}

        local clothes =
            MySQL.scalar.await(
            "SELECT `bought_clothes` FROM players WHERE citizenid = :citizenid ",
            {["citizenid"] = Player.PlayerData.citizenid}
        )

        if clothes then
            clothes = json.decode(clothes) or {}
        else
            clothes = {}
        end
        if Config.UsingCoreInventory then
            clothes = {}
        end
        cb(clothes, Clothing, IsPlayerAceAllowed(source, "command"))
    end
)

RegisterCommand('CoreClothingMigrateClothingStore', function(source, args)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then
        if IsPlayerAceAllowed(source, "command") then
            local file = LoadResourceFile(GetCurrentResourceName(), './clothing.json')
            Clothing = json.decode(file) or {}
            local storeClothing = { }
            for k, v in pairs(Clothing) do
                if v.store then
                    if storeClothing[v.store] == nil then
                        storeClothing[v.store] = { }                    
                    end
                    storeClothing[v.store][k] = v
                end
            end
            for k, v in pairs(storeClothing) do
                SaveResourceFile(GetCurrentResourceName(), './clothing_'.. k ..'.json', json.encode(v), -1)
            end
            print('Migrate clothing store success')
        else
            print('Player with identifier ', Player.getIdentifier(), 'try to use the command CoreClothingMigrateClothingStore')
        end
    end
end)

RegisterServerEvent(
    "core_clothing:server:saveEdit",
    function(clothing, CurrentStore)
        Clothing = clothing
        SaveResourceFile(GetCurrentResourceName(), 'clothing_'.. CurrentStore ..'.json', json.encode(Clothing), -1)
        TriggerClientEvent("core_clothing:client:updateClothing", -1, clothing)
    end
)

RegisterServerEvent(
    "core_clothing:server:checkout",
    function(basket, basketValue, store, gender)
        local source = source
        local Player = QBCore.Functions.GetPlayer(source)

        local clothes =
            MySQL.scalar.await(
            "SELECT `bought_clothes` FROM players WHERE citizenid = :citizenid ",
            {["citizenid"] = Player.PlayerData.citizenid}
        )

        if clothes then
            clothes = json.decode(clothes) or {}
        else
            clothes = {}
        end

        local qbclothes =
            MySQL.scalar.await(
            "SELECT skin FROM playerskins WHERE citizenid = :citizenid AND active = 1 ",
            {["citizenid"] = Player.PlayerData.citizenid}
        )

        if qbclothes then
            qbclothes = json.decode(qbclothes) or {}
        else
            qbclothes = {}
        end

        if true then
            local bank = Player.Functions.GetMoney("bank")
            local sqlcomponents = qbclothes.components or {}
            local sqlProps = qbclothes.props or {}
            if bank >= basketValue then
                for k, v in pairs(basket) do
                    local info = Clothing[k]

                    local format = {}
                    if info.men then
                        if info.men.id then
                            format.mID = info.men.id
                            format.mModel = info.men.model
                            format.mTexture = info.men.texture
                        end
                        if info.woman.id then
                            format.wID = info.woman.id
                            format.wModel = info.woman.model
                            format.wTexture = info.woman.texture
                        end
                        if info.men.torso then
                            format.mTorso = info.men.torso
                        end
                        if info.woman.torso then
                            format.wTorso = info.woman.torso
                        end
                    end
                    if info.menProp then
                        if info.menProp.id then
                            format.mPropID = info.menProp.id
                            format.mPropModel = info.menProp.model
                            format.mPropTexture = info.menProp.texture
                        end
                        if info.womanProp.id then
                            format.wPropID = info.womanProp.id
                            format.wPropModel = info.womanProp.model
                            format.wPropTexture = info.womanProp.texture
                        end
                    end
                    format.image = info.image
                    if Config.UsingCoreInventory then
                        Player.Functions.AddItem(info.item, v, nil, format)
                    elseif Config.UsingFivemApperance or Config.UsingIlleniumAppearance then
                        local currentInfo = {}
                        if info.men then
                            currentInfo = info[gender]
                            for i=1, #sqlcomponents, 1 do
                                if sqlcomponents[i].component_id == currentInfo.id then
                                    sqlcomponents[i].drawable = currentInfo.model
                                    sqlcomponents[i].texture = currentInfo.texture
                                end
                            end
                            qbclothes.components = sqlcomponents
                        end
                        currentInfo = info[gender..'Prop']
                        if info.menProp then
                            for i=1, #sqlProps, 1 do
                                if sqlProps[i].prop_id == currentInfo.id then
                                    sqlProps[i].drawable = currentInfo.model
                                    sqlProps[i].texture = currentInfo.texture
                                end
                            end
                            qbclothes.props = sqlProps
                        end
                        table.insert(clothes, k)
                    else
                        if qbclothes[info.item] == nil or qbclothes[info.item].item == nil then
                            qbclothes[info.item] = { }
                        end
                        
                        if info.men then
                            if gender == "men" then
                                qbclothes[info.item].item = info.men.model
                                qbclothes[info.item].texture = info.men.texture
                                if info.men.torso then
                                    qbclothes["arms"].item = info.men.torso
                                end
                            end
                            if gender == "woman" then
                                qbclothes[info.item].item = info.woman.model
                                qbclothes[info.item].texture = info.woman.texture
                                if info.woman.torso then
                                    qbclothes["arms"].item = info.woman.torso
                                end
                            end
                        end
                        if info.menProp then
                            if gender == "men" then
                                qbclothes[info.item].item = info.menProp.model
                                qbclothes[info.item].texture = info.menProp.texture
                            end
                            if gender == "woman" then
                                qbclothes[info.item].item = info.womanProp.model
                                qbclothes[info.item].texture = info.womanProp.texture
                            end
                        end
                        table.insert(clothes, k)
                    end
                end

                if Config.EnableFreeClothWhenAlreadyBuy then
                    MySQL.update(
                        "UPDATE `players` SET `bought_clothes`= :clothes WHERE `citizenid` = :citizenid",
                        {["clothes"] = json.encode(clothes), ["citizenid"] = Player.PlayerData.citizenid},
                        function()
                        end
                    )
                end

                MySQL.update(
                    "UPDATE `playerskins` SET `skin`= :clothes WHERE `citizenid` = :citizenid",
                    {["clothes"] = json.encode(qbclothes), ["citizenid"] = Player.PlayerData.citizenid},
                    function()
                    end
                )

                Player.Functions.RemoveMoney("bank", basketValue)
                TriggerClientEvent("core_clothing:client:checkoutStatus", source, true)
            else
                TriggerClientEvent("core_clothing:client:checkoutStatus", source, false)
            end
        end        
    end
)
