itemLabels = {}

function getLabel(item)
    if itemLabels[item] then
        return itemLabels[item]
    else
        if Config.itemLabels[item] then
            return Config.itemLabels[item]
        else
            print("item "..item.." does not exist")
            return item.."-ERROR"
        end
    end
end
---------- ESX RELATED

if Config.Framework == "ESX" then

	ESX = exports['es_extended']:getSharedObject()

	-- ESX = nil  
	-- TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

    function loadLabels()
        if Config.inventory == 'ox_inventory' then
            for k,v in pairs(exports.ox_inventory:Items()) do
                itemLabels[k] = v.label
            end
        else
            itemLabels = Config.itemLabels
        end
    end

    CreateThread(function()
		Wait(1000)
		loadLabels()
    end)

	function GetPlayerFromId(source)
		return ESX.GetPlayerFromId(source)
	end

	function HasEnoughtInventoryItem(xPlayer,item,count)
		local itemAmount = xPlayer.getInventoryItem(item)

		if not itemAmount then
			print("ITEM "..item.." IS NOT REGISTERED IN YOUR SERVER")
			return false
		end

		if itemAmount and itemAmount.count and itemAmount.count >= count then
			return true
		end

		return false
	end

	function GetItemCount(xPlayer,item)
		return xPlayer.getInventoryItem(item).count
	end

	function RemoveInventoryItem(xPlayer,item,count) 
		xPlayer.removeInventoryItem(item,count)
	end


	function GetFailedAdd(xPlayer,list)
		for k,v in ipairs(list) do
			if xPlayer.canCarryItem(v.name,v.count) then
				xPlayer.addInventoryItem(v.name,v.count)
			else
				return k
			end
		end

		return nil
	end

	function AddItemList(xPlayer,list)
		local failedAdd = GetFailedAdd(xPlayer,list)

		if failedAdd then
			for i = 1, failedAdd do
				local item = list[i]
				xPlayer.removeInventoryItem(item.name,item.count)
			end
		else
			return true
		end
	end

	function AddInventoryItem(xPlayer,item,count) 
		xPlayer.addInventoryItem(item,count)
	end

	function GetIdentifier(xPlayer)
		return xPlayer.getIdentifier()
	end

	function ShowNotification(source,text)
		TriggerClientEvent('esx:showNotification', source, text)
	end

	for k,v in pairs(Config.Models) do
		if v.item and not v.notUseable then
    		ESX.RegisterUsableItem(v.item, function(source)
        		local item = v.item
				local hash = k
        		UseItem(item,hash,source)
    		end)
		end
	end

	function UseItem(item,hash,source)
    	TriggerClientEvent('hrs_base_building:UseItem', source,item,hash)
	end

	ESX.RegisterCommand({'clearbase'}, 'admin', function(xPlayer, args, showError)
		if not args.radius then args.radius = 4 end
		
		local coords = xPlayer.getCoords()
		local pedCoords = vector3(coords.x,coords.y,coords.z)
		for k,v in pairs(props) do
			
			if GetDistanceXY(pedCoords,v.coords) < tonumber(args.radius) then
				DeleteProp(k)
			end
		end
	
		TriggerEvent('esx:admincommandlog',xPlayer.source,args,'clearbase')
	end, false, {help = 'clear base', validate = false, arguments = {
		{name = 'radius', help = "radius", type = 'any'}
	}})

elseif Config.Framework == "QB" then
	
	QBCore = exports['qb-core']:GetCoreObject()

	function loadLabels()
        for k,v in pairs(QBCore.Shared.Items) do
            itemLabels[k] = v.label
        end
    end

	CreateThread(function()
		Wait(1000)
		loadLabels()
    end)

	function GetPlayerFromId(source)
		return QBCore.Functions.GetPlayer(source)
	end

	function HasEnoughtInventoryItem(xPlayer,item,count)
		local itemAmount = xPlayer.Functions.GetItemByName(item)
		if itemAmount and itemAmount.amount >= count then
			return true
		else
			return false
		end
	end

	function GetItemCount(xPlayer,item)
		local itemAmount = xPlayer.Functions.GetItemByName(item)
		if itemAmount and itemAmount.amount then
			return itemAmount.amount
		else
			return 0
		end
	end

	function RemoveInventoryItem(xPlayer,item,count) 
		xPlayer.Functions.RemoveItem(item,count)
	end

	function GetFailedAdd(xPlayer,list)
		for k,v in ipairs(list) do	
			local bool = xPlayer.Functions.AddItem(v.name,v.count)
			if not bool then
				return k
			end
		end

		return nil
	end

	function AddItemList(xPlayer,list)
		local failedAdd = GetFailedAdd(xPlayer,list)

		if failedAdd then
			for i = 1, failedAdd do
				local item = list[i]
				xPlayer.Functions.RemoveItem(item.name,item.count)
			end
		else
			return true
		end
	end

	function AddInventoryItem(xPlayer,item,count) 
		xPlayer.Functions.AddItem(item,count)
	end

	function GetIdentifier(xPlayer)
		local license = QBCore.Functions.GetIdentifier(xPlayer.PlayerData.source, 'license')
		return license
	end

	function ShowNotification(source,text)
		TriggerClientEvent('QBCore:Notify', source, text)
	end

	for k,v in pairs(Config.Models) do
		if v.item then
			QBCore.Functions.CreateUseableItem(v.item, function(source)
				local src = source
				local item = v.item
				local hash = k
				TriggerClientEvent('hrs_base_building:UseItem', src,item,hash)
    		end)
		end
	end

	function UseItem(item,hash,source)
    	TriggerClientEvent('hrs_base_building:UseItem', source,item,hash)
	end


	QBCore.Commands.Add('clearbase', 'Clears nearby structures (admin)', {}, false, function(xPlayer, args)
        if not args[1] then args[1] = 4 end
        local ped = GetPlayerPed(xPlayer)
        local coords = GetEntityCoords(ped)
        local pedCoords = vector3(coords.x,coords.y,coords.z)
        for k,v in pairs(props) do
            
            if GetDistanceXY(pedCoords,v.coords) < tonumber(args[1]) then
                DeleteProp(k)
            end
        end
    end, 'admin')

end

function getReturnMaterials(k)
	local materialsList = Config.Models[props[k].hash].crafting
	local materialsPercentage = (props[k].life / Config.Models[props[k].hash].life)

	if materialsPercentage > 0.95 then
		materialsList = {{name = Config.Models[props[k].hash].item,count = 1}}
		materialsPercentage = 1.0
	end

	return materialsList , materialsPercentage
end

function getUpgradeMaterials(upgrade)
	local materialsList = Config.Models[upgrade].crafting
	
	return materialsList
end
  
function getRepairMaterials(k)
	local materialsList = Config.Models[props[k].hash].crafting
	local materialsPercentage = (1.0 - props[k].life / Config.Models[props[k].hash].life)

	return materialsList , materialsPercentage
end




--------- CREATING PROPS and DELETE -------------


if Config.inventory == 'ox_inventory' then
	RegisterNetEvent('hrs_base_building:oxLoad', function(id,hash)
		if props[id] then
			local date = props[id].date

			local text = 'HRS'..hash..""..id..""..date
			text = string.gsub(text, "-", "n")
			text = string.gsub(text, ":", "")
			text = string.gsub(text, "_", "")
			text = string.gsub(text, "/", "")

			if Config.usingOldInventoryMethod then
				text = 'HRS_'..hash.."_"..id.."_"..date
			end

			exports.ox_inventory:RegisterStash(tostring(text), getLabel(Config.Models[hash].item), Config.Models[hash].slots, Config.Models[hash].weight, false)
		end
	end)
end



function OnPropDelete(id,hash,owner,date)
	if hash and Config.Models[hash].type == "storages" then
		if Config.inventory == 'ox_inventory' then
			local text = 'HRS'..hash..""..id..""..date
			text = string.gsub(text, "-", "n")
			text = string.gsub(text, ":", "")
			text = string.gsub(text, "_", "")
			text = string.gsub(text, "/", "")

			if Config.usingOldInventoryMethod then
				text = 'HRS_'..hash.."_"..id.."_"..date
			end

			exports.ox_inventory:ClearInventory(tostring(text))
		elseif Config.inventory == 'qb_inventory' then 
			local text = 'HRS'..hash..""..id..""..date
			text = string.gsub(text, "-", "n")
			text = string.gsub(text, ":", "")
			text = string.gsub(text, "_", "")
			text = string.gsub(text, "/", "")

			if Config.usingOldInventoryMethod then
				text = 'HRS'..hash..""..id..""..date
				text = string.gsub(text, "-", "_")
			end

			MySQL.Async.execute('DELETE FROM stashitems WHERE stash = @stash', {
				['@stash'] = tostring(text)
			})
		end
	end
end

function OnPropCreate(id,hash,owner,date)
	-- if hash and Config.Models[hash].type == "storages" then
	-- 	local text = 'HRS'..hash..""..id..""..date
	-- 	text = string.gsub(text, "-", "n")
	-- 	text = string.gsub(text, ":", "")
	-- 	text = string.gsub(text, "_", "")
	-- 	text = string.gsub(text, "/", "")
	-- 	text = "stackChest:" .. text

	-- 	MySQL.Async.execute('INSERT INTO summerz_entitydata (dkey, dvalue) VALUES (@dkey, @dvalue)',
	-- 	{
	-- 		['@dkey'] = text,
	-- 		['@dvalue'] = json.encode({})
	-- 	}, function()
		
	-- 	end)
	-- end
end

-------------------- DATABASE 

function ResetProp(k)
	if props[k] then
		props[k].life = Config.Models[props[k].hash].life
		
		MySQL.Async.execute('UPDATE props SET life = @life WHERE id = @id', {
			['@id'] = tonumber(k),
			['@life'] = props[k].life
		})
	end
end



------------ CHECK IF PROP IS MISSING FROM CONFIG --------------------------------------------------------------------

local notFoundProps = {}
local notFoundHashList = ""
local notFoundNumber = 0
function HashNotFoundDatabase(id,hash)
	notFoundProps[id] = hash
	notFoundHashList = notFoundHashList..hash..","
	notFoundNumber = notFoundNumber + 1
end

local notFoundCheckConsole = true
RegisterCommand("clearnotfound", function(source)	
    if source == 0 then
		if notFoundCheckConsole then
			notFoundCheckConsole = false
			print("[^3WARNING^7] Are you sure you want to remove ^5"..notFoundNumber.."^7 Objects from your database? If you do repeat the command")
		else
			for k,v in pairs(notFoundProps) do
				DeletePropJustDatabase(k)
			end
			print("[^2INFO^7] Objects removed from database")
		end
	end
end)

function DeletePropJustDatabase(id)
	MySQL.Async.execute('DELETE FROM props WHERE id = @id', {
		['@id'] = tonumber(id)
	})
end

function NotFoundCheck()
	if notFoundNumber > 0 then
		print("[^3WARNING^7] Seems like some ^5prop models^7 might have been ^5removed^7 from your ^5Config.Models^7")
		print("[^3WARNING^7] A total of ^5"..notFoundNumber.."^7 database props don't have their models in the ^5Config.Models^7")
		print("[^3WARNING^7] This is the list of missing hashes: ^5"..notFoundHashList.."^7")
		print("[^3WARNING^7] If you really removed this hashes from the ^5Config.Models^7 you can clear the database objects using the command ^5'clearnotfound'^7 on your server console^7")
	end
end


---------------------------------------------------------------------------------

function DeleteProp(id)
	local hash = props[id].hash
	local owner = props[id].identifier
	local date = props[id].date
	
	if props[id].dead then
		hash = props[id].dead
	end

	if props[id] then
		props[id] = nil
		TriggerClientEvent('hrs_base_building:removeprop', -1,id)
	end

	MySQL.Async.execute('DELETE FROM props WHERE id = @id', {
		['@id'] = tonumber(id)
	})

	OnPropDelete(id,hash,owner,date)
end

MySQL.ready(function()
	MySQL.Async.fetchAll("SELECT * FROM props", {}, function(result)		
		for i = 1,#result do
			FirstPropGeneration(result[i])	
		end
		NotFoundCheck()
	end)

	

	loadCrews()

	TriggerClientEvent("hrs_base_building:juststarted",-1)
end)

function addToDatabase(id)
	local propInfo = props[id]

	OnPropCreate(propInfo.id,propInfo.hash,propInfo.identifier,propInfo.date)

	
	MySQL.Async.execute('INSERT INTO props (id, hash, x, y, z, heading, rotx, roty, rotz, fuel, identifier, life, code, date, bucket) VALUES (@id, @hash, @x, @y, @z, @heading, @rotx, @roty, @rotz, @fuel, @identifier, @life, @code, @date, @bucket)',
	{
		['@id'] = tonumber(id),
		['@hash'] = propInfo.hash,
		['@x'] = propInfo.coords.x,
		['@y'] = propInfo.coords.y,
		['@z'] = propInfo.coords.z,
		['@heading'] = propInfo.heading,
		['@rotx'] = propInfo.rotation.x,
		['@roty'] = propInfo.rotation.y,
		['@rotz'] = propInfo.rotation.z,
		['@fuel'] = propInfo.fuel,
		['@identifier'] = propInfo.identifier,
		['@life'] = propInfo.life,
		['@code'] = propInfo.code,
		['@date'] = propInfo.date,
		['@bucket'] = propInfo.bucket,
	}, function()
	
	end)
end

function updateHashDatabase(propid)
	MySQL.Async.execute('UPDATE props SET life = @life, hash = @hash WHERE id = @id', {
		['@id'] = tonumber(propid),
		['@hash'] = props[propid].hash,
		['@life'] = props[propid].life
	})
end

function updateMetadataDatabase(propid)
	MySQL.Async.execute('UPDATE props SET metadata = @metadata WHERE id = @id', {
		['@id'] = tonumber(propid),
		['@metadata'] = json.encode(props[propid].metadata)
	})
end

function setMetadata(propid,metadata)
	propsMetadata[propid] = metadata
	updateMetadataDatabase(propid)	
end

function getMetadata(propid)
	return propsMetadata[propid]
end

function updateLifeDatabase(propid)
	MySQL.Async.execute('UPDATE props SET life = @life WHERE id = @id', {
		['@id'] = tonumber(propid),
		['@life'] = props[propid].life
	})
end

function updateFuelDatabase(propid)
	MySQL.Async.execute('UPDATE props SET fuel = @fuel WHERE id = @id', {
		['@id'] = tonumber(propid),
		['@fuel'] = props[propid].fuel
	})
end

function updateLifeANDFuelDatabase(propid)
	MySQL.Async.execute('UPDATE props SET life = @life, fuel = @fuel WHERE id = @id', {
		['@id'] = tonumber(propid),
		['@life'] = props[propid].life,
		['@fuel'] = props[propid].fuel
	})
end

function updateCode(propid)
	MySQL.Async.execute('UPDATE props SET code = @code WHERE id = @id', {
		['@id'] = tonumber(propid),
		['@code'] = props[propid].code
	})
end

function saveOnStopScript()
	print("SAVING ON DATABASE")
	for k,v in pairs(props) do
		MySQL.Async.execute('UPDATE props SET life = @life, fuel = @fuel WHERE id = @id', {
			['@id'] = tonumber(k),
			['@life'] = props[k].life,
			['@fuel'] = props[k].fuel
		})
	end
end

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then 
		saveOnStopScript()
	end    
end)

AddEventHandler('txAdmin:events:scheduledRestart', function(eventData)
    if eventData.secondsRemaining == 60 then
		saveOnStopScript()
	end    
end)


----------------------- CREWS ------------------------------------
crews = {}
crewByIdentifier = {}
onlineIdentifiers = {}
invites = {}

RegisterNetEvent('hrs_base_building:getCrewS')
AddEventHandler('hrs_base_building:getCrewS', function()
	local _source = source
	local xPlayer = GetPlayerFromId(_source)
	local identifier = GetIdentifier(xPlayer)

	onlineIdentifiers[identifier] = source

	local sendCrew = nil
	if crewByIdentifier[identifier] then
		sendCrew = crews[crewByIdentifier[identifier]]
	end

	TriggerClientEvent('hrs_base_building:setCrewC',_source,sendCrew)
	TriggerClientEvent('hrs_base_building:setInvitesC',_source,invites[identifier])
end)

AddEventHandler('playerDropped', function ()
	for k,v in pairs(onlineIdentifiers) do
		if v == source then
			onlineIdentifiers[k] = nil
			break
		end
	end
end)

function loadCrews()
	MySQL.Async.fetchAll("SELECT * FROM crews", {}, function(result)		
		for k,v in ipairs(result) do
			crews[v.owner] = {data = json.decode(v.data),label = v.label,owner = v.owner}
			for k2,v2 in pairs(crews[v.owner].data) do
				crewByIdentifier[k2] = v.owner
			end
		end
	end)
end

RegisterNetEvent('hrs_base_building:createCrew')
AddEventHandler('hrs_base_building:createCrew', function(label)
	local _source = source
	local xPlayer = GetPlayerFromId(_source)
	local identifier = GetIdentifier(xPlayer)
	local name = GetPlayerName(source)

	if not label then
		label = name.."'s Crew"
	end

	if not crews[identifier] and not crewByIdentifier[identifier] then
		crews[identifier] = {
			label = label,
			data = {
				[identifier] = name
			},
			owner = identifier
		}

		crewByIdentifier[identifier] = identifier

		TriggerClientEvent('hrs_base_building:setCrewC',_source,crews[identifier])
		ShowNotification(_source,Config.Locales["crew_created"])

		MySQL.Async.execute('INSERT INTO crews (owner, label, data) VALUES (@owner, @label, @data)',
		{
			['@owner'] = identifier,
			['@label'] = label,
			['@data'] = json.encode(crews[identifier].data)
		})
	end
end)

RegisterNetEvent('hrs_base_building:deleteCrew')
AddEventHandler('hrs_base_building:deleteCrew', function()
	local _source = source
	local xPlayer = GetPlayerFromId(_source)
	local identifier = GetIdentifier(xPlayer)

	if crews[identifier] then
		for k, v in pairs(crews[identifier].data) do
			crewByIdentifier[k] = nil
			if onlineIdentifiers[k] then
				TriggerClientEvent('hrs_base_building:setCrewC',onlineIdentifiers[k],nil)

				ShowNotification(onlineIdentifiers[k],Config.Locales["crew_deleted"])
			end
		end

		crews[identifier] = nil

		MySQL.Async.execute('DELETE FROM crews WHERE owner = @owner', {
			['@owner'] = identifier
		})
	end
end)

RegisterNetEvent('hrs_base_building:addToCrew')
AddEventHandler('hrs_base_building:addToCrew', function(id)
	local _source = source
	local xPlayer = GetPlayerFromId(_source)
	local identifier = GetIdentifier(xPlayer)

	local toAddSource = id 
	local yPlayer = GetPlayerFromId(toAddSource)
	local yidentifier = GetIdentifier(yPlayer)

	if crewByIdentifier[yidentifier] then
		ShowNotification(_source,Config.Locales["crew_player_on_crew"])
	else
		if crews[identifier] then
			local limit = false
			if Config.maxCrewMembers then
				local count = 0
				for k,v in pairs(crews[identifier].data) do
					count = count + 1
					if count >= Config.maxCrewMembers then
						limit = true
						break
					end
				end
			end

			if limit then
				ShowNotification(_source,Config.Locales["crew_crew_limit"])
			else
				if not invites[yidentifier] then invites[yidentifier] = {} end

				if not invites[yidentifier][identifier] then
					invites[yidentifier][identifier] = crews[identifier].label
					
					TriggerClientEvent('hrs_base_building:setInvitesC',id,invites[yidentifier])
					ShowNotification(id,Config.Locales["crew_new_invite"])
					ShowNotification(_source,Config.Locales["crew_you_invited"]..GetPlayerName(id)..Config.Locales["crew_to_crew"])
				else
					ShowNotification(_source,Config.Locales["crew_already_invited"])
				end
			end
		else
			ShowNotification(_source,Config.Locales["crew_no_crew"])
		end
	end
end)

RegisterNetEvent('hrs_base_building:acceptCrew')
AddEventHandler('hrs_base_building:acceptCrew', function(ident)
	
	local _source = source
	local xPlayer = GetPlayerFromId(_source)
	local identifier = GetIdentifier(xPlayer)

	if invites[identifier] and invites[identifier][ident] and crews[ident] then

		local limit = false
		if Config.maxCrewMembers then
			local count = 0
			for k,v in pairs(crews[ident].data) do
				count = count + 1
				if count >= Config.maxCrewMembers then
					limit = true
					break
				end
			end
		end

		if limit then
			ShowNotification(_source,Config.Locales["crew_limit_reached"])
		else
			crews[ident].data[identifier] = GetPlayerName(_source)
			crewByIdentifier[identifier] = ident
			
			for k, v in pairs(crews[ident].data) do
				if onlineIdentifiers[k] then
					if onlineIdentifiers[k] == _source then
						ShowNotification(_source,Config.Locales["crew_invite_accepted"])
					else
						ShowNotification(onlineIdentifiers[k],crews[ident].data[identifier]..Config.Locales["crew_new_to_crew"])
					end

					TriggerClientEvent('hrs_base_building:setCrewC',onlineIdentifiers[k],crews[ident])
				end
			end

			invites[identifier] = nil

			TriggerClientEvent('hrs_base_building:setInvitesC',onlineIdentifiers[identifier],nil)

			
			ShowNotification(_source,Config.Locales["crew_joined"]..crews[ident].label)
			

			MySQL.Async.execute('UPDATE crews SET data = @data WHERE owner = @owner', {
				['@data'] = json.encode(crews[ident].data),
				['@owner'] = ident
			})
		end
	end
end)

RegisterNetEvent('hrs_base_building:leaveCrew')
AddEventHandler('hrs_base_building:leaveCrew', function()
	local _source = source
	local xPlayer = GetPlayerFromId(_source)
	local identifier = GetIdentifier(xPlayer)

	if crewByIdentifier[identifier] and crews[crewByIdentifier[identifier]] then
		local ident = crewByIdentifier[identifier]

		crews[ident].data[identifier] = nil
		crewByIdentifier[identifier] = nil
		
		TriggerClientEvent('hrs_base_building:setCrewC',_source,nil)

		for k, v in pairs(crews[ident].data) do
			if onlineIdentifiers[k] then

				if onlineIdentifiers[k] == _source then
					ShowNotification(_source,Config.Locales["crew_you_left"])
				else
					ShowNotification(onlineIdentifiers[k],GetPlayerName(_source)..Config.Locales["crew_left_crew"])
				end

				TriggerClientEvent('hrs_base_building:setCrewC',onlineIdentifiers[k],crews[ident])
			end
		end

		MySQL.Async.execute('UPDATE crews SET data = @data WHERE owner = @owner', {
			['@data'] = json.encode(crews[ident].data),
			['@owner'] = ident
		})
	end
end)

RegisterNetEvent('hrs_base_building:removeFromCrew')
AddEventHandler('hrs_base_building:removeFromCrew', function(yidentifier)
	local _source = source
	local xPlayer = GetPlayerFromId(_source)
	local identifier = GetIdentifier(xPlayer)

	if crews[identifier] and yidentifier ~= identifier then
		crews[identifier].data[yidentifier] = nil
		crewByIdentifier[yidentifier] = nil

		if onlineIdentifiers[yidentifier] then
			TriggerClientEvent('hrs_base_building:setCrewC',onlineIdentifiers[yidentifier],nil)
		end

		for k, v in pairs(crews[identifier].data) do
			if onlineIdentifiers[k] then
				TriggerClientEvent('hrs_base_building:setCrewC',onlineIdentifiers[k],crews[identifier])
			end
		end

		ShowNotification(_source,Config.Locales["crew_player_removed"])

		if onlineIdentifiers[yidentifier] then
			ShowNotification(onlineIdentifiers[yidentifier],Config.Locales["crew_you_removed"])
		end

		MySQL.Async.execute('UPDATE crews SET data = @data WHERE owner = @owner', {
			['@data'] = json.encode(crews[identifier].data),
			['@owner'] = identifier
		})
	end
end)



-------------------- permissions
function hasPermission(identifier,id)
	if identifier == props[id].identifier then
		return true
	end

	if crewByIdentifier[identifier] and crews[crewByIdentifier[identifier]] and crews[crewByIdentifier[identifier]].data[props[id].identifier] then
		return true		
	end

	return false
end


function hasPermissionVeh(identifier,identifier2)


	if identifier == identifier2 then
		return true
	end

	if crewByIdentifier[identifier] and crews[crewByIdentifier[identifier]] and crews[crewByIdentifier[identifier]].data[identifier2] then
		return true		
	end

	return false
end

exports("hasPermissionVeh", hasPermissionVeh)




--------------------------------------------------------------


------------------------------------ RANDOM FUCNTIONS

function GetDistanceXY(firstVec,secondVec)
    return #(firstVec.xy - secondVec.xy)
end

function Round(value, numDecimalPlaces)
	if numDecimalPlaces then
		local power = 10^numDecimalPlaces
		return math.floor((value * power) + 0.5) / (power)
	else
		return math.floor(value + 0.5)
	end
end


-----------------------------
RegisterNetEvent('hrs_base_building:trigger')
AddEventHandler('hrs_base_building:trigger', function(propid,Object)
	local _source = source
	local xPlayer = GetPlayerFromId(_source)
	local identifier = GetIdentifier(xPlayer)
	local modelConfig = Config.Models[props[propid].hash]
	
	if modelConfig.noPermission or hasPermission(identifier,propid) then
		TriggerClientEvent('hrs_base_building:triggerfinal',_source,props[propid].hash,Object)
	else
		ShowNotification(source,Config.Locales["no_permission"])	
	end			
end)


-- this trigger should be added to your change bucket script so the base building can know


-- RegisterCommand("setbucket", function(source, args, rawCommand)
-- 	SetPlayerRoutingBucket(tonumber(args[1]),tonumber(args[2]))
-- 	TriggerClientEvent('hrs_base_building:changebucket',tonumber(args[1]),tonumber(args[2]))
-- end,true)

if Config.useRoutingBucketsThread then
	local lastBuckets = {}	
	CreateThread(function()
		while true do
			Wait(1000)
			local Players = GetPlayers()
			local buckets = {}
			for k,v in ipairs(Players) do
				local currentBucket = GetPlayerRoutingBucket(v)			
				if lastBuckets[v] and lastBuckets[v] ~= currentBucket or not lastBuckets[v] then
					TriggerClientEvent('hrs_base_building:changebucket',v,currentBucket)
				end
				buckets[v] = currentBucket
			end	
			lastBuckets = buckets
		end
	end)
end


------------------------ EXPLODE ----------------------
RegisterNetEvent('hrs_base_building:hasexplosive')
AddEventHandler('hrs_base_building:hasexplosive', function(propid)
	local _source = source
	local xPlayer = GetPlayerFromId(_source)
	
	if props[propid] then
		local weakerItem = nil

		for itemName,v in pairs(Config.explosionItems) do
			if HasEnoughtInventoryItem(xPlayer,itemName,1) then
				if not weakerItem then
					weakerItem = itemName
				else
					if v.damage < Config.explosionItems[weakerItem].damage then
						weakerItem = itemName
					end
				end
			end
		end

		if weakerItem then
			if not props[propid].dead then
				
				local coordsVect = props[propid].coords
				
				RemoveInventoryItem(xPlayer,weakerItem,1)

				TriggerEvent('hrs_base_building:log','raid',_source,'Situation: **BASE RAID** \n Item: **"'..weakerItem..'"**\n Location: **'..props[propid].coords..'**\n Prop id: **'..propid..'**\n Owner: **'..props[propid].identifier..'**')
				
				TriggerClientEvent('hrs_base_building:explosionEffect', _source, coordsVect,weakerItem)
					
				if Config.explosionItems[weakerItem].delay then
					Wait(Config.explosionItems[weakerItem].delay * 1000)
				end

				if props[propid] then

					props[propid].life = props[propid].life - Config.explosionItems[weakerItem].damage

					if props[propid].life <= 0.0 then
						if Config.Models[props[propid].hash].type == "storages" then
							props[propid].dead = props[propid].hash
							props[propid].hash = Config.deadStorage
							props[propid].life = Config.Models[Config.deadStorage].life
							TriggerClientEvent('hrs_base_building:replaceprop', -1,propid,props[propid])

							updateHashDatabase(propid)
						else
							DeleteProp(propid)
						end	
					else
						updateLifeDatabase(propid)
					end

				end


			else
				ShowNotification(source,Config.Locales["no_explode"])
			end
		else
			ShowNotification(source,Config.Locales["no_c4"])
		end
	end

end)


RegisterNetEvent('hrs_base_building:hasexplosive2')
AddEventHandler('hrs_base_building:hasexplosive2', function(propid,weapon)
	--print(GetInvokingResource())
	local _source = source
	local xPlayer = GetPlayerFromId(_source)
	
	if props[propid] then
		if not props[propid].dead then
			if props[propid] then

				TriggerEvent('hrs_base_building:log','raid',_source,'Situation: **BASE RAID** \n Weapon: **"'..weapon..'"**\n Location: **'..props[propid].coords..'**\n Prop id: **'..propid..'**\n Owner: **'..props[propid].identifier..'**')

				props[propid].life = props[propid].life - Config.weaponsDamage[weapon]
				if props[propid].life <= 0.0 then
					if Config.Models[props[propid].hash].type == "storages" then
						props[propid].dead = props[propid].hash
						props[propid].hash = Config.deadStorage
						props[propid].life = Config.Models[Config.deadStorage].life
						TriggerClientEvent('hrs_base_building:replaceprop', -1,propid,props[propid])

						updateHashDatabase(propid)
					else
						DeleteProp(propid)
					end	
				else
					updateLifeDatabase(propid)
				end
			end
		else
			--ShowNotification(source,Config.Locales["no_explode"])
		end
	end
end)



