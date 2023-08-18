local QBCore = exports['qb-core']:GetCoreObject()
local isLoggedIn = LocalPlayer.state.isLoggedIn

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    FetchSkills()

    RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
        for skill, value in pairs(Config.Skills) do
            Config.Skills[skill]["Default"] = 0
        end
    end)
end)

AddEventHandler('onResourceStart', function(resource)
   if resource == GetCurrentResourceName() then
	  Wait(100)
	  FetchSkills()
   end
end)
