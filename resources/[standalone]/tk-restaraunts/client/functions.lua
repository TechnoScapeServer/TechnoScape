local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn

function HasItem(items, amount)
	local amount = amount or 1
    local isTable = type(items) == 'table'
    local isArray = isTable and table.type(items) == 'array' or false
    local totalItems = items
    local count = 0
    local kvIndex = 2
    for _, itemData in pairs(QBCore.Functions.GetPlayerData().items) do
        if itemData and (itemData.name == items) then
			count += itemData.amount
		end
	end
	if count >= amount then
		return true
	end
    return false
end

--Help Function
function ShowHelpNotification(text)
    SetTextComponentFormat("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end