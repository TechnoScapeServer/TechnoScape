

Config.OwnerPermission = { -- only owner can use this permission
   --['char1:d6b94cf21d1e6ef8aa5d713d4016027f14c408b9'] = true, --  licenseid   -- example
  -- ['char2:d6b94cf21d1e6ef8aa5d713d4016027f14c408b9'] = true, --  licenseid   -- example
       -- ['CNP63275'] = true, --  citizenid   -- example
--    ['LOW06378'] = true, --  citizenid   -- 
   --if you don't know enter the game and type myidentifier in f8
}


Config.Permissions = {
    ['user'] = {
        rank = 0,
        label = "user",
        name = "user",
    },
    ['vip'] = {
        rank = 1,
        label = "Vip",
        name = "vip",
    }, -- vip is only designed to display the scoreboard. It does not have any admin function.
    ['staff'] = {
        rank = 2,
        label = "Staff",
        name = "staff",
    },
    ['admin'] = {
        rank = 3,
        label = "Admin",
        name = "admin",
    },
    ['superadmin'] = {
        rank = 4,
        label = "Super Admin",
        name = "superadmin",
    },
    ['owner'] = {
        rank = 5,
        label = "Owner",
        name = "owner",
    },
}



Config.EventPermissions = {
    -- exapmle = 2 staff , 3 admin , 4 superadmin 
    -- When you give 3 as an example, it can do 3 and above.
    ['staffChat'] = 2,
    ['warnPlayer'] = 3,
    ['kickPlayer'] = 3,
    ['jailPlayer'] = 4,
    ['banPlayer'] = 3,
    ['permaBanPlayer'] = 2,
    ['spectatePlayer'] = 2,
    ['revivePlayer'] = 4,
    ['killPlayer'] = 2,
    ['freezePlayer'] = 2,
    ['gotoPlayer'] = 2,
    ['bringPlayer'] = 2,
    ['giveVip'] = 2,
    ['giveStaff'] = 2, -- değişecek 4 olacak
    ['giveAdmin'] = 2,
    ['giveSuperAdmin'] = 2,
    ['removeRank'] = 4,
    ['markGps'] = 2,
    ['giveItem'] = 2,
    ['clearVehicle'] = 2,
    ['allRevive'] = 2,
    ['clearArea'] = 2,
    ['changeWeather'] = 2,
    ['changeTime'] = 2,
    ['giveCash'] = 2,
    ['giveBank'] = 2,
    ['devtools'] = 4,
    ['noclip'] = 2,
    ['godmode'] = 4,
    ['healPlayer'] = 2,
    ['invisible'] = 2,
    ['showplayerBlip'] = 2,
    ['showplayerName'] = 2,
    ['sendPM'] = 2,
    ['giveVehicle'] = 2,
    ['giveVehicleDatabase'] = 2,
    ['unbanPlayer'] = 2,
    ['announce'] = 2,
    ['showcoords'] = 2,
    ['giveClothingMenu'] = 2,
    ['takePicture'] = 3,
    ['clearInventory'] = 2,
    ['setJob'] = 2,
    ['freezeTime'] = 2,
    ['runCommand'] = 2,
    ['repairVehicle'] = 2,
    ['unjailPlayer'] = 2,
    ['tpmarker'] = 2,
  
 
}