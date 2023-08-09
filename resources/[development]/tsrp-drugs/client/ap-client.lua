CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, 38) then
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local forward = GetEntityForwardVector(playerPed)
            local x, y, z = table.unpack(coords + forward * 1.0)
            local entity = CreateObject(GetHashKey('bkr_prop_weed_bucket_01d'), x, y, z, true, true, true)
            PlaceObjectOnGroundProperly(entity)
        end
    end
end)