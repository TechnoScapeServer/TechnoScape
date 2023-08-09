RegisterServerEvent("m-multichar-server-LoadPlayer")
AddEventHandler("m-multichar-server-LoadPlayer",function(data)
    src = source
	if QBCore.Player.Login(src, data.citizenid) then
        QBCore.Commands.Refresh(src)
        print('^2[qb-core]^7 '..GetPlayerName(src)..' (Citizen ID: '..data.citizenid..') has succesfully loaded!')
        loadHouseData()   
        Config.SetSpawnTrigger(src, data, false)
        TriggerEvent("qb-log:server:CreateLog", "joinleave", "Loaded", "green", "**".. GetPlayerName(src) .. "** ("..data.citizenid.." | "..src..") loaded..")
        TriggerClientEvent("m-multichar-server-closeNui", src)
        HSN.PlayTime.PlayTimeLogin(data.citizenid)
        SetPlayerRoutingBucket(src, 0)
	end
end)


QBCore.Functions.CreateCallback('m-multichar-server-GetCharacters', function(source, cb)
    local license = QBCore.Functions.GetIdentifier(source, 'license')
	if not license then
		DropPlayer(source, "We can nout find your license id!")
		return
	end
	chars = {}
    local result = ExecuteSql('SELECT * FROM players WHERE license = "'..license..'"')
    for i = 1, (#result), 1 do
        result[i].charinfo = json.decode(result[i].charinfo)
        result[i].money = json.decode(result[i].money)
        result[i].job = json.decode(result[i].job)
        local totalPlayedTime = HSN.PlayTime.GetTotalPlayTime(result[i].citizenid)
        result[i].totalPlayedTime = totalPlayedTime
        table.insert(chars, result[i])
    end
    cb(chars)
    steamname = GetPlayerName(source)
    steampp = GetSteamPP(source)
    TriggerClientEvent("m-multichar-set-steam-info",source, steamname, steampp, source)
end)

RegisterServerEvent("m-multichar-server-CreateChar")
AddEventHandler("m-multichar-server-CreateChar",function(data)
    local newData = {}
    src = source
    newData.cid = data.cid
    newData.charinfo = data
    if QBCore.Player.Login(src, false, newData) then
        QBCore.Commands.Refresh(src)
        loadHouseData()
        Config.SetSpawnTrigger(src, newData, true)
        TriggerClientEvent("m-multichar-server-closeNui", src)
        HSN.GiveStarterItems(src)
        Citizen.Wait(500)
        local ply = QBCore.Functions.GetPlayer(src)
        HSN.PlayTime.PlayTimeLogin(ply.PlayerData.citizenid)
        SetPlayerRoutingBucket(src, 0)
	end
end)

RegisterServerEvent('m-multichar:server:deleteCharacter')
AddEventHandler('m-multichar:server:deleteCharacter', function(citizenid)
    local src = source
    QBCore.Player.DeleteCharacter(src, citizenid)
end)

QBCore.Functions.CreateCallback("m-multichar:server:getSkin", function(source, cb, cid)
    local src = source
    if (Config.Clothes == "default") then
        local result = ExecuteSql('SELECT * FROM playerskins WHERE citizenid= "'..cid..'" AND active = 1')
        if result[1] ~= nil then
            cb(result[1].model, result[1].skin)
        else
            cb(nil)
        end
    elseif (Config.Clothes == "illenium-appearance") then
        local result = ExecuteSql('SELECT * FROM playerskins WHERE citizenid = "'..cid..'" AND active = 1')
		if result[1] ~= nil then
			cb(json.decode(result[1].skin))
		else
			cb(nil)
		end
    end
end)


HSN.GiveStarterItems = function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    for k, v in pairs(QBCore.Shared.StarterItems) do
        local info = {}
        if v.item == "id_card" then
            info.citizenid = Player.PlayerData.citizenid
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.gender = Player.PlayerData.charinfo.gender
            info.nationality = Player.PlayerData.charinfo.nationality
        elseif v.item == "driver_license" then
            info.firstname = Player.PlayerData.charinfo.firstname
            info.lastname = Player.PlayerData.charinfo.lastname
            info.birthdate = Player.PlayerData.charinfo.birthdate
            info.type = "A1-A2-A | AM-B | C1-C-CE"
        end
        Player.Functions.AddItem(v.item, 1, false, info)
    end
end


loadHouseData = function()
    local HouseGarages = {}
    local Houses = {}
    local result = ExecuteSql("SELECT * FROM houselocations")
	if result[1] ~= nil then
		for k, v in pairs(result) do
			local owned = false
			if tonumber(v.owned) == 1 then
				owned = true
			end
			local garage = v.garage ~= nil and json.decode(v.garage) or {}
			Houses[v.name] = {
				coords = json.decode(v.coords),
				owned = v.owned,
				price = v.price,
				locked = true,
				adress = v.label, 
				tier = v.tier,
				garage = garage,
				decorations = {},
			}
			HouseGarages[v.name] = {
				label = v.label,
				takeVehicle = garage,
			}
		end
	end
	TriggerClientEvent("qb-garages:client:houseGarageConfig", -1, HouseGarages)
	TriggerClientEvent("qb-houses:client:setHouseConfig", -1, Houses)
end

QBCore.Commands.Add("changecharacter", "Change The Character", {}, false, function(source, args)
    QBCore.Player.Logout(source)
    TriggerClientEvent('m-multichar-client-Load', source)
end)