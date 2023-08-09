RegisterNetEvent('ApolloK9:client:ChangeToDoggyPed', function()
    local hash = 'policek9'
    local player = PlayerId()
    local isAnimal = true
    if not IsModelInCdimage(hash) then
        print('model does not exist')
    end
    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(100) end

    SetPlayerModel(player, hash)

    local ped = PlayerPedId()
    SetPedDefaultComponentVariation(ped)
    ClearAllPedProps(ped)
    ClearPedDecorations(ped)
    ClearPedFacialDecorations(ped)

    if isAnimal then -- you need this if the model in an animal, otherwise you will be invisible
        SetPedComponentVariation(ped, 0, 0, 0, 0)
        Wait(200)
        SetPedComponentVariation(ped, 0, 0, 1, 0)
        Wait(200)
    end
    SetModelAsNoLongerNeeded(hash)
end)

RegisterNetEvent('ApolloK9:client:PlayEmote', function(animDict, anim)

    if (animDict == 'stop') then

        ClearPedTasks(PlayerPedId())
        ClearPedTasksImmediately(PlayerPedId())

        return
    end

    ClearPedTasks(PlayerPedId())
    local ped = PlayerPedId()
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do Wait(100) end
    TaskPlayAnim(ped, animDict, anim, 8.0, 0.0, -1, 1, 0, 0, 0, 0)
    Wait(100)
    RemoveAnimDict(animDict)

end)