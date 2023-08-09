--ONLY CONFIG NAMED sh_config.lua will work!

Config = {}

Config.Debug = false -- Debug
--SERVER SETTINGS
Config.Framework = "auto-detect" -- Framework | types: auto-detect, qbcore, ESX, standalone

Config.NewESX = true

Config.Target = "auto-detect" -- Target | types: auto-detect, qb-target, qtarget, ox_target
Config.BossMenu = "auto-detect" -- BossMenu | types: auto-detect, esx_society, qb-management

Config.NotificationType = "ox_lib" -- Notifications | types: ESX, ox_lib, qbcore
Config.Progress = "ox_lib_circle" -- ProgressBar | types: progressBars, ox_lib_square, ox_lib_circle, qbcore | Preview: ox_lib_square = https://imgur.com/bgVWs4u , ox_lib_circle = https://imgur.com/Tfq8CA0 , qbcore = https://imgur.com/ru33FYA
Config.Clothing = "auto-detect" -- Skin / Clothing | types: auto-detect, esx_skin, qb-clothing, fivem-appearance, ox_appearance
Config.Context = "ox_lib" -- Context | types: ox_lib, qbcore
Config.Input = "ox_lib" -- Input | types: ox_lib, qb-input
Config.PoliceJobs = { 'police', 'sheriff' } -- Jobs which can be alerted
Config.Dispatch = { enabled = true, script = "linden_outlawalert" } -- cd_dispatch, linden_outlawalert, ps-disptach
--PLAYER SETTINGS
Config.JobName = "koi" -- Job name for koi
Config.BossGrade = 5 -- Boss Grade
Config.NeedDuty = true -- Required duty to make drinks etc.
Config.NeedCleanHands = true -- Required to clean hands to make drinks etc.

Config.Logs = { enabled = true, type = "webhook" } -- use webhook or ox_lib (datadog) Can be changed in server > sv_utils.lua
Config.DropPlayer = false -- Drop (Kick) Player if tries to cheat!
Config.AnticheatBan = false -- Change in server/sv_Utils.lua!!! WIll not work by default you need to add your custom trigger to ban player!

Config.Inventory = "auto-detect" -- auto-detect, ox, quasar, chezza, qb

Config.koi = {

    PolyZone = {
        coords = vector3(-1034.65, -1483.58, 4.67), size = vec3(110.0, 110.0, 110.0), rotation = 270, debug = false, RemovePeds = true, radius = 50.0
    },

    Garage = {
        Ped = {
            { Model = "s_m_y_xmech_01", Coords = vec4(-1000.7794, -1462.5830, 3.9769, 87.5820),
                Scenario = "WORLD_HUMAN_CLIPBOARD_FACILITY"
            }
        },
        Vehicles = {
            { Model = "nspeedo", Label = "Vapid Speedo", livery = 0, image = "https://cdn.discordapp.com/attachments/936585783761051658/1107691094260584448/image.png", metadata = {""}, },
        },
        SpawnPoints = {
            { Coords = vector3(-1006.09, -1464.86, 3.99), Heading = 37.43, Radius = 3.0 }
        },
    },

    AlertPolice = vec3(-1075.6558837890625, -1442.419677734375, -1.05735278129577),

    Delivery = vec3(-1065.66, -1443.07, -1.18),

    SpawnObjects = true,

    Sinks = {
        Zones = {
            Kitchen1 = {
                coords = vector3(-1077.05, -1443.9, -1.38),
                radius = 0.35,
                debug = false,
                WaterStream = vector3(-1077.05, -1443.9, -1.30),
            },
            Kitchen2 = {
                coords = vector3(-1071.46, -1439.94, -1.32),
                radius = 0.35,
                debug = false,
                WaterStream = vector3(-1071.46, -1439.94, -1.32),
            },
        },

        Crafting = {
            CleanDirtyCup = {
                Title = "Clean dirty cup", 
                description = "Required Item: Dirty cup",
                image = "https://i.imgur.com/7oguTle.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dirty_cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "cup", count = 1 },
                }
            },
            CleanGlass = {
                Title = "Clean Dirty Glass", 
                description = "Required Item: Dirty Glass",
                image = "https://i.imgur.com/t3E6KhW.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dirty_glass", count = 1, remove = true },
                },
                AddItems = {
                    { item = "glass", count = 1 },
                }
            },
            CleanTeaGlass = {
                Title = "Clean dirty tea glass",
                description = "Requited Item: Dirty Glass",
                image = "https://i.imgur.com/kaIYuuX.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dirty_plate", count = 1, remove = true },
                },
                AddItems = {
                    { item = "plate", count = 1 },
                }
            },
        },
    },

    Duty = {
        Main = { coords = vector3(-1061.89, -1443.91, -1.04), radius = 0.2, debug = false },
    },

    CloakRoom = {
        Main = { coords = vector3(-1059.41, -1434.16, -1.24), radius = 0.7, debug = false },
    },

    Desert = {
        Zones = {
            Main = { coords = vector3(-1076.68, -1449.55, -1.39), radius = 0.35, debug = false },
        },
        Crafting = {
            japanese_cheesecake = {
                Title = "Japanese Cheesecake",
                description = "Required Item: Plate, Japanese Cheesecake",
                image = "https://i.imgur.com/dlvBC1g.png",
                metadata = {""},
                RequiredItems = {
                    { item = "plate", count = 1, remove = true },
                    { item = "japanese_cheesecake", count = 1, remove = true },
                },
                AddItems = {
                    { item = "japanese_cheesecake_plate", count = 1 },
                }
            },
            matcha_swiss = {
                Title = "Matcha Swiss",
                description = "Required Item: Plate, Matcha Swiss, Shelled Peanuts",
                image = "https://i.imgur.com/7RVb1zs.png",
                metadata = {""},
                RequiredItems = {
                    { item = "plate", count = 1, remove = true },
                    { item = "matcha_swiss", count = 1, remove = true },
                    { item = "shelled_peanuts", count = 1, remove = true },
                },
                AddItems = {
                    { item = "matcha_swiss_plate", count = 1 },
                }
            },
            dorayaki = {
                Title = "Dorayaki",
                description = "Required Item: Dorayaki, Chocolate",
                image = "https://i.imgur.com/UKzf78I.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dorayaki", count = 1, remove = true },
                    { item = "chocolate", count = 1, remove = true },
                },
                AddItems = {
                    { item = "dorayaki_plate", count = 1 },
                }
            },
        },
    },

    Tables = {
        Zones = {
            Main = { coords = vector3(-1074.14, -1445.22, -1.49), radius = 0.55, debug = false },
        },
        
        Crafting = {
            banhxeo = {
                Title = "Banh xeo",
                description = "Required Items: Coconut Milk, Brisket, Shrimp, Rice Flour, Turmeric, Mungo sprouts, Sugar, Garlic",
                image = "https://i.imgur.com/xmXhoh8.png",
                metadata = {""},
                RequiredItems = {
                    { item = "coconut_milk", count = 1, remove = true },
                    { item = "brisket", count = 1, remove = true },
                    { item = "shrimp", count = 1, remove = true },
                    { item = "rice_flour", count = 1, remove = true },
                    { item = "turmeric", count = 1, remove = true },
                    { item = "mungo_sprouts", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "spring_onion", count = 1, remove = true },
                    { item = "garlic", count = 1, remove = true },
                },
                AddItems = {
                    { item = "bunbonambo", count = 1 },
                }
            },
            bunbonambo = {
                Title = "Bun bo nam bo",
                description = "Required Items: Beef leg, Garlic, Oil, Fish Sauce, Rice Noodles, Salad, Carrot, Shelled Peanuts, Spring Onion, Coriander",
                image = "https://i.imgur.com/ksd9QjC.png",
                metadata = {""},
                RequiredItems = {
                    { item = "beef_leg", count = 1, remove = true },
                    { item = "garlic", count = 1, remove = true },
                    { item = "oil", count = 1, remove = true },
                    { item = "fish_sauce", count = 1, remove = true },
                    { item = "rice_noodles", count = 1, remove = true },
                    { item = "salad", count = 1, remove = true },
                    { item = "carrot", count = 1, remove = true },
                    { item = "shelled_peanuts", count = 1, remove = true },
                    { item = "spring_onion", count = 1, remove = true },
                    { item = "coriander", count = 1, remove = true },
                },
                AddItems = {
                    { item = "bunbonambo", count = 1 },
                }
            },
            kungpao = {
                Title = "Kung pao",
                description = "Required Items: Garlic, Chicken Meat, Spring Onion, Chinese Rice Wine, Soy Sauce, Shelled Peanuts, Oil, Chilli, Sugar, Potato starch",
                image = "https://i.imgur.com/mx7eNT6.png",
                metadata = {""},
                RequiredItems = {
                    { item = "garlic", count = 1, remove = true },
                    { item = "chicken_meat", count = 1, remove = true },
                    { item = "spring_onion", count = 1, remove = true },
                    { item = "chinese_rice_wine", count = 1, remove = true },
                    { item = "soy_sauce", count = 1, remove = true },
                    { item = "shelled_peanuts", count = 1, remove = true },
                    { item = "oil", count = 1, remove = true },
                    { item = "chilli", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "potato_starch", count = 1, remove = true },
                },
                AddItems = {
                    { item = "kungpao", count = 1 },
                }
            },
            okonomiyaki = {
                Title = "Okonomiyaki",
                description = "Required Items: Okonomiyaki mixtures, Eggs, Bacon, Okonomiyaki sauce, Dried Tuna, Mayonese, Oil, White cabbage",
                image = "https://i.imgur.com/BCxNBBN.png",
                metadata = {""},
                RequiredItems = {
                    { item = "okonomiyaki_mixtures", count = 1, remove = true },
                    { item = "eggs", count = 1, remove = true },
                    { item = "bacon", count = 1, remove = true },
                    { item = "okonomiyaki_sauce", count = 1, remove = true },
                    { item = "dried_tuna_katsuobushi", count = 1, remove = true },
                    { item = "mayonese", count = 1, remove = true },
                    { item = "oil", count = 1, remove = true },
                    { item = "white_cabbage", count = 1, remove = true },
                },
                AddItems = {
                    { item = "okonomiyaki", count = 1 },
                }
            },
            onigiri = {
                Title = "Onigiri",
                description = "Required Items: Rice, Nori, Rice Vinegar, Cane Sugar",
                image = "https://i.imgur.com/hT1wr6I.png",
                metadata = {""},
                RequiredItems = {
                    { item = "rice", count = 1, remove = true },
                    { item = "nori", count = 1, remove = true },
                    { item = "rice_vinegar", count = 1, remove = true },
                    { item = "cane_sugar", count = 1, remove = true },
                },
                AddItems = {
                    { item = "onigiri", count = 1 },
                }
            },
            soba = {
                Title = "Soba",
                description = "Required Items: Soba Noodles, Garlic, Chilli, Sesame Oil, Carrot, Brocoli, Mungo Sprouts, Spring Onion, Tofu",
                image = "https://i.imgur.com/9yPe7JL.png",
                metadata = {""},
                RequiredItems = {
                    { item = "soba_noodles", count = 1, remove = true },
                    { item = "garlic", count = 1, remove = true },
                    { item = "chilli", count = 1, remove = true },
                    { item = "sesame_oil", count = 1, remove = true },
                    { item = "carrot", count = 1, remove = true },
                    { item = "brocoli", count = 1, remove = true },
                    { item = "mungo_sprouts", count = 1, remove = true },
                    { item = "spring_onion", count = 1, remove = true },
                    { item = "tofu", count = 1, remove = true },
                },
                AddItems = {
                    { item = "soba", count = 1 },
                }
            },
            spring_rolls = {
                Title = "Spring Rolls",
                description = "Required Items: Rice Paper, Rice Noodles, Eggs, Milk, Carrot, Peanut Butter, Salad, Coriander",
                image = "https://i.imgur.com/Gy2vnrx.png",
                metadata = {""},
                RequiredItems = {
                    { item = "rice_paper", count = 1, remove = true },
                    { item = "rice_noodles", count = 1, remove = true },
                    { item = "eggs", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "carrot", count = 1, remove = true },
                    { item = "peanut_butter", count = 1, remove = true },
                    { item = "salad", count = 1, remove = true },
                    { item = "coriander", count = 1, remove = true },
                },
                AddItems = {
                    { item = "spring_rolls", count = 1 },
                }
            },
            sushi = {
                Title = "Sushi",
                description = "Required Items: Sushi Rice, Wakame, Cucumber, Carrot, Avocado, Lemon, Rice Vinegar, Cane Sugar, Wasabi Paste, Sesame Seeds, Soy Sauce",
                image = "https://i.imgur.com/GUW6v7b.png",
                metadata = {""},
                RequiredItems = {
                    { item = "sushi_rice", count = 1, remove = true },
                    { item = "wakame", count = 1, remove = true },
                    { item = "cucumber", count = 1, remove = true },
                    { item = "carrot", count = 1, remove = true },
                    { item = "avocado", count = 1, remove = true },
                    { item = "lemon", count = 1, remove = true },
                    { item = "rice_vinegar", count = 1, remove = true },
                    { item = "cane_sugar", count = 1, remove = true },
                    { item = "wasabi_paste", count = 1, remove = true },
                    { item = "sesame_seeds", count = 1, remove = true },
                    { item = "soy_sauce", count = 1, remove = true },
                },
                AddItems = {
                    { item = "sushi", count = 1 },
                }
            },
            udon = {
                Title = "Udon",
                description = "Required Items: Udon Noodles, Chicken Meat, Yellow Pepper, Red Pepper, Leek, Garlic, Oil, Soy Sauce, Rice Vinegar, Sesame Seeds",
                image = "https://i.imgur.com/vnsm6Wl.png",
                metadata = {""},
                RequiredItems = {
                    { item = "udon_noodles", count = 1, remove = true },
                    { item = "chicken_meat", count = 1, remove = true },
                    { item = "yellow_pepper", count = 1, remove = true },
                    { item = "red_pepper", count = 1, remove = true },
                    { item = "leek", count = 1, remove = true },
                    { item = "garlic", count = 1, remove = true },
                    { item = "oil", count = 1, remove = true },
                    { item = "soy_sauce", count = 1, remove = true },
                    { item = "rice_vinegar", count = 1, remove = true },
                    { item = "sesame_seeds", count = 1, remove = true },
                },
                AddItems = {
                    { item = "udon", count = 1 },
                }
            },
            yakitori = {
                Title = "Yakitori",
                description = "Required Items: Chicken Meat, Spring Onion, Oil, Bamboo Skewers, Soy Sauce, Mirin, Sake, Cane Sugar",
                image = "https://i.imgur.com/6T9LLU9.png",
                metadata = {""},
                RequiredItems = {
                    { item = "chicken_meat", count = 1, remove = true },
                    { item = "spring_onion", count = 1, remove = true },
                    { item = "oil", count = 1, remove = true },
                    { item = "bamboo_skewers", count = 1, remove = true },
                    { item = "soy_sauce", count = 1, remove = true },
                    { item = "mirin", count = 1, remove = true },
                    { item = "sake", count = 1, remove = true },
                    { item = "cane_sugar", count = 1, remove = true },
                },
                AddItems = {
                    { item = "yakitori", count = 1 },
                }
            },
        },
    },

    ToiletSinks = {
        SinksWC = {
            coords = vector3(-1044.12, -1491.78, 2.85),
            radius = 0.5,
            debug = false,
            WaterStream = vector3(-1044.12, -1491.78, 2.79),
            PedPosition = vector4(-1044.4816, -1491.3708, 2.7800, 217.5216),
            PedHeading = vector4(-1044.4816, -1491.3708, 2.7800, 217.5216),
        },
        SinksWC2 = {
            coords = vector3(-1043.2, -1491.23, 2.82),
            radius = 0.5,
            debug = false,
            WaterStream = vector3(-1043.2, -1491.25, 2.79),
            PedPosition = vector4(-1043.5302, -1490.7029, 2.7799, 212.4540),
            PedHeading = vector4(-1043.5302, -1490.7029, 2.7799, 212.4540),
        },
        SinksWC3 = {
            coords = vector3(-1048.22, -1485.9, 2.82),
            radius = 0.5,
            debug = false,
            WaterStream = vector3(-1048.22, -1485.7, 2.82),
            PedPosition = vector4(-1047.9200, -1486.3453, 2.7793, 35.6663),
            PedHeading = vector4(-1047.9200, -1486.3453, 2.7793, 35.6663),
        },
        SinksWC4 = {
            coords = vector3(-1047.36, -1485.28, 2.83),
            radius = 0.5,
            debug = false,
            WaterStream = vector3(-1047.36, -1485.28, 2.83),
            PedPosition = vector4(-1047.0205, -1485.8123, 2.7800, 59.2215),
            PedHeading = vector4(-1047.0205, -1485.8123, 2.7800, 59.2215),
        },
        SinksWC5 = {
            coords = vector3(-1057.19, -1436.76, -1.4),
            radius = 0.5,
            debug = false,
            WaterStream = vector3(-1057.19, -1436.76, -1.4),
            PedPosition = vector4(-1056.5728, -1436.8094, -1.4203, 85.8077),
            PedHeading = vector4(-1056.5728, -1436.8094, -1.4203, 85.8077),
        },
    },


    Toilets = {
        WC = {
            coords = vector3(-1047.83, -1493.02, 2.28),
            radius = 0.5,
            debug = false,
            PedPosition = vector4(-1047.8319, -1493.0206, 2.2800, 312.7695),
            PedHeading = vector4(-1047.8319, -1493.0206, 2.2800, 312.7695),
        },
        WC2 = {
            coords = vector3(-1048.72, -1491.77, 2.28),
            radius = 0.5,
            debug = false,
            PedPosition = vector4(-1048.7208, -1491.7670, 2.2800, 306.9867),
            PedHeading = vector4(-1048.7208, -1491.7670, 2.2800, 306.9867),
        },
        WC3 = {
            coords = vector3(-1049.74, -1490.3, 2.28),
            radius = 0.5,
            debug = false,
            PedPosition = vector4(-1049.7448, -1490.3007, 2.2800, 309.7232),
            PedHeading = vector4(-1049.7448, -1490.3007, 2.2800, 309.7232),
        },
        WC4 = {
            coords = vector3(-1050.7, -1488.94, 2.28),
            radius = 0.5,
            debug = false,
            PedPosition = vector4(-1050.6952, -1488.9375, 2.2800, 298.2640),
            PedHeading = vector4(-1050.6952, -1488.9375, 2.2800, 298.2640),
        },
        WC5 = {
            coords = vector3(-1054.36, -1434.73, -1.92),
            radius = 0.5,
            debug = false,
            PedPosition = vector4(-1054.3646, -1434.7256, -1.9203, 88.5625),
            PedHeading = vector4(-1054.3646, -1434.7256, -1.9203, 88.5625),
        },
    },

    Dispensor = {
        Zones = {
            Main = { coords = vector3(-1073.68, -1449.12, -1.17), radius = 0.25, debug = false },
        },
        
        Crafting = {
            greentea = {
                Title = "Green Tea",
                description = "Required Items: Tea Cup",
                image = "https://i.imgur.com/H89Hv1V.png",
                metadata = {""},
                RequiredItems = {
                    { item = "glass", count = 1, remove = true },
                },
                AddItems = {
                    { item = "greentea", count = 1 },
                }
            },
            gyokuro = {
                Title = "Gyokuro",
                description = "Required Items: Tea Cup",
                image = "https://i.imgur.com/GoCPpjr.png",
                metadata = {""},
                RequiredItems = {
                    { item = "glass", count = 1, remove = true },
                },
                AddItems = {
                    { item = "gyokuro", count = 1 },
                }
            },
            kombucha = {
                Title = "Kombucha",
                description = "Required Items: Tea Cup",
                image = "https://i.imgur.com/dKO7OHQ.png",
                metadata = {""},
                RequiredItems = {
                    { item = "glass", count = 1, remove = true },
                },
                AddItems = {
                    { item = "kombucha", count = 1 },
                }
            },
            matchatea = {
                Title = "Matcha tea",
                description = "Required Items: Tea Cup",
                image = "https://i.imgur.com/NJXAqQV.png",
                metadata = {""},
                RequiredItems = {
                    { item = "glass", count = 1, remove = true },
                },
                AddItems = {
                    { item = "matchatea", count = 1 },
                }
            },
            mugichatea = {
                Title = "Mugicha Tea",
                description = "Required Items: Tea Cup",
                image = "https://i.imgur.com/gxAgjMP.png",
                metadata = {""},
                RequiredItems = {
                    { item = "glass", count = 1, remove = true },
                },
                AddItems = {
                    { item = "mugichatea", count = 1 },
                }
            },
            cocacola = {
                Title = "Cocacola",
                description = "Required Items: Empty Cup",
                image = "https://i.imgur.com/B4n60r7.png",
                metadata = {""},
                RequiredItems = {
                    { item = "cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "cocacola", count = 1 },
                }
            },
            sprite = {
                Title = "Sprite",
                description = "Required Items: Empty Cup",
                image = "https://i.imgur.com/cXQWL21.png",
                metadata = {""},
                RequiredItems = {
                    { item = "cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "sprite", count = 1 },
                }
            },
            fanta = {
                Title = "Fanta",
                description = "Required Items: Empty Cup",
                image = "https://i.imgur.com/zjoFD4v.png",
                metadata = {""},
                RequiredItems = {
                    { item = "cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "fanta", count = 1 },
                }
            },
        },
    },

    BossMenu = {
          Main = { coords = vector3(-1054.2961, -1441.0243, -1.5621), radius = 0.36, debug = false },
     },

    IceMachine = {
        Zones = {
            FrontBar = { coords = vector3(-1074.94, -1449.39, -1.62), radius = 0.55, debug = false },
        },
        Crafting = {
            Ice = {
                Title = "Grab ice cube",
                description = "Ice cube is required in drinks!",
                RequiredItems = {
                    --{ item = nil, count = 1, remove = false },
                },
                AddItems = {
                    { item = "ice", count = 1 },
                }
            },
        },
    },

    Registers = {
        FrontBar = { coords = vector3(-1033.86, -1483.04, 4.71), radius = 0.50, debug = false, amount = 0 },
    },


    Stashes = {
        Stash1 = {
            name = "koi_stash1",
            label = "Stash #1",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 40000, -- 40 KG
            coords = vector3(-1068.41, -1444.92, -1.21),
            radius = 0.85,
            debug = false,
            job = "koi"
        },

        Stash2 = {
            name = "koi_stash2",
            label = "Stash #2",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 40000, -- 40 KG
            coords = vector3(-1067.3, -1444.24, -1.15),
            radius = 0.5,
            debug = false,
            job = "koi"
        },

        Stash3 = {
            name = "koi_stash3",
            label = "Stash #3",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 40000, -- 40 KG
            coords = vector3(-1074.46, -1440.01, -0.97),
            radius = 0.6,
            debug = false,
            job = "koi"
        },

        Stash4 = {
            name = "koi_stash4",
            label = "Stash #4",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 40,
            Weight = 40000, -- 40 KG
            coords = vector3(-1075.95, -1441.08, -0.98),
            radius = 0.6,
            debug = false,
            job = "koi"
        },

        Table = {
            name = "koi_table",
            label = "Koi Table #1",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1052.97, -1446.9, -1.64),
            radius = 0.4,
            debug = false
        },
        Table2 = {
            name = "koi_table2",
            label = "Koi Table #2",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1051.03, -1448.08, -1.62),
            radius = 0.4,
            debug = false
        },
        Table3 = {
            name = "koi_table3",
            label = "Koi Table #3",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1049.09, -1449.18, -1.63),
            radius = 0.4,
            debug = false
        },
        Table4 = {
            name = "koi_table4",
            label = "Koi Table #4",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1049.09, -1449.18, -1.63),
            radius = 0.4,
            debug = false
        },
        Table5 = {
            name = "koi_table5",
            label = "Koi Table #5",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1045.9, -1452.38, -1.62),
            radius = 0.4,
            debug = false
        },
        Table6 = {
            name = "koi_table6",
            label = "Koi Table #6",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1075.0748, -1470.1127, -1.3756),
            radius = 0.4,
            debug = false
        },
        Table7 = {
            name = "koi_table7",
            label = "Koi Table #7",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1044.97, -1454.44, -1.62),
            radius = 0.4,
            debug = false
        },
        Table8 = {
            name = "koi_table8",
            label = "Koi Table #8",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1043.75, -1456.37, -1.64),
            radius = 0.4,
            debug = false
        },
        Table9 = {
            name = "koi_table9",
            label = "Koi Table #9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1042.71, -1460.69, -1.6),
            radius = 0.4,
            debug = false
        },
        Table10 = {
            name = "koi_table10",
            label = "Koi Table #10",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1042.57, -1463.01, -1.62),
            radius = 0.4,
            debug = false
        },
        Table11 = {
            name = "koi_table11",
            label = "Koi Table #11",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1042.57, -1463.01, -1.62),
            radius = 0.4,
            debug = false
        },
        Table12 = {
            name = "koi_table12",
            label = "Koi Table #12",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1042.57, -1463.01, -1.62),
            radius = 0.4,
            debug = false
        },
        Table13 = {
            name = "koi_table13",
            label = "Koi Table #13",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1042.78, -1465.25, -1.62),
            radius = 0.4,
            debug = false
        },
        Table14 = {
            name = "koi_table14",
            label = "Koi Table #14",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1044.16, -1469.44, -1.61),
            radius = 0.4,
            debug = false
        },
        Table15 = {
            name = "koi_table15",
            label = "Koi Table #15",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1045.34, -1471.42, -1.62),
            radius = 0.4,
            debug = false
        },
        Table16 = {
            name = "koi_table16",
            label = "Koi Table #16",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1046.55, -1473.35, -1.59),
            radius = 0.4,
            debug = false
        },
        Table17 = {
            name = "koi_table17",
            label = "Koi Table #17",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1054.36, -1478.96, -1.64),
            radius = 0.4,
            debug = false
        },
        Table18 = {
            name = "koi_table18",
            label = "Koi Table #18",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1056.6, -1479.39, -1.63),
            radius = 0.4,
            debug = false
        },
        Table19 = {
            name = "koi_table19",
            label = "Koi Table #19",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1058.81, -1479.9, -1.64),
            radius = 0.4,
            debug = false
        },
        Table20 = {
            name = "koi_table20",
            label = "Koi Table #20",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(809.86, -758.52, 21.95),
            radius = 0.4,
            debug = false
        },
        Table21 = {
            name = "koi_table21",
            label = "Koi Table #21",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1065.37, -1481.83, -1.41),
            radius = 0.5,
            debug = false
        },
        Table22 = {
            name = "koi_table22",
            label = "Koi Table #22",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1067.75, -1477.65, -1.64),
            radius = 0.4,
            debug = false
        },
        Table23 = {
            name = "koi_table23",
            label = "Koi Table #23",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1069.37, -1476.69, -1.64),
            radius = 0.4,
            debug = false
        },
        Table24 = {
            name = "koi_table24",
            label = "Koi Table #24",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1074.13, -1476.41, -1.36),
            radius = 0.5,
            debug = false
        },
        Table25 = {
            name = "koi_table25",
            label = "Koi Table #25",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1074.15, -1471.64, -1.63),
            radius = 0.4,
            debug = false
        },
        Table26 = {
            name = "koi_table26",
            label = "Koi Table #26",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1074.95, -1470.21, -1.61),
            radius = 0.4,
            debug = false
        },
        Table27 = {
            name = "koi_table27",
            label = "Koi Table #27",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1079.38, -1467.52, -1.44),
            radius = 0.5,
            debug = false
        },
        Table28 = {
            name = "koi_table28",
            label = "Koi Table #28",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1076.87, -1461.06, -1.59),
            radius = 0.4,
            debug = false
        },
        Table29 = {
            name = "koi_table29",
            label = "Koi Table #29",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1076.44, -1458.82, -1.59),
            radius = 0.4,
            debug = false
        },
        Table30 = {
            name = "koi_table30",
            label = "Koi Table #30",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1075.99, -1456.57, -1.62),
            radius = 0.4,
            debug = false
        },
        Table31 = {
            name = "koi_table31",
            label = "Koi Table #31",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1058.73, -1453.71, -1.59),
            radius = 0.4,
            debug = false
        },
        Table32 = {
            name = "koi_table32",
            label = "Koi Table #32",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1053.05, -1456.74, -1.6),
            radius = 0.4,
            debug = false
        },
        Table33 = {
            name = "koi_table33",
            label = "Koi Table #33",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1050.85, -1462.82, -1.61),
            radius = 0.4,
            debug = false
        },
        Table34 = {
            name = "koi_table34",
            label = "Koi Table #34",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1062.77, -1471.11, -1.61),
            radius = 0.4,
            debug = false
        },
        Table35 = {
            name = "koi_table35",
            label = "Koi Table #35",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1067.73, -1467.06, -1.59),
            radius = 0.4,
            debug = false
        },
        Table36 = {
            name = "koi_table36",
            label = "Koi Table #36",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1068.52, -1460.66, -1.61),
            radius = 0.4,
            debug = false
        },
        Table37 = {
            name = "koi_table37",
            label = "Koi Table #37",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1065.04, -1455.23, -1.61),
            radius = 0.4,
            debug = false
        },
        Table38 = {
            name = "koi_table38",
            label = "Koi Table #38",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1061.91, -1468.65, -1.23),
            radius = 0.4,
            debug = false
        },
        Table39 = {
            name = "koi_table39",
            label = "Koi Table #39",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1065.57, -1465.77, -1.21),
            radius = 0.4,
            debug = false
        },
        Table40 = {
            name = "koi_table40",
            label = "Koi Table #40",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1066.15, -1461.2, -1.16),
            radius = 0.4,
            debug = false
        },
        Table41 = {
            name = "koi_table41",
            label = "Koi Table #41",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1063.4, -1457.56, -1.21),
            radius = 0.4,
            debug = false
        },
        Table42 = {
            name = "koi_table42",
            label = "Koi Table #42",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1059.08, -1456.61, -1.18),
            radius = 0.4,
            debug = false
        },
        Table43 = {
            name = "koi_table43",
            label = "Koi Table #43",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1055.2, -1458.63, -1.21),
            radius = 0.4,
            debug = false
        },
        Table44 = {
            name = "koi_table44",
            label = "Koi Table #44",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1053.51, -1462.79, -1.22),
            radius = 0.4,
            debug = false
        },
        Table45 = {
            name = "koi_table45",
            label = "Koi Table #45",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1057.11, -1461.83, -1.11),
            radius = 0.6,
            debug = false
        },
        Table46 = {
            name = "koi_table46",
            label = "Koi Table #46",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1060.49, -1465.52, -1.12),
            radius = 0.6,
            debug = false
        },
        Table47 = {
            name = "koi_table47",
            label = "Koi Table #47",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 10,
            Weight = 15000, -- 15 KG
            coords = vector3(-1061.8, -1460.84, -1.05),
            radius = 0.6,
            debug = false
        },

    },
}

--BLIPS
Config.Blips = {
    koi = { -- do not use same value twice (will result in overwriting of blip)
        BlipCoords = vec3(-1034.8756, -1482.7997, 4.5796), -- Blip coords
        Sprite = 317, -- Blip Icon
        Display = 4, -- keep 4
        Scale = 0.7, -- Size of blip
        Colour = 2, -- colour
        Name = "KOI Restaurant" -- Blip name
    },
}

--Job BLIPS
Config.JobBlips = {
    PawnShop = { -- do not use same value twice (will result in overwriting of blip)
        BlipCoords = vec3(1242.1877, -3196.7468, 6.0282), -- Blip coords
        Sprite = 59, -- Blip Icon
        Display = 4, -- keep 4
        Scale = 0.5, -- Size of blip
        Colour = 2, -- colour
        Name = "KOI Restaurant - Shop" -- Blip name
    },
}

--Shop
Config.Shop = {
    Header = "KOI Shop",
    Items = {
        { label = 'Cocacola Clear', item = 'cocacola_clear', description = "Buy Cocacola Clear for: $", price = 25, MinAmount = 5, MaxAmount = 15, image = "https://i.imgur.com/J4iBzxB.png", metadata = {""}  },
        { label = 'Ramune Lychee', item = 'ramune_lychee', description = "Buy Ramune Lychee for: $", price = 25, MinAmount = 5, MaxAmount = 515, image = "https://i.imgur.com/oUbEP1i.png", metadata = {""}  },
        { label = 'Ramune Original', item = 'ramune_original', description = "Buy Ramune Orignal for: $", price = 25, MinAmount = 5, MaxAmount = 15, image = "https://imgur.com/Cw0Rc0U.png", metadata = {""}  },
        { label = 'Ramune Strawberry', item = 'ramune_strawberry', description = "Buy Ramune Strawberry for: $", price = 25, MinAmount = 5, MaxAmount = 15, image = "https://i.imgur.com/3Q9klc8.png", metadata = {""}  },
        { label = 'Ramune Watermelon', item = 'ramune_watermelon', description = "Buy Ramune Watermelon for: $", price = 25, MinAmount = 5, MaxAmount = 15, image = "https://i.imgur.com/fxUOYi5.png", metadata = {""}  },
        { label = 'Plate', item = 'plate', description = "Buy Plate for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://imgur.com/hMB1i9N.png", metadata = {""}  },
        { label = 'Cup', item = 'cup', description = "Buy Cup for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/AIvSFMk.png", metadata = {""}  },
        { label = 'Tea Cup', item = 'glass', description = "Buy Tea Cup for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/KhvYme3.png", metadata = {""}  },
        { label = 'Avocado', item = 'avocado', description = "Buy Avocado for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/p05kVnn.png", metadata = {""}  },
        { label = 'Bacon', item = 'bacon', description = "Buy Bacon for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/nOFTWWc.png", metadata = {""}  },
        { label = 'Bamboo Skewers', item = 'bamboo_skewers', description = "Buy Bamboo Skewers for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/2KmR4y7.png", metadata = {""}  },
        { label = 'Beef leg', item = 'beef_leg', description = "Buy Beef Leg for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/kJ5f5am.png", metadata = {""}  },
        { label = 'Brisket', item = 'brisket', description = "Buy Briskets for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/UrgcmDx.png", metadata = {""}  },
        { label = 'Brocoli', item = 'brocoli', description = "Buy Brocoli for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/89jKeML.png", metadata = {""}  },
        { label = 'Cane sugar', item = 'cane_sugar', description = "Buy Cane Sugar for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/sJ9PWsm.png", metadata = {""}  },
        { label = 'Carrot', item = 'carrot', description = "Buy Carrot for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/dWPB68s.png", metadata = {""}  },
        { label = 'Coconut Milk', item = 'coconut_milk', description = "Buy Coconut Milk for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/17RrHy2.png", metadata = {""}  },
        { label = 'Coriander', item = 'coriander', description = "Buy Coriander for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/OxaUJUR.png", metadata = {""}  },
        { label = 'Cucumber', item = 'cucumber', description = "Buy Cucumber for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/4vWd3jH.png", metadata = {""}  },
        { label = 'Dorayaki', item = 'dorayaki', description = "Buy Dorayaki for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/v0jG4vP.png", metadata = {""}  },
        { label = 'Dried Tuna katsuobushi', item = 'dried_tuna_katsuobushi', description = "Buy Dried Tuna for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/v0jG4vP.png", metadata = {""}  },
        { label = 'Eggs', item = 'eggs', description = "Buy Eggs for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/1j9voxy.png", metadata = {""}  },
        { label = 'Fish Sauce', item = 'fish_sauce', description = "Buy Fish Sauce for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/D9A9RUb.png", metadata = {""}  },
        { label = 'Garlic', item = 'garlic', description = "Buy Garlic for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/7BJMW7l.png", metadata = {""}  },
        { label = 'Chicken Meat', item = 'chicken_meat', description = "Buy Chicken Meat for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/7BJMW7l.png", metadata = {""}  },
        { label = 'Chilli', item = 'chilli', description = "Buy Chilli for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/7BJMW7l.png", metadata = {""}  },
        { label = 'Chinese Rice Wine', item = 'chinese_rice_wine', description = "Buy Chinese rice wine for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/caeyiAF.png", metadata = {""}  },
        { label = 'Chocolate', item = 'chocolate', description = "Buy Chocolate for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/6rIJGOh.png", metadata = {""}  },
        { label = 'Japanese Cheesecake', item = 'japanese_cheesecake', description = "Buy Japanese Cheesecake for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/OjFcTP0.png", metadata = {""}  },
        { label = 'Leek', item = 'leek', description = "Buy Leek for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/gkXR1NO.png", metadata = {""}  },
        { label = 'Lemon', item = 'lemon', description = "Buy Lemon for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/Wfq1ALf.png", metadata = {""}  },
        { label = 'Matcha swiss', item = 'matcha_swiss', description = "Buy Matcha Swiss for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/1lkiEcz.png", metadata = {""}  },
        { label = 'Mayonese', item = 'mayonese', description = "Buy Mayonese for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/IhWoywk.png", metadata = {""}  },
        { label = 'Milk', item = 'milk', description = "Buy Milk for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/oBvJxR7.png", metadata = {""}  },
        { label = 'Mirin', item = 'mirin', description = "Buy Mirin for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/BhuNda8.png", metadata = {""}  },
        { label = 'Mungo Sprouts', item = 'mungo_sprouts', description = "Buy Mungo Sprouts for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/3AEaGri.png", metadata = {""}  },
        { label = 'Nori', item = 'nori', description = "Buy Nori for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/ZZSa4lf.png", metadata = {""}  },
        { label = 'Oil', item = 'oil', description = "Buy Oil for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/4rTGQgk.png", metadata = {""}  },
        { label = 'Okonomiyaki mixtures', item = 'okonomiyaki_mixtures', description = "Buy Okonomiyaki Mixtures for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/4KP3s3i.png", metadata = {""}  },
        { label = 'Okonomiyaki sauce', item = 'okonomiyaki_sauce', description = "Buy Okonomiyaki Sauce for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/WOPeHzo.png", metadata = {""}  },
        { label = 'Peanut butter', item = 'peanut_butter', description = "Buy Peanut Butter for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/Di97yZ4.png", metadata = {""}  },
        { label = 'Potato Strach', item = 'potato_starch', description = "Buy Strach for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/SqZeR27.png", metadata = {""}  },
        { label = 'Red Pepper', item = 'red_pepper', description = "Buy Red Pepper for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/tm5pS12.png", metadata = {""}  },
        { label = 'Rice', item = 'rice', description = "Buy Rice for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/4UUd2vx.png", metadata = {""}  },
        { label = 'Rice Flour', item = 'rice_flour', description = "Buy Rice Flour for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/xkmGZfF.png", metadata = {""}  },
        { label = 'Rice Noodles', item = 'rice_noodles', description = "Buy Rice Noodles for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/iwzpklp.png", metadata = {""}  },
        { label = 'Rice Paper', item = 'rice_paper', description = "Buy Rice paper for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/iwzpklp.png", metadata = {""}  },
        { label = 'Rice Vinegar', item = 'rice_vinegar', description = "Buy Rice Vinegar for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/jZLfAU2.png", metadata = {""}  },
        { label = 'Sake', item = 'sake', description = "Buy Sake for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/Dt1FTEc.png", metadata = {""}  },
        { label = 'Salad', item = 'salad', description = "Buy Salad for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/VnZsDLm.png", metadata = {""}  },
        { label = 'Sesame Oil', item = 'sesame_oil', description = "Buy Sesame Oil for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/Wp5llgG.png", metadata = {""}  },
        { label = 'Sesame seeds', item = 'sesame_seeds', description = "Buy Sesame seeds for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/3U6TGge.png", metadata = {""}  },
        { label = 'Shelled Peeanuts', item = 'shelled_peanuts', description = "Buy Shelled Peanuts for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/nSfSHbz.png", metadata = {""}  },
        { label = 'Shrimp', item = 'shrimp', description = "Buy Shrimp for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/WS68Hai.png", metadata = {""}  },
        { label = 'Soba Noodles', item = 'soba_noodles', description = "Buy Soba Noodles for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/wsrn6IW.png", metadata = {""}  },
        { label = 'Soy Sauce', item = 'soy_sauce', description = "Buy Soy Sauce for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/ZuQufhS.png", metadata = {""}  },
        { label = 'Spring Onion', item = 'spring_onion', description = "Buy Spring Onion for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/G854EH9.png", metadata = {""}  },
        { label = 'Sugar', item = 'sugar', description = "Buy Sugar for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/YnlvOJs.png", metadata = {""}  },
        { label = 'Sushi Rice', item = 'sushi_rice', description = "Buy Sushi Rice for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/eMP06G0.png", metadata = {""}  },
        { label = 'Tofu', item = 'tofu', description = "Buy Tofu for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/f5oPagQ.png", metadata = {""}  },
        { label = 'Turmeric', item = 'turmeric', description = "Buy Turmeric for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/XHpwjCP.png", metadata = {""}  },
        { label = 'Udon Noodles', item = 'udon_noodles', description = "Buy Udon noodles for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/bRqRXHi.png", metadata = {""}  },
        { label = 'Wakame', item = 'wakame', description = "Buy Wakame for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/wOol7Lg.png", metadata = {""}  },
        { label = 'Wasabi Paste', item = 'wasabi_paste', description = "Buy Wasabi Paste for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/KzMe0xg.png", metadata = {""}  },
        { label = 'White Cabbage', item = 'white_cabbage', description = "Buy White cabbage for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/BSxzmtc.png", metadata = {""}  },
        { label = 'Yellow pepper', item = 'yellow_pepper', description = "Buy Yellow Pepper for: $", price = 20, MinAmount = 5, MaxAmount = 5, image = "https://i.imgur.com/CrwxVSI.png", metadata = {""}  },

    },
    Ped = {
        { model = "u_m_y_mani", coords = vec4(1242.1877, -3196.7468, 5.0282, 267.8267), scenario = "WORLD_HUMAN_SMOKING" },
    },
}

-- Consumables / Drinking / Eating  
Config.Consumables = {

    --EAT
    banhxeo = { -- Item name
        Log = "You ate Banh xeo",
        Remove = true, -- Remove item
        RemoveItem = "banhxeo", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_cs_burger_01',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    bunbonambo = { -- Item name
        Log = "You ate Bun bo Nam Bo",
        Remove = true, -- Remove item
        RemoveItem = "bunbonambo", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_cs_burger_01',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    kungpao = { -- Item name
        Log = "You ate Kung pao",
        Remove = true, -- Remove item
        RemoveItem = "kungpao", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_cs_burger_01',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    okonomiyaki = { -- Item name
        Log = "You ate Okonomiyaki",
        Remove = true, -- Remove item
        RemoveItem = "okonomiyaki", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_cs_burger_01',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    onigiri = { -- Item name
        Log = "You ate Onigiri ",
        Remove = true, -- Remove item
        RemoveItem = "onigiri", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_cs_burger_01',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    soba = { -- Item name
        Log = "You ate Soba",
        Remove = true, -- Remove item
        RemoveItem = "soba", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_cs_burger_01',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    spring_rolls = { -- Item name
        Log = "You ate Spring Rolls",
        Remove = true, -- Remove item
        RemoveItem = "spring_rolls", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_cs_burger_01',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    sushi = { -- Item name
        Log = "You ate Sushi",
        Remove = true, -- Remove item
        RemoveItem = "sushi", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_cs_burger_01',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    udon = { -- Item name
        Log = "You ate Udon",
        Remove = true, -- Remove item
        RemoveItem = "udon", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_cs_burger_01',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    yakitori = { -- Item name
        Log = "You ate Yakitori",
        Remove = true, -- Remove item
        RemoveItem = "yakitori", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 6500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_cs_burger_01',
                    bone = 18905,
                    pos = vec3(0.13, 0.06, 0.02),
                    rot = vec3(-130.0, -7.0, 0.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SMOKING_POT"
                },
            },
        }
    },
    cocacola_clear = { -- Item name
        Log = "You drunk Coca Cola Clear",
        Remove = true, -- Remove item
        RemoveItem = "cocacola_clear", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 57005,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    greentea = { -- Item name
        Log = "You drunk Green Tea",
        Remove = true, -- Remove item
        RemoveItem = "greentea", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 57005,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    gyokuro = { -- Item name
        Log = "You drunk Gyokuro",
        Remove = true, -- Remove item
        RemoveItem = "gyokuro", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 57005,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    kombucha = { -- Item name
        Log = "You drunk Kombucha",
        Remove = true, -- Remove item
        RemoveItem = "kombucha", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 57005,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    matchatea = { -- Item name
        Log = "You drunk Matcha Tea",
        Remove = true, -- Remove item
        RemoveItem = "matchatea", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 57005,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    mugichatea = { -- Item name
        Log = "You drunk Mugicha Tea",
        Remove = true, -- Remove item
        RemoveItem = "mugichatea", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 57005,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    ramune_lychee = { -- Item name
        Log = "You drunk Ramune Lychee",
        Remove = true, -- Remove item
        RemoveItem = "ramune_lychee", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 57005,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    ramune_original = { -- Item name
        Log = "You drunk Ramune Original",
        Remove = true, -- Remove item
        RemoveItem = "ramune_original", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 57005,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    ramune_strawberry = { -- Item name
        Log = "You drunk Ramune Strawberry",
        Remove = true, -- Remove item
        RemoveItem = "ramune_strawberry", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 57005,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
    ramune_watermelon = { -- Item name
        Log = "You drunk Ramune Watermelon",
        Remove = true, -- Remove item
        RemoveItem = "ramune_watermelon", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "dirty_cup", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 6500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'p_amb_coffeecup_01',
                    bone = 57005,
                    pos = vec3(0.15, 0.02, -0.03),
                    rot = vec3(-70.0, 30.0, 10.0)
                },
            },
            scenario = {
                enabled = false,
                anim = {
                    scenario = "WORLD_HUMAN_SEAT_LEDGE_EATING"
                },
            },
        }
    },
}

Config.ChairsDebug = false
Config.Chairs = {
    -- CHAIRS 1
    {
        coords = vector3(-1053.37, -1446.04, -1.87), offsetZ = -0.10, heading = 240.82, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1054.26, -1447.36, -2.42, 152.19)
    },
    {
        coords = vector3(-1053.81, -1446.84, -1.86), offsetZ = -0.10, heading = 241.01, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1054.26, -1447.36, -2.42, 152.19)
    },
    {
        coords = vector3(-1052.55, -1447.57, -1.87), offsetZ = -0.10, heading = 58.33, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1052.96, -1448.15, -2.42, 156.68)
    },
    {
        coords = vector3(-1052.07, -1446.82, -1.87), offsetZ = -0.10, heading = 60.81, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1052.96, -1448.15, -2.42, 156.68)
    },
    {
        coords = vector3(-1051.78, -1448.01, -1.9), offsetZ = -0.10, heading = 237.89, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1052.1627, -1448.6251, -1.4203, 149.9293)
    },
    {
        coords = vector3(-1051.43, -1447.23, -1.87), offsetZ = -0.10, heading = 237.98, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1052.1627, -1448.6251, -1.4203, 149.9293)
    },
    {
        coords = vector3(-1050.6, -1448.77, -1.87), offsetZ = -0.10, heading = 58.18, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1051.1482, -1449.2349, -1.4203, 148.4538)
    },
    {
        coords = vector3(-1050.16, -1448.01, -1.86), offsetZ = -0.10, heading = 59.71, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1051.1482, -1449.2349, -1.4203, 148.4538)
    },
    {
        coords = vector3(-1049.89, -1449.18, -1.88), offsetZ = -0.10, heading = 239.81, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1050.2571, -1449.8329, -1.4203, 159.4575)
    },
    {
        coords = vector3(-1049.44, -1448.4, -1.88), offsetZ = -0.10, heading = 239.81, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1050.2571, -1449.8329, -1.4203, 159.4575)
    },
    {
        coords = vector3(-1048.31, -1449.06, -1.87), offsetZ = -0.10, heading = 60.52, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1049.0466, -1450.4976, -1.4203, 155.6500)
    },
    {
        coords = vector3(-1048.78, -1449.82, -1.87), offsetZ = -0.10, heading = 59.69, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1049.0466, -1450.4976, -1.4203, 155.6500)
    },
    -- CHAIRS 2
    {
        coords = vector3(-1046.55, -1452.03, -1.84), offsetZ = -0.10, heading = 209.51, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1047.1608, -1452.5010, -1.4203, 125.5850)
    },
    {
        coords = vector3(-1045.91, -1451.64, -1.88), offsetZ = -0.10, heading = 208.32, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1047.1608, -1452.5010, -1.4203, 125.5850)
    },
    {
        coords = vector3(-1045.34, -1452.56, -1.87), offsetZ = -0.10, heading = 29.23, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1046.7026, -1453.5226, -1.4203, 125.4557)
    },
    {
        coords = vector3(-1045.97, -1453.08, -1.87), offsetZ = -0.10, heading = 30.61, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1046.7026, -1453.5226, -1.4203, 125.4557)
    },
    {
        coords = vector3(-1045.49, -1453.99, -1.86), offsetZ = -0.10, heading = 206.7, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1046.1138, -1454.4044, -1.4203, 122.6149)
    },
    {
        coords = vector3(-1044.76, -1453.58, -1.86), offsetZ = -0.10, heading = 208.59, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1046.1138, -1454.4044, -1.4203, 122.6149)
    },
    {
        coords = vector3(-1044.12, -1454.74, -1.86), offsetZ = -0.10, heading = 31.37, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1045.5282, -1455.4653, -1.4203, 123.3528)
    },
    {
        coords = vector3(-1044.88, -1455.13, -1.85), offsetZ = -0.10, heading = 31.01, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1045.5282, -1455.4653, -1.4203, 123.3528)
    },
    {
        coords = vector3(-1044.46, -1455.97, -1.84), offsetZ = -0.10, heading = 209.76, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1045.0742, -1456.2784, -1.4203, 121.9853)
    },
    {
        coords = vector3(-1043.63, -1455.52, -1.86), offsetZ = -0.10, heading = 205.79, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1045.0742, -1456.2784, -1.4203, 121.9853)
    },
    {
        coords = vector3(-1043.06, -1456.68, -1.88), offsetZ = -0.10, heading = 28.19, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1044.4144, -1457.4705, -1.4203, 122.7066)
    },
    {
        coords = vector3(-1043.86, -1457.14, -1.88), offsetZ = -0.10, heading = 27.91, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1044.4144, -1457.4705, -1.4203, 122.7066)
    },
    -- CHAIRS 3
    {
        coords = vector3(-1043.0, -1460.0, -1.89), offsetZ = -0.10, heading = 178.24, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.7589, -1460.0880, -1.4203, 93.1477)
    },
    {
        coords = vector3(-1042.22, -1460.02, -1.89), offsetZ = -0.10, heading = 177.61, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.7589, -1460.0880, -1.4203, 93.1477)
    },
    {
        coords = vector3(-1042.22, -1461.31, -1.9), offsetZ = -0.10, heading = 359.38, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.8529, -1461.3831, -1.4203, 92.4297)
    },
    {
        coords = vector3(-1043.08, -1461.39, -1.87), offsetZ = -0.10, heading = 357.3, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.8529, -1461.3831, -1.4203, 92.4297)
    },
    {
        coords = vector3(-1043.02, -1462.31, -1.88), offsetZ = -0.10, heading = 178.64, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.8103, -1462.2220, -1.4203, 102.0373)
    },
    {
        coords = vector3(-1042.15, -1462.29, -1.88), offsetZ = -0.10, heading = 177.94, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.8103, -1462.2220, -1.4203, 102.0373)
    },
    {
        coords = vector3(-1042.26, -1463.63, -1.87), offsetZ = -0.10, heading = 0.38, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.8175, -1463.5233, -1.4207, 94.3748)
    },
    {
        coords = vector3(-1043.09, -1463.63, -1.87), offsetZ = -0.10, heading = 359.08, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.8175, -1463.5233, -1.4207, 94.3748)
    },
    {
        coords = vector3(-1043.13, -1464.54, -1.85), offsetZ = -0.10, heading = 179.92, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.8362, -1464.5770, -1.4203, 102.4204)
    },
    {
        coords = vector3(-1042.25, -1464.6, -1.85), offsetZ = -0.10, heading = 176.37, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.8362, -1464.5770, -1.4203, 102.4204)
    },
    {
        coords = vector3(-1042.29, -1465.9, -1.88), offsetZ = -0.10, heading = 0.19, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.8606, -1465.8931, -1.4203, 97.5195)
    },
    {
        coords = vector3(-1043.14, -1465.91, -1.88), offsetZ = -0.10, heading = 358.22, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1043.8606, -1465.8931, -1.4203, 97.5195)
    },
    -- CHAIRS 4
    {
        coords = vector3(-1043.96, -1468.76, -1.87), offsetZ = -0.10, heading = 147.59, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1044.6609, -1468.3497, -1.4203, 71.6796)
    },
    {
        coords = vector3(-1043.2, -1469.23, -1.87), offsetZ = -0.10, heading = 147.55, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1044.6609, -1468.3497, -1.4203, 71.6796)
    },
    {
        coords = vector3(-1043.93, -1470.28, -1.85), offsetZ = -0.10, heading = 330.15, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1045.2670, -1469.4651, -1.4233, 57.3359)
    },
    {
        coords = vector3(-1044.72, -1469.84, -1.85), offsetZ = -0.10, heading = 328.1, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1045.2670, -1469.4651, -1.4233, 57.3359)
    },
    {
        coords = vector3(-1045.17, -1470.66, -1.87), offsetZ = -0.10, heading = 146.49, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1045.8553, -1470.3855, -1.4203, 68.3268)
    },
    {
        coords = vector3(-1044.41, -1471.1, -1.87), offsetZ = -0.10, heading = 147.75, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1045.8553, -1470.3855, -1.4203, 68.3268)
    },
    {
        coords = vector3(-1045.1, -1472.2, -1.86), offsetZ = -0.10, heading = 329.68, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1046.4423, -1471.4227, -1.4203, 55.7971)
    },
    {
        coords = vector3(-1045.97, -1471.77, -1.88), offsetZ = -0.10, heading = 328.23, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1046.4423, -1471.4227, -1.4203, 55.7971)
    },
    {
        coords = vector3(-1046.35, -1472.61, -1.86), offsetZ = -0.10, heading = 149.08, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1046.9403, -1472.1946, -1.4203, 62.3997)
    },
    {
        coords = vector3(-1045.57, -1473.08, -1.86), offsetZ = -0.10, heading = 146.68, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1046.9403, -1472.1946, -1.4203, 62.3997)
    },
    {
        coords = vector3(-1046.34, -1474.3, -1.86), offsetZ = -0.10, heading = 329.55, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1047.5908, -1473.2988, -1.4204, 74.7904)
    },
    {
        coords = vector3(-1047.03, -1473.76, -1.88), offsetZ = -0.10, heading = 328.45, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1047.5908, -1473.2988, -1.4204, 74.7904)
    },
    -- CHAIRS 5
    {
        coords = vector3(-1053.76, -1478.5, -1.88), offsetZ = -0.10, heading = 100.8, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1053.8875, -1477.7864, -1.4203, 18.3261)
    },
    {
        coords = vector3(-1053.58, -1479.39, -1.87), offsetZ = -0.10, heading = 99.7, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1053.8875, -1477.7864, -1.4203, 18.3261)
    },
    {
        coords = vector3(-1054.89, -1479.62, -1.89), offsetZ = -0.10, heading = 281.55, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1055.1862, -1478.0897, -1.4203, 8.4068)
    },
    {
        coords = vector3(-1055.09, -1478.81, -1.88), offsetZ = -0.10, heading = 281.47, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1055.1862, -1478.0897, -1.4203, 8.4068)
    },
    {
        coords = vector3(-1056.0, -1478.93, -1.88), offsetZ = -0.10, heading = 98.73, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1056.2179, -1478.2771, -1.4203, 25.4901)
    },
    {
        coords = vector3(-1055.83, -1479.87, -1.88), offsetZ = -0.10, heading = 99.36, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1056.2179, -1478.2771, -1.4203, 25.4901)
    },
    {
        coords = vector3(-1057.06, -1480.05, -1.89), offsetZ = -0.10, heading = 281.73, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1057.4148, -1478.5227, -1.4203, 16.4521)
    },
    {
        coords = vector3(-1057.34, -1479.13, -1.89), offsetZ = -0.10, heading = 280.82, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1057.4148, -1478.5227, -1.4203, 16.4521)
    },
    {
        coords = vector3(-1058.24, -1479.34, -1.86), offsetZ = -0.10, heading = 102.8, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1058.5142, -1478.7097, -1.4203, 21.8572)
    },
    {
        coords = vector3(-1058.02, -1480.28, -1.87), offsetZ = -0.10, heading = 98.2, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1058.5142, -1478.7097, -1.4203, 21.8572)
    },
    {
        coords = vector3(-1059.34, -1480.49, -1.9), offsetZ = -0.10, heading = 281.74, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1059.6239, -1478.9528, -1.4203, 7.2041)
    },
    {
        coords = vector3(-1059.52, -1479.64, -1.88), offsetZ = -0.10, heading = 279.61, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1059.6239, -1478.9528, -1.4203, 7.2041)
    },
    -- CHAIRS 6
    {
        coords = vector3(-1066.97, -1477.02, -1.89), offsetZ = -0.10, heading = 148.81, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1066.6729, -1476.4878, -1.4203, 332.3923)
    },
    {
        coords = vector3(-1067.72, -1476.67, -1.9), offsetZ = -0.10, heading = 151.61, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1067.3264, -1476.1564, -1.4203, 327.5104)
    },
    {
        coords = vector3(-1068.49, -1476.13, -1.92), offsetZ = -0.10, heading = 149.25, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1068.1616, -1475.6404, -1.4203, 329.5304)
    },
    {
        coords = vector3(-1069.24, -1475.78, -1.89), offsetZ = -0.10, heading = 148.38, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1068.8284, -1475.2512, -1.4203, 333.8537)
    },
    {
        coords = vector3(-1067.94, -1478.65, -1.89), offsetZ = -0.10, heading = 328.94, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1067.2371, -1478.9395, -1.4203, 357.7563)
    },
    {
        coords = vector3(-1068.73, -1478.25, -1.88), offsetZ = -0.10, heading = 327.84, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1067.2371, -1478.9395, -1.4203, 357.7563)
    },
    {
        coords = vector3(-1069.39, -1477.75, -1.9), offsetZ = -0.10, heading = 330.79, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1070.7869, -1476.8999, -1.4254, 328.9434)
    },
    {
        coords = vector3(-1070.17, -1477.3, -1.9), offsetZ = -0.10, heading = 328.94, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1070.7869, -1476.8999, -1.4254, 328.9434)
    },
    -- CHAIRS 7
    {
        coords = vector3(-1074.82, -1472.37, -1.92), offsetZ = -0.10, heading = 297.54, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1074.4634, -1473.0238, -1.4203, 291.6845)
    },
    {
        coords = vector3(-1075.26, -1471.74, -1.89), offsetZ = -0.10, heading = 298.25, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1074.4634, -1473.0238, -1.4203, 291.6845)
    },
    {
        coords = vector3(-1075.77, -1470.92, -1.87), offsetZ = -0.10, heading = 297.47, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1076.3041, -1469.5004, -1.4203, 294.7036)
    },
    {
        coords = vector3(-1076.01, -1470.24, -1.89), offsetZ = -0.10, heading = 300.54, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1076.3041, -1469.5004, -1.4203, 294.7036)
    },
    {
        coords = vector3(-1073.22, -1471.54, -1.88), offsetZ = -0.10, heading = 120.62, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1072.5448, -1471.3231, -1.4203, 299.9695)
    },
    {
        coords = vector3(-1073.57, -1470.79, -1.92), offsetZ = -0.10, heading = 117.63, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1073.0331, -1470.4366, -1.4203, 302.4357)
    },
    {
        coords = vector3(-1074.0, -1469.97, -1.93), offsetZ = -0.10, heading = 115.86, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1073.4863, -1469.6354, -1.4203, 301.2030)
    },
    {
        coords = vector3(-1074.46, -1469.27, -1.91), offsetZ = -0.10, heading = 121.06, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1073.8666, -1468.8975, -1.4203, 293.8940)
    },
    -- CHAIRS 8
    {
        coords = vector3(-1076.8, -1461.77, -1.87), offsetZ = -0.10, heading = 345.39, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1076.1179, -1461.9733, -1.4203, 263.1633)
    },
    {
        coords = vector3(-1077.62, -1461.58, -1.88), offsetZ = -0.10, heading = 347.71, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1076.1179, -1461.9733, -1.4203, 263.1633)
    },
    {
        coords = vector3(-1077.38, -1460.23, -1.88), offsetZ = -0.10, heading = 167.67, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.8754, -1460.8424, -1.4203, 248.5288)
    },
    {
        coords = vector3(-1076.46, -1460.64, -1.88), offsetZ = -0.10, heading = 163.77, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.8754, -1460.8424, -1.4203, 248.5288)
    },
    {
        coords = vector3(-1076.28, -1459.56, -1.91), offsetZ = -0.10, heading = 346.3, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.5707, -1459.5641, -1.4203, 268.3261)
    },
    {
        coords = vector3(-1077.22, -1459.35, -1.89), offsetZ = -0.10, heading = 344.69, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.5707, -1459.5641, -1.4203, 268.3261)
    },
    {
        coords = vector3(-1076.83, -1458.04, -1.89), offsetZ = -0.10, heading = 167.09, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.3208, -1458.4512, -1.4203, 263.6985)
    },
    {
        coords = vector3(-1075.99, -1458.23, -1.89), offsetZ = -0.10, heading = 167.92, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.3208, -1458.4512, -1.4203, 263.6985)
    },
    {
        coords = vector3(-1075.82, -1457.32, -1.88), offsetZ = -0.10, heading = 346.03, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.0162, -1457.3452, -1.4203, 268.1343)
    },
    {
        coords = vector3(-1076.73, -1457.12, -1.88), offsetZ = -0.10, heading = 345.44, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.0162, -1457.3452, -1.4203, 268.1343)
    },
    {
        coords = vector3(-1076.33, -1455.89, -1.89), offsetZ = -0.10, heading = 167.68, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1074.8126, -1456.2502, -1.4203, 258.6609)
    },
    {
        coords = vector3(-1075.51, -1456.04, -1.88), offsetZ = -0.10, heading = 167.68, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1074.8126, -1456.2502, -1.4203, 258.6609)
    },
    -- CHAIRS IN WALL 1
    {
        coords = vector3(-1062.98, -1482.03, -1.67), offsetZ = -0.10, heading = 71.5, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1063.3402, -1481.9065, -1.2202, 80.3744)
    },
    {
        coords = vector3(-1063.43, -1482.91, -1.67), offsetZ = -0.10, heading = 48.82, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1063.7390, -1482.6334, -1.2202, 61.8380)
    },
    {
        coords = vector3(-1063.92, -1483.4, -1.68), offsetZ = -0.10, heading = 34.25, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1064.1420, -1483.0197, -1.2202, 42.5416)
    },
    {
        coords = vector3(-1064.71, -1483.74, -1.67), offsetZ = -0.10, heading = 10.83, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1064.7920, -1483.2828, -1.2202, 23.9903)
    },
    {
        coords = vector3(-1065.46, -1483.76, -1.66), offsetZ = -0.10, heading = 351.93, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1065.3695, -1483.3220, -1.2202, 0.7605)
    },
    {
        coords = vector3(-1066.29, -1483.52, -1.65), offsetZ = -0.10, heading = 333.43, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1066.0962, -1483.1422, -1.2202, 341.7528)
    },
    {
        coords = vector3(-1066.95, -1483.06, -1.67), offsetZ = -0.10, heading = 313.54, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1066.6172, -1482.7615, -1.2202, 323.2455)
    },
    {
        coords = vector3(-1067.42, -1482.39, -1.67), offsetZ = -0.10, heading = 295.91, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1067.0159, -1482.1392, -1.2202, 300.6375)
    },
    {
        coords = vector3(-1067.59, -1481.62, -1.68), offsetZ = -0.10, heading = 276.18, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1067.1112, -1481.4688, -1.2202, 274.9093)
    },
    {
        coords = vector3(-1067.5, -1480.71, -1.68), offsetZ = -0.10, heading = 251.81, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1066.9868, -1480.9250, -1.2202, 256.0289)
    },
    -- CHAIRS IN WALL 2
    {
        coords = vector3(-1072.25, -1477.87, -1.65), offsetZ = -0.10, heading = 43.13, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1072.5634, -1477.5159, -1.2202, 44.3360)
    },
    {
        coords = vector3(-1072.99, -1478.37, -1.66), offsetZ = -0.10, heading = 24.7, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1073.1611, -1477.9929, -1.2202, 25.7923)
    },
    {
        coords = vector3(-1073.78, -1478.57, -1.67), offsetZ = -0.10, heading = 5.84, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1073.7119, -1478.1064, -1.2202, 10.9257)
    },
    {
        coords = vector3(-1074.54, -1478.44, -1.67), offsetZ = -0.10, heading = 343.99, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1074.3909, -1478.1035, -1.2202, 344.4838)
    },
    {
        coords = vector3(-1075.38, -1478.13, -1.68), offsetZ = -0.10, heading = 321.83, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.0319, -1477.7871, -1.2202, 323.8186)
    },
    {
        coords = vector3(-1075.86, -1477.51, -1.67), offsetZ = -0.10, heading = 303.72, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.4159, -1477.2457, -1.2202, 304.8003)
    },
    {
        coords = vector3(-1076.23, -1476.66, -1.68), offsetZ = -0.10, heading = 282.06, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.7389, -1476.6696, -1.2202, 287.0596)
    },
    {
        coords = vector3(-1076.24, -1475.89, -1.67), offsetZ = -0.10, heading = 263.88, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.8131, -1476.0442, -1.2202, 262.3419)
    },
    {
        coords = vector3(-1075.95, -1475.07, -1.66), offsetZ = -0.10, heading = 242.1, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.5280, -1475.5029, -1.2202, 250.0444)
    },
    {
        coords = vector3(-1075.47, -1474.46, -1.65), offsetZ = -0.10, heading = 225.96, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1075.1738, -1474.7982, -1.2202, 221.1342)
    },
        -- CHAIRS IN WALL 3
    {
        coords = vector3(-1078.33, -1469.72, -1.69), offsetZ = -0.10, heading = 10.06, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1078.3221, -1469.2516, -1.2202, 11.2422)
    },
    {
        coords = vector3(-1079.1, -1469.72, -1.7), offsetZ = -0.10, heading = 350.3, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1079.0714, -1469.2699, -1.2202, 356.0270)
    },
    {
        coords = vector3(-1079.95, -1469.48, -1.68), offsetZ = -0.10, heading = 328.73, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1079.6846, -1469.0497, -1.2202, 334.9409)
    },
    {
        coords = vector3(-1080.6, -1468.97, -1.68), offsetZ = -0.10, heading = 311.64, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1080.1510, -1468.5986, -1.2202, 313.2892)
    },
    {
        coords = vector3(-1080.97, -1468.35, -1.68), offsetZ = -0.10, heading = 292.58, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1080.5406, -1468.0961, -1.2202, 299.1226)
    },
    {
        coords = vector3(-1081.13, -1467.55, -1.66), offsetZ = -0.10, heading = 274.67, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1080.7042, -1467.5967, -1.2202, 276.7198)
    },
    {
        coords = vector3(-1081.01, -1466.57, -1.66), offsetZ = -0.10, heading = 245.85, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1080.6183, -1466.8524, -1.2202, 249.4632)
    },
    {
        coords = vector3(-1080.71, -1466.03, -1.66), offsetZ = -0.10, heading = 233.88, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1080.3329, -1466.2295, -1.2202, 233.4935)
    },
    {
        coords = vector3(-1080.14, -1465.43, -1.68), offsetZ = -0.10, heading = 214.55, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1079.9066, -1465.8169, -1.2202, 213.8944)
    },
    {
        coords = vector3(-1079.16, -1465.01, -1.68), offsetZ = -0.10, heading = 193.02, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1079.0574, -1465.4677, -1.2202, 209.6848)
    },
    -- CHAIRS AROUND MIDDLE 1
    {
        coords = vector3(-1057.81, -1453.47, -1.83), offsetZ = -0.10, heading = 83.28, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1057.1111, -1453.4353, -1.4203, 96.8199)
    },
    {
        coords = vector3(-1057.96, -1454.29, -1.9), offsetZ = -0.10, heading = 81.94, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1057.3009, -1454.3823, -1.4203, 88.6734)
    },
    {
        coords = vector3(-1059.72, -1454.06, -1.86), offsetZ = -0.10, heading = 262.33, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1060.3198, -1454.1300, -1.4203, 251.4714)
    },
    {
        coords = vector3(-1059.61, -1453.22, -1.86), offsetZ = -0.10, heading = 262.33, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1060.2681, -1453.2079, -1.4203, 260.0761)
    },
    -- CHAIRS AROUND MIDDLE 2
    {
        coords = vector3(-1052.21, -1457.16, -1.91), offsetZ = -0.10, heading = 39.51, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1051.7883, -1457.7047, -1.4203, 40.1867)
    },
    {
        coords = vector3(-1052.85, -1457.8, -1.9), offsetZ = -0.10, heading = 38.76, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1052.4774, -1458.3055, -1.4203, 30.0337)
    },
    {
        coords = vector3(-1054.0, -1456.39, -1.9), offsetZ = -0.10, heading = 219.94, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1054.4286, -1455.9279, -1.4203, 211.3465)
    },
    {
        coords = vector3(-1053.32, -1455.84, -1.9), offsetZ = -0.10, heading = 218.76, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1053.7253, -1455.3239, -1.4252, 218.8172)
    },
    -- CHAIRS AROUND MIDDLE 3
    {
        coords = vector3(-1050.52, -1463.79, -1.89), offsetZ = -0.10, heading = 356.34, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1050.5393, -1464.3604, -1.4203, 358.4704)
    },
    {
        coords = vector3(-1051.33, -1463.67, -1.89), offsetZ = -0.10, heading = 357.25, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1051.3784, -1464.3418, -1.4203, 355.1290)
    },
    {
        coords = vector3(-1051.27, -1461.93, -1.91), offsetZ = -0.10, heading = 178.82, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1051.2495, -1461.2635, -1.4203, 175.4910)
    },
    {
        coords = vector3(-1050.46, -1461.9, -1.92), offsetZ = -0.10, heading = 177.6, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1050.4343, -1461.2106, -1.4203, 177.7728)
    },
    -- CHAIRS AROUND MIDDLE 4
    {
        coords = vector3(-1063.7, -1471.31, -1.9), offsetZ = -0.10, heading = 251.08, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1064.3467, -1470.9773, -1.4203, 251.4536)
    },
    {
        coords = vector3(-1063.44, -1470.47, -1.89), offsetZ = -0.10, heading = 252.1, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1064.0940, -1470.1840, -1.4203, 252.9902)
    },
    {
        coords = vector3(-1061.82, -1471.02, -1.92), offsetZ = -0.10, heading = 68.56, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1061.0590, -1471.1882, -1.4203, 68.4393)
    },
    {
        coords = vector3(-1062.13, -1471.85, -1.93), offsetZ = -0.10, heading = 71.04, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1061.4662, -1472.2117, -1.4203, 67.4373)
    },
    -- CHAIRS AROUND MIDDLE 5
    {
        coords = vector3(-1068.49, -1466.37, -1.9), offsetZ = -0.10, heading = 207.97, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1068.7999, -1465.8721, -1.4203, 208.8457)
    },
    {
        coords = vector3(-1067.75, -1465.96, -1.9), offsetZ = -0.10, heading = 208.75, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1068.0153, -1465.4554, -1.4203, 206.6201)
    },
    {
        coords = vector3(-1066.95, -1467.53, -1.91), offsetZ = -0.10, heading = 28.52, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1066.5929, -1468.2158, -1.4203, 26.5916)
    },
    {
        coords = vector3(-1067.64, -1467.97, -1.91), offsetZ = -0.10, heading = 27.34, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1067.3256, -1468.5590, -1.4203, 34.4033)
    },
    -- CHAIRS AROUND MIDDLE 6
    {
        coords = vector3(-1068.76, -1459.74, -1.9), offsetZ = -0.10, heading = 166.9, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1068.6731, -1458.9636, -1.4203, 168.1606)
    },
    {
        coords = vector3(-1068.01, -1459.8, -1.91), offsetZ = -0.10, heading = 168.87, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1067.7500, -1459.0892, -1.4203, 157.6929)
    },
    {
        coords = vector3(-1068.4, -1461.6, -1.93), offsetZ = -0.10, heading = 348.79, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1068.5148, -1462.2208, -1.4203, 345.2112)
    },
    {
        coords = vector3(-1069.23, -1461.52, -1.92), offsetZ = -0.10, heading = 345.25, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1069.3923, -1462.0773, -1.4207, 348.6540)
    },
    -- CHAIRS AROUND MIDDLE 7
    {
        coords = vector3(-1064.53, -1454.5, -1.92), offsetZ = -0.10, heading = 124.03, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1063.9175, -1454.1498, -1.4203, 139.9913)
    },
    {
        coords = vector3(-1064.03, -1455.11, -1.9), offsetZ = -0.10, heading = 126.31, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1063.3655, -1454.8445, -1.4203, 99.4530)
    },
    {
        coords = vector3(-1065.5, -1456.16, -1.91), offsetZ = -0.10, heading = 305.05, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1065.9497, -1456.5709, -1.4203, 305.1270)
    },
    {
        coords = vector3(-1065.93, -1455.46, -1.9), offsetZ = -0.10, heading = 302.81, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1066.4996, -1455.8102, -1.4225, 307.7361)
    },
    -- CHAIRS AROUND IN MIDDLE 1
    {
        coords = vector3(-1061.13, -1468.57, -1.5), offsetZ = -0.10, heading = 71.45, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1060.3748, -1468.8182, -1.0203, 88.5570)
    },
    {
        coords = vector3(-1061.42, -1469.41, -1.5), offsetZ = -0.10, heading = 69.99, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1060.6147, -1469.6744, -1.0201, 84.2936)
    },
    {
        coords = vector3(-1062.9, -1468.8, -1.49), offsetZ = -0.10, heading = 254.4, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1063.4980, -1468.6869, -1.0203, 236.1525)
    },
    {
        coords = vector3(-1062.68, -1468.06, -1.51), offsetZ = -0.10, heading = 251.33, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1063.2349, -1467.8103, -1.0203, 268.1455)
    },
    -- CHAIRS AROUND IN MIDDLE 2
    {
        coords = vector3(-1064.73, -1466.3, -1.5), offsetZ = -0.10, heading = 26.98, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1064.3767, -1466.8848, -1.0203, 21.4962)
    },
    {
        coords = vector3(-1065.35, -1466.77, -1.51), offsetZ = -0.10, heading = 28.94, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1065.0072, -1467.2906, -1.0203, 35.1238)
    },
    {
        coords = vector3(-1066.21, -1465.19, -1.51), offsetZ = -0.10, heading = 208.43, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1066.5822, -1464.6812, -1.0203, 212.4821)
    },
    {
        coords = vector3(-1065.56, -1464.77, -1.51), offsetZ = -0.10, heading = 208.94, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1065.7439, -1464.2222, -1.0203, 229.8514)
    },
    -- CHAIRS AROUND IN MIDDLE 3
    {
        coords = vector3(-1065.95, -1462.22, -1.51), offsetZ = -0.10, heading = 345.34, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1066.1559, -1462.7269, -1.0203, 341.4863)
    },
    {
        coords = vector3(-1066.66, -1461.95, -1.52), offsetZ = -0.10, heading = 345.34, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1066.8956, -1462.6613, -1.0202, 0.3128)
    },
    {
        coords = vector3(-1066.27, -1460.38, -1.52), offsetZ = -0.10, heading = 166.48, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1066.2198, -1459.6434, -1.0203, 157.9593)
    },
    {
        coords = vector3(-1065.5, -1460.49, -1.5), offsetZ = -0.10, heading = 166.99, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1065.3584, -1459.8387, -1.0203, 166.4785)
    },
    -- CHAIRS AROUND IN MIDDLE 4
    {
        coords = vector3(-1063.96, -1458.17, -1.45), offsetZ = -0.10, heading = 304.88, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1064.4502, -1458.5813, -1.0203, 298.5021)
    },
    {
        coords = vector3(-1064.56, -1457.64, -1.49), offsetZ = -0.10, heading = 305.07, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1065.0637, -1457.9261, -1.0203, 325.3145)
    },
    {
        coords = vector3(-1063.02, -1456.6, -1.52), offsetZ = -0.10, heading = 125.15, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1062.5532, -1456.1724, -1.0203, 124.2019)
    },
    {
        coords = vector3(-1062.57, -1457.24, -1.51), offsetZ = -0.10, heading = 124.8, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1061.9789, -1456.8944, -1.0203, 123.1868)
    },
    -- CHAIRS AROUND IN MIDDLE 5
    {
        coords = vector3(-1059.76, -1456.58, -1.49), offsetZ = -0.10, heading = 260.83, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1060.5641, -1456.4042, -1.0203, 263.4700)
    },
    {
        coords = vector3(-1059.79, -1455.77, -1.5), offsetZ = -0.10, heading = 261.89, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1060.5504, -1455.6426, -1.0201, 275.0427)
    },
    {
        coords = vector3(-1058.14, -1456.0, -1.48), offsetZ = -0.10, heading = 82.76, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1057.4205, -1456.1030, -1.0203, 78.6349)
    },
    {
        coords = vector3(-1058.24, -1456.77, -1.48), offsetZ = -0.10, heading = 82.99, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1057.6173, -1456.9895, -1.0203, 80.9956)
    },
    -- CHAIRS AROUND IN MIDDLE 6
    {
        coords = vector3(-1055.85, -1458.06, -1.5), offsetZ = -0.10, heading = 219.54, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1056.2504, -1457.5671, -1.0203, 208.0191)
    },
    {
        coords = vector3(-1055.25, -1457.57, -1.5), offsetZ = -0.10, heading = 219.54, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1055.8015, -1457.0696, -1.0203, 229.4505)
    },
    {
        coords = vector3(-1054.14, -1458.88, -1.5), offsetZ = -0.10, heading = 40.37, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1053.6055, -1459.3643, -1.0203, 46.8554)
    },
    {
        coords = vector3(-1054.75, -1459.34, -1.5), offsetZ = -0.10, heading = 40.45, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1054.3738, -1459.8845, -1.0203, 51.8376)
    },
    -- CHAIRS AROUND IN MIDDLE 7
    {
        coords = vector3(-1053.78, -1462.0, -1.51), offsetZ = -0.10, heading = 176.55, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1053.8423, -1461.2441, -1.0203, 182.3010)
    },
    {
        coords = vector3(-1052.97, -1461.93, -1.52), offsetZ = -0.10, heading = 178.33, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1052.9442, -1461.1808, -1.0202, 211.5912)
    },
    {
        coords = vector3(-1053.02, -1463.76, -1.53), offsetZ = -0.10, heading = 358.05, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1053.0021, -1464.3888, -1.0203, 339.5580)
    },
    {
        coords = vector3(-1053.86, -1463.76, -1.52), offsetZ = -0.10, heading = 358.17, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1053.8790, -1464.3225, -1.0252, 357.9250)
    },
    -- CHAIRS IN MIDDLE 1
    {
        coords = vector3(-1059.46, -1466.4, -1.5), offsetZ = -0.10, heading = 49.73, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1059.0182, -1466.7949, -1.0203, 226.4317)
    },
    {
        coords = vector3(-1060.54, -1466.94, -1.5), offsetZ = -0.10, heading = 5.24, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1060.6025, -1467.6106, -1.0203, 177.5248)
    },
    {
        coords = vector3(-1061.7, -1466.53, -1.5), offsetZ = -0.10, heading = 319.85, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1062.0844, -1467.0500, -1.0203, 140.3464)
    },
    {
        coords = vector3(-1062.34, -1465.48, -1.51), offsetZ = -0.10, heading = 274.22, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1062.8796, -1465.3877, -1.0203, 89.9527)
    },
    {
        coords = vector3(-1061.78, -1464.42, -1.48), offsetZ = -0.10, heading = 233.35, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1062.4630, -1463.8772, -1.0203, 49.3149)
    },
    {
        coords = vector3(-1060.81, -1463.81, -1.48), offsetZ = -0.10, heading = 184.97, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1060.9691, -1463.1187, -1.0203, 14.2833)
    },
    {
        coords = vector3(-1059.67, -1464.16, -1.48), offsetZ = -0.10, heading = 139.81, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1059.3368, -1463.5979, -1.0203, 322.3754)
    },
    {
        coords = vector3(-1059.13, -1465.2, -1.48), offsetZ = -0.10, heading = 98.75, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1058.4888, -1465.1036, -1.0203, 275.4193)
    },
    -- CHAIRS IN MIDDLE 2
    {
        coords = vector3(-1057.84, -1463.35, -1.5), offsetZ = -0.10, heading = 336.05, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1058.0264, -1463.9917, -1.0203, 159.7332)
    },
    {
        coords = vector3(-1058.79, -1462.61, -1.52), offsetZ = -0.10, heading = 294.36, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1059.2917, -1462.8490, -1.0203, 112.0053)
    },
    {
        coords = vector3(-1058.79, -1461.37, -1.5), offsetZ = -0.10, heading = 250.46, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1059.4174, -1461.0420, -1.0203, 82.2858)
    },
    {
        coords = vector3(-1057.92, -1460.52, -1.49), offsetZ = -0.10, heading = 206.57, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1058.1570, -1459.8882, -1.0203, 21.7132)
    },
    {
        coords = vector3(-1056.77, -1460.47, -1.49), offsetZ = -0.10, heading = 158.18, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1056.5609, -1459.8168, -1.0203, 336.9633)
    },
    {
        coords = vector3(-1055.89, -1461.26, -1.47), offsetZ = -0.10, heading = 114.44, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1055.2201, -1460.8846, -1.0203, 290.4316)
    },
    {
        coords = vector3(-1055.88, -1462.44, -1.46), offsetZ = -0.10, heading = 67, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1055.1277, -1462.6322, -1.0203, 251.4016)
    },
    {
        coords = vector3(-1056.63, -1463.27, -1.47), offsetZ = -0.10, heading = 21.61, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1056.4132, -1463.9446, -1.0203, 196.8136)
    },
    -- CHAIRS IN MIDDLE 3
    {
        coords = vector3(-1060.49, -1460.07, -1.5), offsetZ = -0.10, heading = 119.52, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1059.9360, -1459.6772, -1.0203, 293.9958)
    },
    {
        coords = vector3(-1060.42, -1461.28, -1.5), offsetZ = -0.10, heading = 66.06, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1059.8093, -1461.5297, -1.0203, 254.2701)
    },
    {
        coords = vector3(-1061.2, -1462.19, -1.48), offsetZ = -0.10, heading = 22.71, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1060.8905, -1462.7587, -1.0203, 204.1067)
    },
    {
        coords = vector3(-1062.39, -1462.24, -1.49), offsetZ = -0.10, heading = 339.76, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1062.6580, -1462.9324, -1.0203, 157.5722)
    },
    {
        coords = vector3(-1063.23, -1461.47, -1.49), offsetZ = -0.10, heading = 296.41, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1063.9319, -1461.8535, -1.0203, 117.0373)
    },
    {
        coords = vector3(-1063.32, -1460.32, -1.49), offsetZ = -0.10, heading = 253.18, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1064.0715, -1460.0336, -1.0203, 69.9812)
    },
    {
        coords = vector3(-1062.62, -1459.44, -1.48), offsetZ = -0.10, heading = 210.78, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1062.8931, -1458.8162, -1.0203, 24.9103)
    },
    {
        coords = vector3(-1061.41, -1459.33, -1.5), offsetZ = -0.10, heading = 165.27, radius = 0.5, distance = 1.7,
        LeaveCoords = vector4(-1061.2240, -1458.6890, -1.0203, 344.8150)
    }, 
}

Config.Delivery = {
    {     
        item = "soba", -- Item name
        Label = "Soba", -- Item label
        MinPrice = 850, -- Min price
        MaxPrice = 1000, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
    {   
        item = "banhxeo", -- Item name
        Label = "Banh xeo", -- Item label
        MinPrice = 850, -- Min price
        MaxPrice = 1000, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
    {   
        item = "bunbonambo", -- Item name
        Label = "Bun bo nam bo", -- Item label
        MinPrice = 850, -- Min price
        MaxPrice = 1000, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
    {   
        item = "kungpao", -- Item name
        Label = "Kung pao", -- Item label
        MinPrice = 850, -- Min price
        MaxPrice = 1000, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
    {   
        item = "okonomiyaki", -- Item name
        Label = "Okonomiyaki", -- Item label
        MinPrice = 850, -- Min price
        MaxPrice = 1000, -- Max price
        MinCount = 2, -- Min Count
        MaxCount = 2, -- Max Count
    },
}