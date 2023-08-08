local QBCore = exports['qb-core']:GetCoreObject()

local restarauntsseat = nil
local sitting = false
local Chairs = {}

CreateThread(function()
	for k, v in pairs(Config.Chairs) do
		Chairs["RestrauntsSeat"..k] =
		exports['qb-target']:AddBoxZone("RestrauntsSeat"..k, v.coords.xyz, 0.5, 0.5, { name="RestrauntsSeat"..k, heading = v.coords.w, debugPoly=Config.Debug, minZ = v.coords.z-1, maxZ = v.coords.z+1, },
			{ options = { { event = "tk-restaraunts:client:Chair", targeticon = "fas fa-chair", label = "Sit Down", loc = v.coords, stand = v.stand }, },
				distance = 3
		})
	end
end)

RegisterNetEvent('tk-restaraunts:client:Chair', function(data)
	local canSit = true
	local sitting = false
	local ped = PlayerPedId()
	for _, v in pairs(QBCore.Functions.GetPlayersFromCoords(data.loc.xyz, 0.6)) do
		local dist = #(GetEntityCoords(GetPlayerPed(v)) - data.loc.xyz
	)
		if dist <= 0.4 then TriggerEvent("QBCore:Notify", "Someone Sitting Is There") canSit = false end
	end
	if canSit then
		if not IsPedHeadingTowardsPosition(ped, data.loc.xyz, 20.0) then TaskTurnPedToFaceCoord(ped, data.loc.xyz, 1500) Wait(1500)	end
		if #(data.loc.xyz - GetEntityCoords(PlayerPedId())) > 1.5 then TaskGoStraightToCoord(ped, data.loc.xyz, 0.5, 1000, 0.0, 0) Wait(1100) end
		TaskStartScenarioAtPosition(PlayerPedId(), "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.loc[4], 0, 1, true)
		restarauntsseat = data.stand
		sitting = true
	end
	while sitting do
		if sitting then
			if IsControlJustReleased(0, 202) and IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then
				sitting = false
				ClearPedTasks(ped)
				if restarauntsseat then SetEntityCoords(ped, restarauntsseat) end
				restarauntsseat = nil
			end
		end
		Wait(5) if not IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = false end
	end
end)

Config.Chairs = {
    --Peckerwood
	--TreyBakers
	-- Inside
	{ coords = vec4(56.58, -129.62, 55.46, 160.0) },
	{ coords = vec4(55.62, -132.16, 55.46, 340.0) },

	{ coords = vec4(55.46, -132.59, 55.46, 160.0) },
	{ coords = vec4(54.53, -135.14, 55.46, 340.0) },

	{ coords = vec4(49.72, -131.35, 55.46, 340.0) },
	{ coords = vec4(51.67, -130.39, 55.46, 70.0) },
	{ coords = vec4(48.97, -129.4, 55.46, 250.0) },

	{ coords = vec4(52.57, -128.05, 55.46, 70.0) },
	{ coords = vec4(49.8, -127.0, 55.46, 250.0) },

	-- Outside
	{ coords = vec4(51.08, -138.56, 55.10, 260.0), stand = vec3(51.06, -139.1, 55.2-0.5) },
	{ coords = vec4(52.92, -139.2, 55.10, 70.0), stand = vec3(52.57, -139.65, 55.17-0.5) },
	{ coords = vec4(52.16, -137.66, 55.10, 170.0), stand = vec3(51.53, -137.64, 55.18-0.5) },

	{ coords = vec4(52.98, -136.43, 55.10, 250.0), stand = vec3(53.31, -137.16, 55.13-0.5) },
	{ coords = vec4(53.79, -137.81, 55.12, 340.0), stand = vec3(53.31, -137.16, 55.13-0.5) },
	{ coords = vec4(55.28, -137.27, 55.08, 65.0), stand = vec3(55.04, -138.03, 55.09-0.5)},
}

AddEventHandler('onResourceStop', function(r) if r ~= GetCurrentResourceName() then return end
	for k in pairs(Chairs) do exports['qb-target']:RemoveZone(k) end
end)