local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

QBCore = exports["qb-core"]:GetCoreObject()

Clothing = {}
gender = "none"
CurrentStore = nil
interactive = false
OpenedCheckout = false
EditingClothing = {}

cam = nil
cam2 = nil

loadDict = function(dict)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Wait(10)
    end
end

function nearStore()
    local coords = GetEntityCoords(PlayerPedId())

    for k, v in pairs(Config.Stores) do
        for __, g in ipairs(v.Coords) do
            if #(coords - g) < v.Radius then
                return k
            end
        end
    end

    return nil
end

function zoomPlayer(bool)
    local camTime = 400
    if bool then
        local offset = GetOffsetFromEntityInWorldCoords(PlayerPedId(), -1.0, 3.0, 0.0)
        local offset2 = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 1.0, 2.0, 0.0)

        FreezeEntityPosition(PlayerPedId(), true)

        cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", offset2, 0.0, 0.0, 0, 60.00, false, 0)
        PointCamAtEntity(cam, PlayerPedId(), 0, 0, 0, true)

        SetCamFov(cam, 49.0)
        SetCamActiveWithInterp(cam, cam2, camTime, true, true)
        RenderScriptCams(true, false, 1, true, true)

        cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", offset, 0.0, 0.0, 0, 60.00, false, 0)
        PointCamAtEntity(cam2, PlayerPedId(), 0, 0, 0, true)
        SetCamFov(cam2, 35.0)
        SetCamActiveWithInterp(cam2, cam, camTime, true, true)

        if DoesCamExist(cam) then
            DestroyCam(cam, true)
        end
    else
        NetworkClearClockTimeOverride()
        DisplayRadar(true)

        SetTimecycleModifier("default")
        DestroyCam(cam, true)
        RenderScriptCams(false, false, 1, true, true)
        FreezeEntityPosition(PlayerPedId(), false)
    end
end

function enterStore(store)
    local PlayerData = QBCore.Functions.GetPlayerData()
    Citizen.Wait(1000)
    SendNUIMessage(
        {
            type = "enterStore",
            store = store,
            config = Config
        }
    )
end

RegisterNetEvent(
    "core_clothing:client:sendMessage",
    function(msg)
        SendTextMessage(msg)
    end
)

RegisterNetEvent(
    "core_clothing:client:checkoutStatus",
    function(value)
        Citizen.Wait(700)
        SendNUIMessage(
            {
                type = "checkoutStatus",
                status = value
            }
        )
    end
)

RegisterNUICallback(
    "checkout",
    function(data)
        TriggerServerEvent("core_clothing:server:checkout", data["basket"], data["value"], CurrentStore, gender)
    end
)

local pedRotation

RegisterNUICallback(
    "registerMouse",
    function(data)
        pedRotation = GetEntityHeading(PlayerPedId())
    end
)

function setModel(model)
    if IsModelInCdimage(model) and IsModelValid(model) then
        RequestModel(model)
        while not HasModelLoaded(model) do
            Citizen.Wait(0)
        end
        SetPlayerModel(PlayerId(), model)
        SetModelAsNoLongerNeeded(model)
    end
end

function setEditing(part)
    setNormal()
    local prop = string.find(part, 'Prop')
    local model = GetEntityModel(PlayerPedId())

    if (model == GetHashKey("mp_f_freemode_01")) then
        if not prop then
            if EditingClothing["wID"] and EditingClothing["wID"] > 0 then
                SetPedComponentVariation(
                    PlayerPedId(),
                    EditingClothing["wID"] or 1,
                    EditingClothing["wModel"] or 0,
                    EditingClothing["wTexture"] or 1,
                    0
                )
                if EditingClothing["wTorso"] then
                    SetPedComponentVariation(PlayerPedId(), 3, EditingClothing["wTorso"] or 15, 0, 0)
                end
            end
        else
            if EditingClothing["wPropID"] and EditingClothing["wPropID"] > -1 then
                SetPedPropIndex(
                    PlayerPedId(),
                    EditingClothing["wPropID"] or -1,
                    EditingClothing["wPropModel"] or 1,
                    EditingClothing["wPropTexture"] or 1,
                    0
                )
            end
        end
    end
    if (model == GetHashKey("mp_m_freemode_01")) then
        if not prop then
            if EditingClothing["mID"] and EditingClothing["mID"] > 0 then
                SetPedComponentVariation(
                    PlayerPedId(),
                    EditingClothing["mID"] or 1,
                    EditingClothing["mModel"] or 1,
                    EditingClothing["mTexture"] or 1,
                    0
                )
                if EditingClothing["mTorso"] then
                    SetPedComponentVariation(PlayerPedId(), 3, EditingClothing["mTorso"] or 15, 0, 0)
                end
            end
        else
            if EditingClothing["mPropID"] and EditingClothing["mPropID"] > -1 then
                SetPedPropIndex(
                    PlayerPedId(),
                    EditingClothing["mPropID"] or -1,
                    EditingClothing["mPropModel"] or 1,
                    EditingClothing["mPropTexture"] or 1,
                    0
                )
            end
        end
    end
end

RegisterNetEvent(
    "core_clothing:client:updateClothing",
    function(clothing)
        Clothing = clothing
        SendNUIMessage(
            {
                type = "updateClothing",
                clothing = Clothing
            }
        )
    end
)

function setNormal()
    local ped = PlayerPedId()

    local model = GetEntityModel(ped)

    if (model == GetHashKey("mp_f_freemode_01")) then
        SetPedComponentVariation(ped, 1, 0, 0, 0)

        SetPedComponentVariation(ped, 11, 15, 0, 0)
        SetPedComponentVariation(ped, 3, 15, 0, 0)
        SetPedComponentVariation(ped, 4, 15, 0, 0)
        SetPedComponentVariation(ped, 6, 5, 0, 0)
        SetPedComponentVariation(ped, 7, 0, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 8, 15, 0, 0)
    end
    if (model == GetHashKey("mp_m_freemode_01")) then
        SetPedComponentVariation(ped, 1, 0, 0, 0)

        SetPedComponentVariation(ped, 11, 15, 0, 0)
        SetPedComponentVariation(ped, 3, 15, 0, 0)
        SetPedComponentVariation(ped, 4, 12, 0, 0)
        SetPedComponentVariation(ped, 6, 5, 0, 0)
        SetPedComponentVariation(ped, 7, 0, 0, 0)
        SetPedComponentVariation(ped, 9, 0, 0, 0)
        SetPedComponentVariation(ped, 8, 15, 0, 0)
    end
    ClearPedProp(ped,0)
    ClearPedProp(ped,1)
    ClearPedProp(ped,2)
    ClearPedProp(ped,6)
    ClearPedProp(ped,7)
end

RegisterNUICallback(
    "deleteEdit",
    function(data)
        local id = data["id"]

        local exist = false

        if Clothing[id] then
            Clothing[id] = nil
            exist = true
            TriggerServerEvent("core_clothing:server:saveEdit", Clothing, CurrentStore)
        end

        Citizen.Wait(700)
        SendNUIMessage(
            {
                type = "checkoutStatus",
                status = exist
            }
        )
    end
)

RegisterNUICallback("saveEdit", function(data)
        local id = data["id"]
        local price = tonumber(data["price"])
        local label = data["label"]
        local category = data["category"]
        local item = checkItem(data['item'], data['gender'])
        local image = data["image"]
        if not price then
            Citizen.Wait(700)
            SendNUIMessage(
                {
                    type = "checkoutStatus",
                    status = false
                }
            )
            return
        end
        local key = "clothing-" .. math.random(0, 9999)
        if Clothing[id] then
            key = id
        end
        Clothing[key] = {
            label = label,
            category = false,
            parent = category,
            price = price,
            item = item,
            gender = data['gender'],
            image = image,
            store = CurrentStore
        }
        local ClothingItems = {
            ['Clothes'] = {
                    [1]  = "mask",
                    [4]  = "pants",
                    [5]  = "bag",
                    [6]  = "shoes",
                    [7]  = "accessory",
                    [8]  = "t-shirt", -- or tshirt
                    [9]  = "vest",
                    [11] = "torso"
            },
            ['Accessories'] = {
                    [0]= "hat",
                    [1]= "glass",
                    [2]= "ear",
                    [6]= "watch",
                    [7]= "bracelet"
            },
        }
        if getKey(item, ClothingItems) == 'Clothes' or item == 'tshirt' or item == 't-shirt' then
            Clothing[key].men = {
                id = EditingClothing["mID"] or 1,
                model = EditingClothing["mModel"] or 1,
                texture = EditingClothing["mTexture"] or 1,
                torso = EditingClothing["mTorso"]
            }
            Clothing[key].woman = {
                id = EditingClothing["wID"] or 1,
                model = EditingClothing["wModel"] or 1,
                texture = EditingClothing["wTexture"] or 1,
                torso = EditingClothing["wTorso"]
            }
        else
            Clothing[key].menProp = {
                id = EditingClothing["mPropID"] or 1,
                model = EditingClothing["mPropModel"] or -1,
                texture = EditingClothing["mPropTexture"] or 1,
            }
            Clothing[key].womanProp = {
                id = EditingClothing["wPropID"] or 1,
                model = EditingClothing["wPropModel"] or -1,
                texture = EditingClothing["wPropTexture"] or 1,
            }
        end
        TriggerServerEvent("core_clothing:server:saveEdit", Clothing, CurrentStore)
        Citizen.Wait(700)
        SendNUIMessage(
            {
                type = "checkoutStatus",
                status = true
            }
        )
        setNormal()
    end
)

function getKey(value, tbl)
    for _, val in pairs(tbl) do
        for key, v in pairs(val) do
            if v == value then
                return _
            end
        end
    end
    return nil
end
RegisterNUICallback(
    "updateValueNoChange",
    function(data)
        local part = data["part"]
        local value = tonumber(data["value"])

        EditingClothing[part] = value
    end
)
RegisterNUICallback(
    "resetOthersClothes",
    function(data)
        local parts = data['parts']
        for _, v in pairs(parts) do
            EditingClothing[v] = 0
        end
    end
)
RegisterNUICallback(
    "updateValue",
    function(data)
        local part = data["part"]
        local value = tonumber(data["value"])
        EditingClothing[part] = value

        if string.sub(part, 1, 1) == "w" then
            setModel("mp_f_freemode_01")
        else
            setModel("mp_m_freemode_01")
        end
        setEditing(part)
    end
)

RegisterNUICallback(
    "hoverClothes",
    function(data)
        local clothes = data["clothes"]
        if not clothes then
            setNormal()
            return
        end

        if Config.Stores[CurrentStore].Clothes[clothes] then
            return
        end
        local model = GetEntityModel(PlayerPedId())
        if (model == GetHashKey("mp_f_freemode_01")) then
            local d = Clothing[clothes].woman or {}
            local a = Clothing[clothes].womanProp or {}
            if d.id then
                SetPedComponentVariation(PlayerPedId(), d.id, d.model, d.texture, 0)
            end
            if d.torso then
                SetPedComponentVariation(PlayerPedId(), 3, d.torso, 0, 0)
            end
            if a.id then
                SetPedPropIndex(PlayerPedId(),a.id,a.model,a.texture,0)
            end

        end
        if (model == GetHashKey("mp_m_freemode_01")) then
            local d = Clothing[clothes].men or {}
            local a = Clothing[clothes].menProp or {}
            if d.id then
                SetPedComponentVariation(PlayerPedId(), d.id, d.model, d.texture, 0)
            end
            if d.torso then
                SetPedComponentVariation(PlayerPedId(), 3, d.torso, 0, 0)
            end
            if a.id then
                SetPedPropIndex(PlayerPedId(),a.id,a.model,a.texture,0)
            end
        end
    end
)

RegisterNUICallback(
    "mouseMovement",
    function(data)
        local x = data["x"] / 10
        local y = data["y"] / 10

        SetEntityHeading(PlayerPedId(), pedRotation - x)
    end
)

function ReloadSkin()
    if Config.UsingFivemApperance then
        QBCore.Functions.TriggerCallback('fivem-appearance:server:getAppearance', function(appearance)
            if appearance then
                exports['fivem-appearance']:setPlayerAppearance(appearance)
            end
        end)
    elseif Config.UsingIlleniumAppearance then
        lib.callback("illenium-appearance:server:getAppearance", false, function(appearance)
            if appearance then
                exports['illenium-appearance']:setPlayerAppearance(appearance)
            end
        end)    
    else
        TriggerServerEvent("qb-clothes:loadPlayerSkin")
    end 
end

RegisterNUICallback(
    "close",
    function(data)
        SetNuiFocus(false, false)
        zoomPlayer(false)

        if gender == "woman" then
            setModel("mp_f_freemode_01")
            ReloadSkin()
        else
            setModel("mp_m_freemode_01")
            ReloadSkin()
        end

        Citizen.Wait(500)

        if Config.UsingCoreInventory then
            TriggerServerEvent("core_inventory:server:loadClothes")           
        end
    end
)

Citizen.CreateThread(function()

        for k, v in pairs(Config.Stores) do

            if v.Blip then

             for __, g in ipairs(v.Coords) do
           
                local blip = AddBlipForCoord(g)

                SetBlipSprite(blip, v.Blip)
                SetBlipScale(blip, 0.8)
                SetBlipColour(blip, v.BlipColor)
                SetBlipAsShortRange(blip, true)

                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(v.Label)
                EndTextCommandSetBlipName(blip)

            end

        end
            
        end
end)

Citizen.CreateThread(
    function()
        while true do
            if CurrentStore then
                if IsDisabledControlJustReleased(0, 38) then
                    QBCore.Functions.TriggerCallback(
                        "core_clothing:server:getClothes",
                        function(clothes, clothing, perm)
                            Clothing = clothing
                            setNormal()
                            SetNuiFocus(true, true)
                            local woman = false
                            local men = false

                            local model = GetEntityModel(PlayerPedId())

                            if (model == GetHashKey("mp_f_freemode_01")) then
                                woman = true
                                gender = "woman"
                            else
                                men = true
                                gender = "men"
                            end

                            SendNUIMessage(
                                {
                                    type = "openStore",
                                    editing = perm,
                                    clothing = clothing,
                                    clothes = clothes,
                                    men = men,
                                    woman = woman,
                                    UsingCoreInventory = Config.UsingCoreInventory,
                                    CoreClothingItems = Config.CoreClothingItems
                                }
                            )
                            zoomPlayer(true)
                        end
                    , CurrentStore)
                end

                Citizen.Wait(0)
            else
                Citizen.Wait(1000)
            end
        end
    end
)

Citizen.CreateThread(
    function()
        while true do
            local nearStore = nearStore()

            if nearStore and not CurrentStore then
                enterStore(nearStore)
                CurrentStore = nearStore
            elseif not nearStore then
                CurrentStore = nil
                CurrentSection = nil
                interactive = false
                SendNUIMessage({type = "closeStore"})
            end

            if CurrentStore then
                local PlayerData = QBCore.Functions.GetPlayerData()
                SendNUIMessage(
                    {
                        type = "updateMoney",
                        bank = PlayerData.money["bank"],
                        money = PlayerData.money["cash"]
                    }
                )
            end

            Citizen.Wait(1000)
        end
    end
)


function checkItem(itemName, gender)
    if itemName == nil or itemName == 'empty' then
        local clothId = EditingClothing["mID"]
        local propsId = EditingClothing["mPropID"]

        if gender == 'women' then
            clothId = EditingClothing["wID"]
            propsId = EditingClothing["wPropID"]   
        end

        if clothId > 0 then
            itemName = Config.CoreClothingItems['Clothes'][clothId]
        else
            itemName = Config.CoreClothingItems['Accessories'][propsId]
        end
    end
    return itemName
end