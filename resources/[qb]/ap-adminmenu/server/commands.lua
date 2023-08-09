local webHook = 'https://discord.com/api/webhooks/1087481759018536960/AcW1EtZF2kQchEysddiWP6TSuosfw4UPdcdM_hOPHAay6M4GVr_vHBBQ0XOALvoA-a-0'

QBCore.Commands.Add('blips', Lang:t("commands.blips_for_player"), {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, commands['blips']) or HasPermission(src, commands['blips'])) then NoPerms(src) return end

    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'WYLDFIRE Logs', 
    content = string.format("**%s** (CitizenID: %s | ID: %s) - **Toggled Player Blips**".." @ "..os.date('%c'), GetPlayerName(src), Player.PlayerData.citizenid, src)}), 
    { ['Content-Type'] = 'application/json' })

    TriggerClientEvent('qb-admin:client:toggleBlips', src)
end)


QBCore.Commands.Add('names', Lang:t("commands.player_name_overhead"), {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
        
    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, commands['names']) or HasPermission(src, commands['names'])) then NoPerms(src) return end

    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'WYLDFIRE Logs', 
    content = string.format("**%s** (CitizenID: %s | ID: %s) - **Toggled Player Names**".." @ "..os.date('%c'), GetPlayerName(src), Player.PlayerData.citizenid, src)}), 
    { ['Content-Type'] = 'application/json' })

    TriggerClientEvent('qb-admin:client:toggleNames', src)
end)

QBCore.Commands.Add('coords', Lang:t("commands.coords_dev_command"), {}, false, function(source)
    local src = source

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, commands['coords']) or HasPermission(src, commands['coords'])) then NoPerms(src) return end

    TriggerClientEvent('qb-admin:client:ToggleCoords', src)
end)

QBCore.Commands.Add('noclip', Lang:t("commands.toogle_noclip"), {}, false, function(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, commands['noclip']) or HasPermission(src, commands['noclip'])) then NoPerms(src) return end

    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'WYLDFIRE Logs', 
    content = string.format("**%s** (CitizenID: %s | ID: %s) - **Toggled NoClip**".." @ "..os.date('%c'), GetPlayerName(src), Player.PlayerData.citizenid, src)}), 
    { ['Content-Type'] = 'application/json' })

    TriggerClientEvent('qb-admin:client:ToggleNoClip', src)
end)

QBCore.Commands.Add('admincar', Lang:t("commands.save_vehicle_garage"), {}, false, function(source)
    local src = source

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['savecar']) or HasPermission(src, events['savecar'])) then NoPerms(src) return end

    TriggerClientEvent('qb-admin:client:SaveCar', src)
end)

QBCore.Commands.Add('admin', Lang:t("commands.open_admin"), {}, false, function(source)
    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(source, events['usemenu']) or HasPermission(source, events['usemenu'])) then NoPerms(source) return end

    TriggerClientEvent('qb-admin:client:openMenu', source)
end)


--- No one uses this properly. For the ones that do I'll leave it here
-- QBCore.Commands.Add('givenuifocus', Lang:t("commands.nui_focus"), {{name='id', help='Player id'}, {name='focus', help='Set focus on/off'}, {name='mouse', help='Set mouse on/off'}}, true, function(_, args)
--     local playerid = tonumber(args[1])
--     local focus = args[2]
--     local mouse = args[3]
--     TriggerClientEvent('qb-admin:client:GiveNuiFocus', playerid, focus, mouse)
-- end)

--- Highly recommend using txAdmin for warnings and bans.
-- QBCore.Commands.Add('warn', Lang:t("commands.warn_a_player"), {{name='ID', help='Player'}, {name='Reason', help='Mention a reason'}}, true, function(source, args)
--     if not (QBCore.Functions.HasPermission(source, commands['warn']) or HasPermission(source, commands['warn'])) then return end

--     local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
--     local senderPlayer = QBCore.Functions.GetPlayer(source)
--     table.remove(args, 1)
--     local msg = table.concat(args, ' ')
--     local warnId = 'WARN-'..math.random(1111, 9999)
--     if targetPlayer ~= nil then
--         TriggerClientEvent('chat:addMessage', targetPlayer.PlayerData.source, {
--             color = { 255, 0, 0},
--             multiline = true,
--             args = {Lang:t("info.warning_chat_message")..' '..GetPlayerName(source), msg}
--         })
--         TriggerClientEvent('chat:addMessage', source, {
--             color = { 255, 0, 0},
--             multiline = true,
--             args = {Lang:t("info.warning_staff_message")..GetPlayerName(targetPlayer.PlayerData.source), msg}
--         })
--         MySQL.Async.insert('INSERT INTO player_warns (senderIdentifier, targetIdentifier, reason, warnId) VALUES (?, ?, ?, ?)', {
--             senderPlayer.PlayerData.license,
--             targetPlayer.PlayerData.license,
--             msg,
--             warnId
--         })
--     else
--         TriggerClientEvent('QBCore:Notify', source, Lang:t("error.not_online"), 'error')
--     end
-- end)

-- QBCore.Commands.Add('checkwarns', Lang:t("commands.check_player_warning"), {{name='id', help='Player'}, {name='Warning', help='Number of warning, (1, 2 or 3 etc..)'}}, false, function(source, args)
--     if not (QBCore.Functions.HasPermission(source, commands['warn']) or HasPermission(source, commands['warn'])) then return end

--     if args[2] == nil then
--         local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
--         local result = MySQL.Sync.fetchAll('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.PlayerData.license })
--         TriggerClientEvent('chat:addMessage', source, {
--             color = { 255, 0, 0},
--             multiline = true,
--             args = {'SYSTEM', targetPlayer.PlayerData.name..' has '..#result..' warnings!'}
--         })
--     else
--         local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
--         local warnings = MySQL.Sync.fetchAll('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.PlayerData.license })
--         local selectedWarning = tonumber(args[2])
--         if warnings[selectedWarning] ~= nil then
--             local sender = QBCore.Functions.GetPlayer(warnings[selectedWarning].senderIdentifier)
--             TriggerClientEvent('chat:addMessage', source, {
--                 color = { 255, 0, 0},
--                 multiline = true,
--                 args = {'SYSTEM', targetPlayer.PlayerData.name..' has been warned by '..sender.PlayerData.name..', Reason: '..warnings[selectedWarning].reason}
--             })
--         end
--     end
-- end)

-- QBCore.Commands.Add('delwarn', Lang:t("commands.delete_player_warning"), {{name='id', help='Player'}, {name='Warning', help='Number of warning, (1, 2 or 3 etc..)'}}, true, function(source, args)
--     if not (QBCore.Functions.HasPermission(source, commands['delwarn']) or HasPermission(source, commands['delwarn'])) then return end

--     local targetPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
--     local warnings = MySQL.Sync.fetchAll('SELECT * FROM player_warns WHERE targetIdentifier = ?', { targetPlayer.PlayerData.license })
--     local selectedWarning = tonumber(args[2])
--     if warnings[selectedWarning] ~= nil then
--         TriggerClientEvent('chat:addMessage', source, {
--             color = { 255, 0, 0},
--             multiline = true,
--             args = {'SYSTEM', 'You have deleted warning ('..selectedWarning..') , Reason: '..warnings[selectedWarning].reason}
--         })
--         MySQL.Async.execute('DELETE FROM player_warns WHERE warnId = ?', { warnings[selectedWarning].warnId })
--     end
-- end)

QBCore.Commands.Add('adm', 'DM a player (Admin Only)', {{name = 'id', help = 'Player ID'}, {name = 'message', help = 'Message'}}, false, function(source, args)
    local src = source

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['reports']) or HasPermission(src, events['reports'])) then NoPerms(src) return end

    local playerId = tonumber(args[1])
    table.remove(args, 1)
    local msg = table.concat(args, ' ')
    local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
    if msg == '' then return end
    if not OtherPlayer then return TriggerClientEvent('QBCore:Notify', src, 'Player is not online', 'error') end
    TriggerClientEvent('chat:addMessage', playerId, {
        color = {255, 0, 0},
        multiline = true,
        args = {'Admin Response', msg}
    })
    TriggerClientEvent('chat:addMessage', src, {
        color = {255, 0, 0},
        multiline = true,
        args = {'Report Response ('..playerId..')', msg}
    })
    TriggerClientEvent('QBCore:Notify', src, 'Reply Sent')
    
    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'WYLDFIRE Logs', 
    content = 'Admin: **'..GetPlayerName(src)..'** Privately Messaged: **'..OtherPlayer.PlayerData.name.. ' **(ID: '..OtherPlayer.PlayerData.source..') with message: ' ..msg}), 
    { ['Content-Type'] = 'application/json' })
end)

QBCore.Commands.Add('setammo', Lang:t("commands.ammo_amount_set"), {{name='amount', help='Amount of bullets, for example: 20'}, {name='weapon', help='Name of the weapen, for example: WEAPON_VINTAGEPISTOL'}}, false, function(source, args)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local weapon = args[2]
    local amount = tonumber(args[1])

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, commands['setammo']) or HasPermission(src, commands['setammo'])) then NoPerms(src) return end

    PerformHttpRequest(webHook, function(err, text, headers) end, 'POST', json.encode({ username = 'WYLDFIRE Logs', 
    content = string.format("**%s** (CitizenID: %s | ID: %s) - **Set their Ammo** ".." @ "..os.date('%c'), GetPlayerName(src), Player.PlayerData.citizenid, src)}), 
    { ['Content-Type'] = 'application/json' })

    if weapon ~= nil then
        TriggerClientEvent('qb-weapons:client:SetWeaponAmmoManual', src, weapon, amount)
    else
        TriggerClientEvent('qb-weapons:client:SetWeaponAmmoManual', src, 'current', amount)
    end
end)