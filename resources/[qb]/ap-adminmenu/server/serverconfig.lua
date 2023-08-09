--- If this is somehow something else besides interact-sound. Please so change the name of the event that
--- is triggered when using the play sound option in the menu.
SoundScriptName = 'interact-sound' -- Name of the sound script that you are using
SoundPath = '/client/html/sounds' -- Where the sounds are located
Linux = false -- Wether or not if you use linux. Very important!

--- Use QBCore's permission system | If false use my database permission setup
UseQBCorePermissions = true

--- Who should be able to trigger each NetEvent on the server side?
events = {
    ['kill'] = 'admin   ',
    ['revive'] = 'admin',
    ['freeze'] = 'admin',
    ['spectate'] = 'god',
    ['goto'] = 'admin',
    ['bring'] = 'admin',
    ['intovehicle'] = 'admin',
    ['kick'] = 'admin',
    ['ban'] = 'admin',
    ['setPermissions'] = 'god',
    ['cloth'] = 'admin',
    ['spawnVehicle'] = 'admin',
    ['savecar'] = 'god',
    ['platecar'] = 'god',
    ['playsound'] = 'god',
    ['usemenu'] = 'admin',
    ['routingbucket'] = 'god',
    ['getradiolist'] = 'admin',
    ['playerinformation'] = 'admin',
    ['giveallweapons'] = 'god',
    ['reports'] = 'admin',
    ['staffchat'] = 'admin',
    ['teleportlocation'] = 'admin',
}

--- Who should be able to trigger each command on the server side?
commands = {
    ['blips'] = 'admin',
    ['names'] = 'admin',
    ['coords'] = 'admin',
    ['noclip'] = 'admin',
    ['announce'] = 'god',
    ['staffchat'] = 'admin',
    ['warn'] = 'admin',
    ['delwarn'] = 'god',
    ['setmodel'] = 'god',
    ['setammo'] = 'admin',
    ['kickall'] = 'god',
}

--- Permission hierarchy order from top to bottom.
PermissionOrder = {
    'god',
    'admin',
    'mod'
}