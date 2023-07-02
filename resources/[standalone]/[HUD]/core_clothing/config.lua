Config = {

     -- COMPATABILITY
     UsingCoreInventory = true, -- If you have core_inventory and want to use cloth as item, set this to true
     UsingFivemApperance = false, -- If you use Fivem Apperance as skin manager, set this to true 
     UsingIlleniumAppearance = true, -- If you use Illenium Appearance  as skin manager, set this to true and UsingFivemApperance to false

     EnableFreeClothWhenAlreadyBuy = true, -- If true, cloth bougth by player will be save and display as free in store when they want to buy them another time, if false, player will need to buy the full price of the cloth even if it own it once 

     CoreClothingItems = {
          ['Clothes'] = {
               [1]  = "mask",
               [4]  = "pants",
               [5]  = "bag",
               [6]  = "shoes",
               [7]  = "accessory",
               [8]  = "tshirt",
               [9]  = "vest",
               [11] = "torso",
          },
          ['Accessories'] = {
               [0]= "hat",
               [1]= "glass",
               [2]= "ear",
               [6]= "watch",
               [7]= "bracelet"
          },
     },

     -- STORES
     Stores = {
          ['hnm'] = {
               Label = 'H&M', -- Name of the store
               Coords = {     -- Coords of the store that will be display the same cloth to buy              
                         vector3(1693.32, 4823.48, 41.06),
                         vector3(-712.215881, -155.352982, 37.4151268),
                         vector3(-1192.94495, -772.688965, 17.3255997),
                         vector3(425.236, -806.008, 28.491),
                         vector3(-162.658, -303.397, 38.733),
                         vector3(75.950, -1392.891, 28.376),
                         vector3(-822.194, -1074.134, 10.328),
                         vector3(-1450.711, -236.83, 48.809),
                         vector3(4.254, 6512.813, 30.877),
                         vector3(615.180, 2762.933, 41.088),
                         vector3(615.180, 2762.933, 41.088), 
                         vector3(1196.785, 2709.558, 37.222),
                         vector3(-3171.453, 1043.857, 19.863),
                         vector3(-1100.959, 2710.211, 18.107),
                         vector3(-1207.65, -1456.88, 4.3784737586975),
                         vector3(121.76, -224.6, 53.56),
                         vector3(-814.3, -183.8, 36.6),
                         vector3(136.8, -1708.4, 28.3),
                         vector3(-1282.6, -1116.8, 6.0),
                         vector3(1931.5, 3729.7, 31.8),

               },
               Pattern = 'hnm_pattern.png',  -- Background image of the shop (html/img)
               Logo = 'hnm.png',             -- Logo of the shop (html/img)
               Button = '#ff143c',
               Background1 = '#d6d6d6',
               Background2 = '#ffd9d9',
               Checkout = '#ff143c',
               Blip = 73,                    -- Blip of the shop display on the map
               BlipColor = 48,               -- Blip color of the shop display on the map
               Radius = 5.0, 
               Clothes = {
                    -- GENDER CATEGORIES
                    ['men'] = {
                         category = true,
                         label = 'MEN',
                         parent = '',
                    },
                    ['woman'] = {
                         category = true,
                         label = 'WOMAN',
                         parent = '',
                    },
                    
                    -- MEN CLOTH CATEGORIES
                    ['men_pants'] = {
                         category = true,
                         label = 'PANTS',
                         parent = 'men',
                    },
                    ['men_torso'] = {
                         category = true,  
                         label = 'TOP',
                         parent = 'men',
                    },
                    ['men_tshirt'] = {
                         category = true,  
                         label = 'T-SHIRT',
                         parent = 'men',
                    },
                    ['men_shoes'] = {
                         category = true,  
                         label = 'SHOES',
                         parent = 'men',
                    },
                    ['men_masks'] = {
                         category = true, 
                         label = 'MASKS',
                         parent = 'men',
                    },
                    ['men_watch'] = {
                         category = true,
                         label = 'WATCH',
                         parent = 'men',
                    },
                    ['men_glass'] = {
                         category = true,  
                         label = 'GLASSES',
                         parent = 'men',
                    },
                    ['men_bracelet'] = {
                         category = true,  
                         label = 'BRACELET',
                         parent = 'men',
                    },
                    ['men_hat'] = {
                         category = true, 
                         label = 'HATS',
                         parent = 'men',
                    },
                    ['men_ear'] = {
                         category = true, 
                         label = 'EAR',
                         parent = 'men',
                    },

                    -- WOMAN CLOTH CATEGORIES
                    ['woman_pants'] = {
                         category = true, 
                         label = 'PANTS',
                         parent = 'woman',
                    },
                    ['woman_torso'] = {
                         category = true, 
                         label = 'TOP',
                         parent = 'woman',
                    },
                    ['woman_shoes'] = {
                         category = true,  
                         label = 'SHOES',
                         parent = 'woman',
                    },
                    ['woman_masks'] = {
                         category = true,
                         label = 'MASKS',
                         parent = 'woman',
                    },
                    ['woman_tshirt'] = {
                         category = true,  
                         label = 'T-SHIRT',
                         parent = 'woman',
                    },
                    ['woman_watch'] = {
                         category = true, 
                         label = 'WATCH',
                         parent = 'woman',
                    },
                    ['woman_glass'] = {
                         category = true, 
                         label = 'GLASSES',
                         parent = 'woman',
                    },
                    ['woman_bracelet'] = {
                         category = true,  
                         label = 'BRACELET',
                         parent = 'woman',
                    },
                    ['woman_hat'] = {
                         category = true,
                         label = 'HATS',
                         parent = 'woman',
                    },
                    ['woman_ear'] = {
                         category = true,
                         label = 'EAR',
                         parent = 'woman',
                    },
               },
          },
     }
}

function SendTextMessage(msg)

        SetNotificationTextEntry('STRING')
        AddTextComponentString(msg)
        DrawNotification(0,1)

        --EXAMPLE USED IN VIDEO
        --exports['mythic_notify']:SendAlert('inform', msg)

end
