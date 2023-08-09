RegisterCommand('ap-utility', function()
    local ped = 'nanue'
    local model = GetHashKey(ped)
    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end
    SetPlayerModel(PlayerId(), model)
    SetModelAsNoLongerNeeded(model)
    SetPedRandomComponentVariation(PlayerPedId(), true)
    SetPedRandomProps(PlayerPedId())
end, false)