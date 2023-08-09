RegisterNetEvent('qb-admin:server:name', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local Player = QBCore.Functions.GetPlayer(src)
    local NewInfo = {}

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['playerinformation']) or HasPermission(src, events['playerinformation'])) then NoPerms(src) return end
    if not type_check({tostring(Input), 'string'}) then return end
    if not TargetInfo then return end
end)

RegisterNetEvent('qb-admin:server:food', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['playerinformation']) or HasPermission(src, events['playerinformation'])) then NoPerms(src) return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end
end)

RegisterNetEvent('qb-admin:server:water', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['playerinformation']) or HasPermission(src, events['playerinformation'])) then NoPerms(src) return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end
end)

RegisterNetEvent('qb-admin:server:stress', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['playerinformation']) or HasPermission(src, events['playerinformation'])) then NoPerms(src) return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end
end)

RegisterNetEvent('qb-admin:server:armor', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['playerinformation']) or HasPermission(src, events['playerinformation'])) then NoPerms(src) return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end
end)

RegisterNetEvent('qb-admin:server:phone', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['playerinformation']) or HasPermission(src, events['playerinformation'])) then NoPerms(src) return end
    if not type_check({tostring(Input), 'string'}) then return end
    if not TargetInfo then return end
end)

RegisterNetEvent('qb-admin:server:cash', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['playerinformation']) or HasPermission(src, events['playerinformation'])) then NoPerms(src) return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end
end)

RegisterNetEvent('qb-admin:server:bank', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['playerinformation']) or HasPermission(src, events['playerinformation'])) then NoPerms(src) return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end
end)

RegisterNetEvent('qb-admin:server:job', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local NewInfo = {}
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['playerinformation']) or HasPermission(src, events['playerinformation'])) then NoPerms(src) return end
    if not type_check({tostring(Input), 'string'}) then return end
    if not TargetInfo then return end
end)

RegisterNetEvent('qb-admin:server:gang', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local NewInfo = {}
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['playerinformation']) or HasPermission(src, events['playerinformation'])) then NoPerms(src) return end
    if not type_check({tostring(Input), 'string'}) then return end
    if not TargetInfo then return end
end)

RegisterNetEvent('qb-admin:server:radio', function(Target, Input)
    local src = source
    local TargetInfo = QBCore.Functions.GetPlayer(Target.id)
    local Player = QBCore.Functions.GetPlayer(src)

    if not (UseQBCorePermissions and QBCore.Functions.HasPermission(src, events['playerinformation']) or HasPermission(src, events['playerinformation'])) then NoPerms(src) return end
    if not type_check({tonumber(Input), 'number'}) then return end
    if not TargetInfo then return end
end)