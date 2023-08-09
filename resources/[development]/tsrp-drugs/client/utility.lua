local QBCore = exports['qb-core']:GetCoreObject()

exports['qb-target']:AddTargetModel(`bkr_prop_weed_bucket_01d`, {
    options = {
        {
            type = "client",
            event = "ap-drugs:openBucket",
            icon = "fas fa-seedling",
            label = "Open Bucket",
        },
    },
    distance = 2.5
})

RegisterNetEvent('ap-drugs:openBucket', function()
    QBCore.Functions.Progressbar("dynamic_bar", 'Opening Bucket', 2000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
        anim = "machinic_loop_mechandplayer",
        flags = 16,
    }, {}, {}, function()
        ClearPedTasks(PlayerPedId())

        local playerPed = PlayerPedId()
        local bucket = GetClosestObjectOfType(GetEntityCoords(playerPed), 1.0, `bkr_prop_weed_bucket_01d`, false, false, false)
        local coords = GetEntityCoords(bucket)
        local newBucket = CreateObject(`bkr_prop_weed_bucket_open_01a`, coords.x, coords.y, coords.z, true, true, true)

        -- not finished yet, needed to do commit.

    end, function()
    end)
end)