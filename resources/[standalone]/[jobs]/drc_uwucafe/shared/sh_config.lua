--ONLY CONFIG NAMED sh_config.lua will work!

Config = {}

Config.Debug = false -- Debug
--SERVER SETTINGS
Config.Framework = "qbcore" -- Framework | types: qbcore, ESX, standalone

Config.Inventory = "qb" -- ox, quasar, chezza, qb

Config.NewESX = true

Config.Target = "qb-target" -- Target | types: qb-target, qtarget, ox_target
Config.BossMenu = "qb-management" -- BossMenu | types: esx_society, qb-management, zerio-bossmenu
Config.NotificationType = "qbcore" -- Notifications | types: ESX, ox_lib, qbcore
Config.Progress = "qbcore" -- ProgressBar | types: progressBars, ox_lib_square, ox_lib_circle, qbcore | Preview: ox_lib_square = https://imgur.com/bgVWs4u , ox_lib_circle = https://imgur.com/Tfq8CA0 , qbcore = https://imgur.com/ru33FYA
Config.Clothing = " qb-clothing" -- Skin / Clothing | types: esx_skin, qb-clothing, fivem-appearance, ox_appearance
Config.Context = "qbcore" -- Context | types: ox_lib, qbcore
Config.Input = "qb-input" -- Input | types: ox_lib, qb-input
Config.PoliceJobs = { 'police', 'sheriff' } -- For Alert
Config.Dispatch = { enabled = true, script = "ps-disptach" } -- cd_dispatch, linden_outlawalert, ps-disptach
--PLAYER SETTINGS
Config.JobName = "uwu" -- Job name for uwu
Config.BossGrade = 4 -- Boss Grade
Config.NeedDuty = true -- Required duty to make drinks etc.
Config.NeedCleanHands = true -- Required to clean hands to make drinks etc.

Config.Logs = { enabled = true, type = "webhook" } -- use webhook or ox_lib (datadog) Can be changed in server > sv_utils.lua
Config.DropPlayer = true -- Drop (Kick) Player if tries to cheat!
Config.AnticheatBan = false -- Change in server/sv_Utils.lua!!! WIll not work by default you need to add your custom trigger to ban player!

Config.ReduceStress = true -- need to have hud for qbcore or stress status for ESX

Config.CatCafe = {
    PolyZone = {
        coords = vector3(-584.79, -1062.54, 22.68), size = vec3(47.0, 42.0, 50), rotation = 359, debug = false, RemovePeds = true, radius = 50.0
    },

    ScreenURL = "https://i.ibb.co/SdgQCMH/test-7.png",

    Garage = {
        Ped = {
            { Model = "s_m_y_xmech_01", Coords = vec4(-597.5389, -1055.6312, 21.3442, 188.6517),
                Scenario = "WORLD_HUMAN_CLIPBOARD_FACILITY"
            }
        },
        Vehicles = {
            { Model = "nspeedo", Label = "Vapid Speedo", livery = 1, image = "https://imgur.com/Opw0pOM.png", metadata = {""}, },
        },
        SpawnPoints = {
            { Coords = vector3(-596.5880, -1059.0718, 22.1253), Heading = 91.0356, Radius = 3.0 }
        },
    },

    AlertPolice = vec3(-587.25, -1061.01, 22.96),

    WarmHands = vec3(-578.84, -1049.69, 22.17),

    Delivery = vec3(-588.11, -1054.28, 22.82),

    SpawnObjects = true,


    CatsLists = {
        { coords = vector4(-576.49, -1054.94, 22.42, 350.0), dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base" },
        { coords = vector4(-582.07, -1055.92, 22.43, 250.0), dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base" },
        { coords = vector4(-583.32, -1069.32, 22.99, 90.0), dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base" },
        { coords = vector4(-584.33, -1062.76, 23.40, 223.0), dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base", },
        { coords = vector4(-566.83, -1051.70, 22.34, 96.18), dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base", },
        { coords = vector4(-575.44, -1068.37, 26.86, 0.93), dict = "creatures@cat@amb@world_cat_sleeping_ground@base", anim = "base", },
        { coords = vector4(-569.22, -1051.15, 23.0809, 85.4708), dict = "creatures@cat@amb@world_cat_sleeping_ledge@base", anim = "base" },
        { coords = vector4(-603.53, -1063.06, 21.55, 39.35), dict = "creatures@cat@amb@world_cat_sleeping_ledge@base", anim = "base" },
        { coords = vector4(-596.42, -1055.32, 22.35, 179.83), dict = "creatures@cat@amb@world_cat_sleeping_ledge@base", anim = "base" },
        { coords = vector4(-569.06, -1054.15, 22.12, 91.88), dict = "creatures@cat@amb@world_cat_sleeping_ledge@base", anim = "base" },
        { coords = vector4(-571.65, -1057.26, 22.53, 90.1), dict = "creatures@cat@move", anim = "gallop" },
    },

    MysteryBox = {
        RequiredItems = {
            { item = "uwu_mysterybox", count = 1, remove = true },
        },
        RandomItem = {
            -- MAX 100% together
            { item = "princess_robo", count = 1, chance = 12.5 },
            { item = "cat_yellow", count = 1, chance = 12.5 },
            { item = "cat_purple", count = 1, chance = 12.5 },
            { item = "shiny_wasabi", count = 1, chance = 12.5 },
            { item = "cat_red", count = 1, chance = 12.5 },
            { item = "cat_green", count = 1, chance = 12.5 },
            { item = "cat_blue", count = 1, chance = 12.5 },
            { item = "cat_brown", count = 1, chance = 12.5 },
        }
    },

    Food = {
        Zones = {
            FrontBar = {
                coords = vector3(-591.07, -1056.52, 22.38),
                radius = 0.44,
                debug = false,
            },
        },
        Crafting = {
            Omurice = {
                Title = "Om-Nom Omurice",
                description = "Requirements: Onion, Chicken thighs, Virgin olive oil, Rice, Soy sauce, Plate",
                image = "https://imgur.com/9nXGTZx.png",
                metadata = {""},
                RequiredItems = {
                    { item = "onion", count = 1, remove = true },
                    { item = "chicken_thighs", count = 1, remove = true },
                    { item = "virgin_olive_oil", count = 1, remove = true },
                    { item = "rice", count = 1, remove = true },
                    { item = "soy_sauce", count = 1, remove = true },
                    { item = "plate", count = 1, remove = true },
                },
                AddItems = {
                    { item = "om_nom_omurice", count = 1 },
                }
            },
            Currye = {
                Title = "Kira Kira Currye",
                description = "Requirements: Onion, Rice, Chicken thighs, Plate",
                image = "https://imgur.com/7FWSyuV.png",
                metadata = {""},
                RequiredItems = {
                    { item = "onion", count = 1, remove = true },
                    { item = "rice", count = 1, remove = true },
                    { item = "chicken_thighs", count = 1, remove = true },
                    { item = "plate", count = 1, remove = true },
                },
                AddItems = {
                    { item = "kira_kira_currye", count = 1 },
                }
            },
            Sando = {
                Title = "Sugoi Katsu Sando",
                description = "Requirements: Pullman bread, Chicken breast, Egg, Flour, Butter, Plate",
                image = "https://imgur.com/yiX9EGR.png",
                metadata = {""},
                RequiredItems = {
                    { item = "pullman_bread", count = 1, remove = true },
                    { item = "chicken_breast", count = 1, remove = true },
                    { item = "egg", count = 1, remove = true },
                    { item = "flour", count = 1, remove = true },
                    { item = "butter", count = 1, remove = true },
                    { item = "plate", count = 1, remove = true },
                },
                AddItems = {
                    { item = "sugoi_katsu_sando", count = 1 },
                }
            },
            Steak = {
                Title = "Hamburg Steak",
                description = "Requirements: Steak",
                image = "https://imgur.com/NTBMjQ9.png",
                metadata = {""},
                RequiredItems = {
                    { item = "steak", count = 1, remove = true },
                },
                AddItems = {
                    { item = "hamburg_stake", count = 1 },
                }
            },
        }, 
    },

    Sinks = {
        Zones = {
            FrontBar = {
                coords = vector3(-587.96, -1062.59, 22.34),
                radius = 0.45,
                debug = false,
                WaterStream = vector3(-587.62, -1062.55, 22.44),
            },
        },
        Crafting = {
            CleanTallGlass = {
                Title = "Clean Tall Glass",
                description = "Requirements: Dirty Tall Glass",
                image = "https://imgur.com/LigkwIc.png",
                metadata = {""},
                prop = `prop_sh_tall_glass`,
                RequiredItems = {
                    { item = "glass_tall_dirty", count = 1, remove = true },
                },
                AddItems = {
                    { item = "glass_tall", count = 1 },
                }
            },
            CleanBowl = {
                Title = "Clean Bowl",
                description = "Requirements: Dirty Bowl",
                image = "https://imgur.com/IFIsmgD.png",
                metadata = {""},
                prop = `prop_bar_beans`,
                RequiredItems = {
                    { item = "bar_bowl_dirty", count = 1, remove = true },
                },
                AddItems = {
                    { item = "bar_bowl", count = 1 },
                }
            },
            CleanPlate = {
                Title = "Clean Plate",
                description = "Requirements: Dirty Plate",
                image = "https://imgur.com/HmzDujF.png",
                metadata = {""},
                prop = `v_ret_fh_plate3`,
                RequiredItems = {
                    { item = "plate_dirty", count = 1, remove = true },
                },
                AddItems = {
                    { item = "plate", count = 1 },
                }
            },
            CleanCup = {
                Title = "Clean Cup",
                description = "Requirements: Dirty Cup",
                image = "https://imgur.com/r5SGdgW.png",
                metadata = {""},
                prop = `v_ret_gc_cup`,
                RequiredItems = {
                    { item = "cup_dirty", count = 1, remove = true },
                },
                AddItems = {
                    { item = "cup", count = 1 },
                }
            },
        },
    },

    Duty = {
        Main = { coords = vector3(-594.35, -1054.15, 23.04), radius = 0.6, debug = false },
    },

    CloakRoom = {
        Main = { coords = vector3(-586.2766, -1049.7133, 22.4092), radius = 0.7, debug = false },
    },

    Coffeemachine = {
        Zones = {
            Main = { coords = vector3(-586.74, -1061.95, 22.64), radius = 0.4, debug = false },
        },
        Crafting = {
            Coffee1 = {
                Title = "Matcha Coffee",
                description = "Requirements: Matcha Powder, Milk, Brewed coffee",
                image = "https://imgur.com/1W9OBmr.png",
                metadata = {""},
                RequiredItems = {
                    { item = "matcha_powder", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "brewed_coffe", count = 1, remove = true },
                },
                AddItems = {
                    { item = "matcha_coffee", count = 1 },
                }
            },
            Coffee2 = {
                Title = "Hot Chocolate",
                description = "Requirements: Sugar, Cocoa powder, Milk, Cup",
                image = "https://imgur.com/gtyfDzf.png",
                metadata = {""},
                RequiredItems = {
                    { item = "sugar", count = 1, remove = true },
                    { item = "cocoa_powder", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "hot_chocolate", count = 1 },
                }
            },
            Coffee3 = {
                Title = "Lovely Hot Chocolate",
                description = "Requirements: Sugar, Cocoa powder, Milk, Cup",
                image = "https://imgur.com/2jfF9nR.png",
                metadata = {""},
                RequiredItems = {
                    { item = "sugar", count = 1, remove = true },
                    { item = "cocoa_powder", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "lovely_hot_chocolate", count = 1 },
                }
            },
        },
    },

    Tea = {
        Zones = {
            Main = { coords = vector3(-583.98, -1058.18, 22.74), radius = 0.5, debug = false },
        },
        
        Crafting = {
            tea1 = {
                Title = "Booba Milk Tea",
                description = "Requirements: Dried boba tapioca pearls, Sugar, Milk, Juice, Ice",
                image = "https://imgur.com/TAKAdu9.png",
                metadata = {""},
                RequiredItems = {
                    { item = "dried_boba_tapioca_pearls", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "juice", count = 1, remove = true },
                    { item = "ice", count = 1, remove = true },
                },
                AddItems = {
                    { item = "booba_milk_tea_2", count = 1 },
                }
            },
            tea2 = {
                Title = "Sweet Herbal Tea",
                description = "Requirements: Lemon, Sugar, Mint, Ice, Cup",
                image = "https://imgur.com/6YVGU7f.png",
                metadata = {""},
                RequiredItems = {
                    { item = "lemon", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "mint", count = 1, remove = true },
                    { item = "ice", count = 1, remove = true },
                    { item = "cup", count = 1, remove = true },
                },
                AddItems = {
                    { item = "sweet_herbal_tea", count = 1 },
                }
            },
        },
    },

    Sides = {
        Zones = {
            Main = { coords = vector3(-591.03, -1063.05, 22.36), radius = 0.5, debug = false },
        },
        
        Crafting = {
            RiceBalls = {
                Title = "Rice Balls",
                description = "Requirements: Rice, Sea moss",
                image = "https://imgur.com/W6vhU4W.png",
                metadata = {""},
                RequiredItems = {
                    { item = "rice", count = 1, remove = true },
                    { item = "sea_moss", count = 1, remove = true },
                },
                AddItems = {
                    { item = "rice_balls", count = 1 },
                }
            },
            Soup = {
                Title = "Warm Chicken Noodle Soup",
                description = "Requirements: Noodles, Onion, Butter, Chicken, Bowl",
                image = "https://imgur.com/JytUAos.png",
                metadata = {""},
                RequiredItems = {
                    { item = "noodles", count = 1, remove = true },
                    { item = "onion", count = 1, remove = true },
                    { item = "butter", count = 1, remove = true },
                    { item = "chicken", count = 1, remove = true },
                    { item = "bar_bowl", count = 1, remove = true },
                },
                AddItems = {
                    { item = "warm_chicken_noodle", count = 1 },
                }
            },
            Chocolate = {
                Title = "Awwdorable Valentine's Chocolate",
                description = "Requirements: Sugar, Cocoa powder, Milk",
                image = "https://imgur.com/ri26Lxf.png",
                metadata = {""},
                RequiredItems = {
                    { item = "sugar", count = 1, remove = true, },
                    { item = "cocoa_powder", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                },
                AddItems = {
                    { item = "awwdorable_valentines_chocolate", count = 1 },
                }
            },
        },
    },

    Deserts = {
        Zones = {
            Main = { coords = vector3(-590.95, -1064.1, 22.49), radius = 0.36, debug = false },
        },
        
        Crafting = {
            Shortcake = {
                Title = "Strawberry Shortcake",
                description = "Requirements: Flour, Baking powder, Strawberry, Sugar, Butter, Plate",
                image = "https://imgur.com/8l3JeEA.png",
                metadata = {""},
                RequiredItems = {
                    { item = "flour", count = 1, remove = true },
                    { item = "baking_powder", count = 1, remove = true },
                    { item = "strawberry", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "butter", count = 1, remove = true },
                    { item = "plate", count = 1, remove = true },
                },
                AddItems = {
                    { item = "strawberry_shortcake", count = 1 },
                }
            },
            Cream = {
                Title = "Meowchi Mochi Ice Cream",
                description = "Requirements: Rice Flour, Sugar",
                image = "https://imgur.com/ZWTwcNC.png",
                metadata = {""},
                RequiredItems = {
                    { item = "rice_flour", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                },
                AddItems = {
                    { item = "meowchi_mochi_ice_cream", count = 1 },
                }
            },
            Cake = {
                Title = "Oxygen Cake",
                description = "Requirements: Sugar, Flour, Egg, Milk, Plate",
                image = "https://imgur.com/hhupM5X.png",
                metadata = {""},
                RequiredItems = {
                    { item = "sugar", count = 1, remove = true },
                    { item = "flour", count = 1, remove = true },
                    { item = "egg", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "plate", count = 1, remove = true },
                },
                AddItems = {
                    { item = "oxygen_cake", count = 1 },
                }
            },
            Parfait = {
                Title = "Purrfect Parfait",
                description = "Requirements: Milk, Strawberry, Butter, Egg",
                image = "https://imgur.com/pyisFFt.png",
                metadata = {""},
                RequiredItems = {
                    { item = "milk", count = 1, remove = true },
                    { item = "strawberry", count = 1, remove = true },
                    { item = "butter", count = 1, remove = true },
                    { item = "egg", count = 1, remove = true },
                },
                AddItems = {
                    { item = "purrfect_parfait", count = 1 },
                }
            },
            Cupcake = {
                Title = "Ballaberry Cupcake",
                description = "Requirements: Baking Powder, Egg, Sugar, Butter, Flour",
                image = "https://imgur.com/xs66dcR.png",
                metadata = {""},
                RequiredItems = {
                    { item = "baking_powder", count = 1, remove = true },
                    { item = "egg", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "butter", count = 1, remove = true },
                    { item = "flour", count = 1, remove = true },
                },
                AddItems = {
                    { item = "ballbarry_cupcake", count = 1 },
                }
            },
            Cupcake2 = {
                Title = "Dragon's Fire Cupcake",
                description = "Requirements: Milk, Egg, Butter",
                image = "https://imgur.com/FLbfsxr.png",
                metadata = {""},
                RequiredItems = {
                    { item = "milk", count = 1, remove = true },
                    { item = "egg", count = 1, remove = true },
                    { item = "butter", count = 1, remove = true },
                },
                AddItems = {
                    { item = "dragos_fire_cupcake", count = 1 },
                }
            },
            Cookie = {
                Title = "GingerKitty Cookie",
                description = "Requirements: Egg, Lemon, Baking Powder",
                image = "https://imgur.com/28S60e7.png",
                metadata = {""},
                RequiredItems = {
                    { item = "egg", count = 1, remove = true },
                    { item = "lemon", count = 1, remove = true },
                    { item = "baking_powder", count = 1, remove = true },
                },
                AddItems = {
                    { item = "gingerkitty_cookie", count = 1 },
                }
            },
            Pancakes = {
                Title = "Doki Doki Pancakes", 
                description = "Requirements: Flour, Milk, Egg",
                image = "https://imgur.com/U2PxveN.png",
                metadata = {""},
                RequiredItems = {
                    { item = "flour", count = 1, remove = true },
                    { item = "milk", count = 1, remove = true },
                    { item = "egg", count = 1, remove = true },
                },
                AddItems = {
                    { item = "doki_doki_pancakes", count = 1 },
                }
            },
        },
    },

    Oven = {
        Zones = {
            Main = { coords = vector3(-590.6, -1059.81, 22.65), radius = 0.36, debug = false },
        },
        
        Crafting = {
            MacaroonBrown = {
                Title = "Brown cat macaroon",
                description = "Requirements: Flour, Egg, Sugar, Brown dye",
                image = "https://imgur.com/fMS4kwy.png",
                metadata = {""},
                RequiredItems = {
                    { item = "flour", count = 1, remove = true },
                    { item = "egg", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "brown_dye", count = 1, remove = true },
                },
                AddItems = {
                    { item = "cat_macaroon_brown", count = 1 },
                }
            },
            MacaroonPink = {
                Title = "Pink cat macaroon",
                description = "Requirements: Flour, Egg, Sugar, Pink dye",
                image = "https://imgur.com/btqMgYP.png",
                metadata = {""},
                RequiredItems = {
                    { item = "flour", count = 1, remove = true },
                    { item = "egg", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "pink_dye", count = 1, remove = true },
                },
                AddItems = {
                    { item = "cat_macaroon_pink", count = 1 },
                }
            },
            MacaroonTurquoise = {
                Title = "Turquoise cat macaroon",
                description = "Requirements: Flour, Egg, Sugar, Turquoise dye",
                image = "https://imgur.com/RkAz8Tc.png",
                metadata = {""},
                RequiredItems = {
                    { item = "flour", count = 1, remove = true },
                    { item = "egg", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "turquoise_dye", count = 1, remove = true },
                },
                AddItems = {
                    { item = "cat_macaroon_turquoise", count = 1 },
                }
            },
            MacaroonGreen = {
                Title = "Green cat macaroon",
                description = "Requirements: Flour, Egg, Sugar, Green dye",
                image = "https://imgur.com/fGQcYrw.png",
                metadata = {""},
                RequiredItems = {
                    { item = "flour", count = 1, remove = true },
                    { item = "egg", count = 1, remove = true },
                    { item = "sugar", count = 1, remove = true },
                    { item = "green_dye", count = 1, remove = true },
                },
                AddItems = {
                    { item = "cat_macaroon_green", count = 1 },
                }
            },
        },
    },

    BossMenu = {
        Main = { coords = vector3(-577.7687, -1066.8713, 26.5152), radius = 0.7, debug = false },
    },

    IceMachine = {
        Zones = {
            FrontBar = { coords = vector3(-589.35, -1068.52, 21.84), radius = 0.7, debug = false },
        },
        Crafting = {
            Ice = {
                Title = "Get Ice Cube",
                description = "Get ice cube to drinks!",
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
        FrontBar = { coords = vector3(-584.03, -1061.47, 22.34), radius = 0.25, debug = false, amount = 0 },
        BackBar = { coords = vector3(-583.99, -1058.74, 22.34), radius = 0.25, debug = false, amount = 0 },
    },


    Stashes = {
        Stash1 = {
            name = "Uwu_Stash1",
            label = "Uwu Stash 1",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-587.99, -1058.07, 21.89),
            radius = 0.5,
            debug = false,
            job = "uwu"
        },

        Stash2 = {
            name = "Uwu_Stash2",
            label = "Uwu Stash 2",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-587.79, -1060.18, 21.81),
            radius = 0.5,
            debug = false,
            job = "uwu"
        },

        Refregiato3 = {
            name = "Uwu_Refregiator3",
            label = "Uwu Refregiator 3",
            TargetIcon = "fas fa-ice-cream",
            TargetLabel = "Refregiator",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-590.89, -1058.66, 22.62),
            radius = 0.7,
            debug = false,
            job = "uwu"
        },

        Stash4 = {
            name = "Uwu_Stash4",
            label = "Uwu Stash 4",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-587.41, -1059.71, 22.53),
            radius = 0.7,
            debug = false,
            job = "uwu"
        },

        Stash5 = {
            name = "Uwu_Stash5",
            label = "Uwu Stash 5",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-585.25, -1055.29, 22.34),
            radius = 0.78,
            debug = false,
            job = "uwu"
        },

        Stash6 = {
            name = "Uwu_Stash6",
            label = "Uwu Stash 6",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-588.02, -1066.11, 22.34),
            radius = 0.8,
            debug = false,
            job = "uwu"
        },

        Stash7 = {
            name = "Uwu_Stash7",
            label = "Uwu Stash 7",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-588.03, -1067.97, 22.34),
            radius = 0.8,
            debug = false,
            job = "uwu"
        },

       Stash8 = {
            name = "Uwu_Stash8",
            label = "Uwu Stash 8",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-590.6, -1068.04, 22.34),
            radius = 0.8,
            debug = false,
            job = "uwu"
        },

        Stash9 = {
            name = "Uwu_Stash9",
            label = "Uwu Stash 9",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-598.38, -1062.47, 22.99),
            radius = 1.55,
            debug = false,
            job = "uwu"
        },

       Stash10 = {
            name = "Uwu_Stash10",
            label = "Uwu Stash 10",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-597.69, -1065.61, 22.99),
            radius = 1.55,
            debug = false,
            job = "uwu"
        },

       Stash11 = {
            name = "Uwu_Stash11",
            label = "Uwu Stash 11",
            TargetIcon = "fas fa-warehouse",
            TargetLabel = "Stash",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-598.06, -1068.31, 22.99),
            radius = 1.55,
            debug = false,
            job = "uwu"
        },

        Table = {
            name = "Uwu_Table",
            label = "Uwu Table",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-573.55, -1059.8, 22.34),
            radius = 0.7,
            debug = false
        },

        Table2 = {
            name = "Uwu_Table2",
            label = "Uwu Table 2",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-573.59, -1063.41, 22.34),
            radius = 0.7,
            debug = false
        },

        Table3 = {
            name = "Uwu_Table3",
            label = "Uwu Table 3",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-573.64, -1067.07, 22.34),
            radius = 0.7,
            debug = false
        },

        Table4 = {
            name = "Uwu_Table4",
            label = "Uwu Table 4",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-575.23, -1055.6, 21.64),
            radius = 0.77,
            debug = false
        },

        Table5 = {
            name = "Uwu_Table5",
            label = "Uwu Table 5",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-578.72, -1051.1, 21.54),
            radius = 0.77,
            debug = false
        },

        Table6 = {
            name = "Uwu_Table6",
            label = "Uwu Table 6",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-586.82, -1067.69, 22.34),
            radius = 0.35,
            debug = false
        },

        Table7 = {
            name = "Uwu_Table7",
            label = "Uwu Table 7",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-586.89, -1066.61, 22.34),
            radius = 0.35,
            debug = false
        },

        Table8 = {
            name = "Uwu_Table8",
            label = "Uwu Table 8",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-586.85, -1065.67, 22.34),
            radius = 0.35,
            debug = false
        },

        Table9 = {
            name = "Uwu_Table9",
            label = "Uwu Table 9",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-586.87, -1064.63, 22.34),
            radius = 0.35,
            debug = false
        },

        Table10 = {
            name = "Uwu_Table10",
            label = "Uwu Table 10",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-571.86, -1067.26, 26.21),
            radius = 0.77,
            debug = false
        },

        Table11 = {
            name = "Uwu_Table11",
            label = "Uwu Table 11",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-573.64, -1050.82, 25.91),
            radius = 0.77,
            debug = false
        },

        Table12 = {
            name = "Uwu_Table12",
            label = "Uwu Table 12",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-590.59, -1050.56, 21.79),
            radius = 0.77,
            debug = false
        },

        Table13 = {
            name = "Uwu_Table13",
            label = "Uwu Table 13",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-586.44, -1081.63, 22.33),
            radius = 1.20,
            debug = false
        },

        Table14 = {
            name = "Uwu_Table14",
            label = "Uwu Table 14",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-586.34, -1075.99, 22.33),
            radius = 1.20,
            debug = false
        },

        Table15 = {
            name = "Uwu_Table15",
            label = "Uwu Table 15",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-591.19, -1080.21, 22.33),
            radius = 1.20,
            debug = false
        },

        Table16 = {
            name = "Uwu_Table16",
            label = "Uwu Table 16",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-594.04, -1076.76, 21.63),
            radius = 0.35,
            debug = false
        },

        Table17 = {
            name = "Uwu_Table17",
            label = "Uwu Table 17",
            TargetIcon = "fas fa-tablet",
            TargetLabel = "Table",
            Slots = 20,
            Weight = 50000, -- 50 KG
            coords = vector3(-593.46, -1076.44, 21.78),
            radius = 0.35,
            debug = false
        },
        Tray1 = {
            name = "Uwu_Tray1",
            label = "Tray 1",
            TargetIcon = "fas fa-hand-holding",
            TargetLabel = "Tray",
            Slots = 6,
            Weight = 5000, -- 50 KG
            coords = vector3(-584.17, -1062.07, 22.4),
            radius = 0.35,
            debug = false
        },
        Tray2 = {
            name = "Uwu_Tray2",
            label = "Tray 2",
            TargetIcon = "fas fa-hand-holding",
            TargetLabel = "Tray",
            Slots = 6,
            Weight = 5000, -- 50 KG
            coords = vector3(-584.04, -1059.31, 22.4),
            radius = 0.35,
            debug = false
        },
        Tray3 = {
            name = "Uwu_Tray3",
            label = "Tray 3",
            TargetIcon = "fas fa-hand-holding",
            TargetLabel = "Tray",
            Slots = 6,
            Weight = 5000, -- 50 KG
            coords = vector3(-586.57, -1062.95, 22.4),
            radius = 0.35,
            debug = false
        },
    },
}

--BLIPS
Config.Blips = {
    uwu = { -- do not use same value twice (will result in overwriting of blip)
        BlipCoords = vec3(-580.9502, -1065.8682, 22.3473), -- Blip coords
        Sprite = 489, -- Blip Icon
        Display = 4, -- keep 4
        Scale = 0.8, -- Size of blip
        Colour = 8, -- colour
        Name = "UWU CAFE" -- Blip name
    },
}

--Job BLIPS
Config.JobBlips = {
    PawnShop = { -- do not use same value twice (will result in overwriting of blip)
        BlipCoords = vec3(331.0016, 362.2499, 106.6535), -- Blip coords
        Sprite = 59, -- Blip Icon
        Display = 4, -- keep 4
        Scale = 0.8, -- Size of blip
        Colour = 7, -- colour
        Name = "UWU CAFE - Shop" -- Blip name
    },
}

--Shop
Config.Shop = {
    Header = "Uwu Cafe Shop",
    Items = {
        { label = 'Dirty Tall Glass', item = 'glass_tall_dirty', description = "Buy Dirty Tall Glass for: $", price = 5, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/LigkwIc.png", metadata = {""} },
        { label = 'Butter', item = 'butter', description = "Buy Butter for: $", price = 2, MinAmount = 1, MaxAmount = 2, image = "https://imgur.com/YMqL3kF.png", metadata = {""}  },
        { label = 'Beans', item = 'beans', description = "Buy Beans for: $", price = 1, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/llgoPj3.png", metadata = {""}  },
        { label = 'Cocoa powder', item = 'cocoa_powder', description = "Buy Cocoa powder for: $", price = 2, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/ESoezwE.png", metadata = {""}  },
        { label = 'Dried boba tapioca pearls', item = 'dried_boba_tapioca_pearls', description = "Buy Dried boba tapioca pearls for: $", price = 5, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/II2rEg1.png", metadata = {""}  },
        { label = 'Egg', item = 'egg', description = "Buy Egg for: $", price = 8, MinAmount = 1, MaxAmount = 1, image = "https://imgur.com/H9kWuio.png", metadata = {""}  },
        { label = 'Flour', item = 'flour', description = "Buy Flour for: $", price = 8, MinAmount = 1, MaxAmount = 1, image = "https://imgur.com/xFqCA0p.png", metadata = {""}  },
        { label = 'Chicken', item = 'chicken', description = "Buy Chicken for: $", price = 8, MinAmount = 1, MaxAmount = 8, image = "https://imgur.com/H8ZFy8x.png", metadata = {""}  },
        { label = 'Chicken breast', item = 'chicken_breast', description = "Buy Chicken breast for: $", price = 4, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/t1Fhp1T.png", metadata = {""}  },
        { label = 'Chicken thighs', item = 'chicken_thighs', description = "Buy Chicken thighs for: $", price = 5, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/UmhjWfR.png", metadata = {""}  },
        { label = 'Jelly beans', item = 'jelly_beans', description = "Buy Jelly beans for: $", price = 1, MinAmount = 3, MaxAmount = 20, image = "https://imgur.com/kSJkyyf.png", metadata = {""}  },
        { label = 'Juice', item = 'juice', description = "Buy Juice for: $", price = 2, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/PuSRnCX.png", metadata = {""}  },
        { label = 'Lemon', item = 'lemon', description = "Buy Lemon for: $", price = 1, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/V35oDUQ.png", metadata = {""}  },
        { label = 'Matcha powder', item = 'matcha_powder', description = "Buy Matcha powder for: $", price = 2, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/fABA4D8.png", metadata = {""}  },
        { label = 'Milk', item = 'milk', description = "Buy Milk for: $", price = 1, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/WAoFgH9.png", metadata = {""}  },
        { label = 'Nuts', item = 'nuts', description = "Buy Nuts for: $", price = 1, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/ThloROa.png", metadata = {""}  },
        { label = 'Onion', item = 'onion', description = "Buy Onion for: $", price = 1, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/Fj35glm.png", metadata = {""}  },
        { label = 'Pullman bread', item = 'pullman_bread', description = "Buy Pullman bread for: $", price = 2, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/R5G2kuw.png", metadata = {""}  },
        { label = 'Rice flour', item = 'rice_flour', description = "Buy Rice flour for: $", price = 3, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/cn8Sy83.png", metadata = {""}  },
        { label = 'Rice', item = 'rice', description = "Buy Rice for: $", price = 1, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/COrVjt6.png", metadata = {""}  },
        { label = 'Sea moss', item = 'sea_moss', description = "Buy Sea moss for: $", price = 5, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/DyOKzgJ.png", metadata = {""}  },
        { label = 'Soy sauce', item = 'soy_sauce', description = "Buy Soy sauce for: $", price = 6, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/EBzLabc.png", metadata = {""}  },
        { label = 'Strawberry', item = 'strawberry', description = "Buy strawberry for: $", price = 1, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/FVvhO7a.png", metadata = {""}  },
        { label = 'Sugar', item = 'sugar', description = "Buy Sugar for: $", price = 1, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/X3JIJnw.png", metadata = {""}  },
        { label = 'Mystery Box', item = 'uwu_mysterybox', description = "Buy Mystery Box for: $", price = 10, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/Prp3Jao.png", metadata = {""}  },
        { label = 'Baking Powder', item = 'baking_powder', description = "Buy Baking Powder for: $", price = 2, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/xXzs0VZ.png", metadata = {""}  },
        { label = 'Virgine Olive Oil', item = 'virgin_olive_oil', description = "Buy Virgine Olive Oil for: $", price = 10, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/aTNzWY8.png", metadata = {""}  },
        { label = 'Noodles', item = 'noodles', description = "Buy Noodles for: $", price = 2, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/4m0p7Ud.png", metadata = {""}  },
        { label = 'Mint', item = 'mint', description = "Buy Mint for: $", price = 2, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/BgQ9yl8.png", metadata = {""}  },
        { label = 'Brewed Coffe', item = 'brewed_coffe', description = "Buy Brewed Coffe for: $", price = 5, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/9NpSn1d.png", metadata = {""}  },
        { label = 'Steak', item = 'steak', description = "Buy Steak for: $", price = 15, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/3uR5YSf.png", metadata = {""}  },
        { label = 'Brown dye', item = 'brown_dye', description = "Buy Brown dye for: $", price = 2, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/1QeJDke.png", metadata = {""}  },
        { label = 'Pink dye', item = 'pink_dye', description = "Buy Pink dye for: $", price = 2, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/YdKIyRU.png", metadata = {""}  },
        { label = 'Green dye', item = 'green_dye', description = "Buy Green dye for: $", price = 2, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/46A0JEE.png", metadata = {""}  },
        { label = 'Turquoise dye', item = 'turquoise_dye', description = "Buy Turquoise dye for: $", price = 2, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/323vTLA.png", metadata = {""}  },
        { label = 'Plate Dirty', item = 'plate_dirty', description = "Buy Plate Dirty for: $", price = 5, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/hxovZ27.png", metadata = {""}  },
        { label = 'Bar Bowl Dirty', item = 'bar_bowl_dirty', description = "Buy Bar Dirty Bowl for: $", price = 5, MinAmount = 1, MaxAmount = 20, image = "https://imgur.com/w8YpCbW.png", metadata = {""}  },
        { label = 'Cup Dirty', item = 'cup_dirty', description = "Buy Cup Dirty for: $", price = 8, MinAmount = 5, MaxAmount = 20, image = "https://imgur.com/r5SGdgW.png", metadata = {""}  },
    },
    Ped = {
        { model = "a_m_y_soucent_04", coords = vec4(331.0016, 362.2499, 105.6535, 357.9276), scenario = "WORLD_HUMAN_AA_COFFEE" },
    },
}

-- Consumables / Drinking / Eating  
Config.Consumables = {
    gingerkitty_cookie = { -- Item name
        Log = "He ate gingerkitty cookie",
        Remove = true, -- Remove item
        RemoveItem = "gingerkitty_cookie", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    kira_kira_currye = { -- Item name
        Log = "He ate kira kira currye",
        Remove = true, -- Remove item
        RemoveItem = "kira_kira_currye", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "plate_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    om_nom_omurice = { -- Item name
        Log = "He ate om nom omurice",
        Remove = true, -- Remove item
        RemoveItem = "om_nom_omurice", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "plate_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    dragos_fire_cupcake = { -- Item name
        Log = "He ate dragos fire cupcake",
        Remove = true, -- Remove item
        RemoveItem = "dragos_fire_cupcake", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    ballbarry_cupcake = { -- Item name
        Log = "He ate ballbarry cupcake",
        Remove = true, -- Remove item
        RemoveItem = "ballbarry_cupcake", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    purrfect_parfait = { -- Item name
        Log = "He ate purrfect parfait",
        Remove = true, -- Remove item
        RemoveItem = "purrfect_parfait", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    oxygen_cake = { -- Item name
        Log = "He ate oxygen cake",
        Remove = true, -- Remove item
        RemoveItem = "oxygen_cake", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "plate_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    meowchi_mochi_ice_cream = { -- Item name
        Log = "He ate meowchi mochi ice cream",
        Remove = true, -- Remove item
        RemoveItem = "meowchi_mochi_ice_cream", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    strawberry_shortcake = { -- Item name
        Log = "He ate strawberry shortcake",
        Remove = true, -- Remove item
        RemoveItem = "strawberry_shortcake", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "plate_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    awwdorable_valentines_chocolate = { -- Item name
        Log = "He ate awwdororable valentines chocolate",
        Remove = true, -- Remove item
        RemoveItem = "awwdorable_valentines_chocolate", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    warm_chicken_noodle = { -- Item name
        Log = "He ate warm chicken noodles",
        Remove = true, -- Remove item
        RemoveItem = "warm_chicken_noodle", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    rice_balls = { -- Item name
        Log = "He ate rice balls",
        Remove = true, -- Remove item
        RemoveItem = "rice_balls", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    doki_doki_pancakes = { -- Item name
        Log = "He ate doki doki pancakes",
        Remove = true, -- Remove item
        RemoveItem = "doki_doki_pancakes", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    hamburg_stake = { -- Item name
        Log = "He ate hamburg steak",
        Remove = true, -- Remove item
        RemoveItem = "hamburg_stake", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
        Effect = { status = "hunger", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'mp_player_inteat@burger',
                    clip = 'mp_player_int_eat_burger'
                },
                prop = {
                    model = 'prop_cs_steak',
                    bone = 18905,
                    pos = vec3(0.16, 0.04, 0.04),
                    rot = vec3(-48.0, -40.0, 0.0)
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
    sugoi_katsu_sando = { -- Item name
        Log = "He ate cat sugoi katsu sando",
        Remove = true, -- Remove item
        RemoveItem = "sugoi_katsu_sando", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "plate_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    cat_macaroon_pink = { -- Item name
        Log = "He ate cat macaroon pink",
        Remove = true, -- Remove item
        RemoveItem = "cat_macaroon_pink", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    cat_macaroon_green = { -- Item name
        Log = "He ate cat macaroon green",
        Remove = true, -- Remove item
        RemoveItem = "cat_macaroon_green", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    cat_macaroon_turquoise = { -- Item name
        Log = "He ate cat macaroon turquoise",
        Remove = true, -- Remove item
        RemoveItem = "cat_macaroon_turquoise", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    cat_macaroon_brown = { -- Item name
        Log = "He ate cat macaroon brown",
        Remove = true, -- Remove item
        RemoveItem = "cat_macaroon_brown", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Eating...",
        duration = 12500,
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
    sweet_herbal_tea = { -- Item name
        Log = "He drink sweet herbal tea",
        Remove = true, -- Remove item
        RemoveItem = "sweet_herbal_tea", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "cup_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_ind_cfbottle',
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
    booba_milk_tea_2 = { -- Item name
        Log = "He drink booba milk tea",
        Remove = true, -- Remove item
        RemoveItem = "booba_milk_tea_2", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
        Effect = { status = "thirst", add = 100000 },
        animation = {
            emote = {
                enabled = true,
                anim = {
                    dict = 'amb@world_human_drinking@coffee@male@idle_a',
                    clip = 'idle_c'
                },
                prop = {
                    model = 'v_ind_cfbottle',
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
    lovely_hot_chocolate = { -- Item name
        Log = "He drink lovely hot chocolate",
        Remove = true, -- Remove item
        RemoveItem = "lovely_hot_chocolate", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "cup_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
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
    hot_chocolate = { -- Item name
        Log = "He drink hot chocolate",
        Remove = true, -- Remove item
        RemoveItem = "hot_chocolate", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = true,
        AddItem = "cup_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
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
    matcha_coffee = { -- Item name
        Log = "He drink matcha coffee",
        Remove = true, -- Remove item
        RemoveItem = "matcha_coffee", -- Remove Item name
        RemoveItemCount = 1, -- Remove Item Count
        Add = false,
        AddItem = "bar_bowl_dirty", -- Remove Item name
        AddItemCount = 1, -- Remove Item Count
        ProgressBar = "Drinking...",
        duration = 12500,
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
    --TABLE 1
    {
        coords = vector3(-572.9562, -1058.8456, 22.1009), offsetZ = -0.10, heading = 175.8815, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-575.0701, -1058.9763, 21.0442, 272.4649)
    },
    {
        coords = vector3(-573.9679, -1058.8065, 22.1009), offsetZ = -0.10, heading = 186.4195, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-575.0701, -1058.9763, 21.0442, 272.4649)
    },
    {
        coords = vector3(-572.9498, -1060.7108, 22.1009), offsetZ = -0.10, heading = 356.4987, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-575.2313, -1060.7292, 21.0442, 273.1050)
    },
    {
        coords = vector3(-574.0305, -1060.6798, 22.1009), offsetZ = -0.10, heading = 5.5353, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-575.2313, -1060.7292, 21.0442, 273.1050)
    },
    --TABLE 2
    {
        coords = vector3(-573.0892, -1062.4624, 22.1009), offsetZ = -0.10, heading = 177.2360, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-575.0366, -1062.4911, 21.0442, 263.3249)
    },
    {
        coords = vector3(-573.9291, -1062.4513, 22.1009), offsetZ = -0.10, heading = 184.3847, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-575.0366, -1062.4911, 21.0442, 263.3249)
    },
    {
        coords = vector3(-572.9266, -1064.3613, 22.1009), offsetZ = -0.10, heading = 5.3980, radius = 0.5, distance = 2.5,
        LeaveCoords = vector4(-575.1795, -1064.3451, 21.0442, 266.3918)
    },
    {
        coords = vector3(-573.8583, -1064.3676, 22.1009), offsetZ = -0.10, heading = 354.5259, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-575.1795, -1064.3451, 21.0442, 266.3918)
    },
    --TABLE 3
    {
        coords = vector3(-573.0712, -1066.1083, 22.1009), offsetZ = -0.10, heading = 176.2702, radius = 0.5, distance = 2.5,
        LeaveCoords = vector4(-575.0702, -1066.1176, 21.0442, 263.9685)
    },
    {
        coords = vector3(-573.9131, -1066.1093, 22.1009), offsetZ = -0.10, heading = 178.4982, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-575.0702, -1066.1176, 21.0442, 263.9685)
    },
    {
        coords = vector3(-572.9656, -1068.0251, 22.1009), offsetZ = -0.10, heading = 356.2012, radius = 0.5, distance = 2.5,
        LeaveCoords = vector4(-575.0652, -1068.0758, 21.0442, 279.8886)
    },
    {
        coords = vector3(-573.7507, -1068.0251, 22.1009), offsetZ = -0.10, heading = 8.6028, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-575.0652, -1068.0758, 21.0442, 279.8886)
    },
    --CHAIR 1
    {
        coords = vector3(-576.9078, -1050.9244, 22.0023), offsetZ = -0.10, heading = 118.2189, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-577.4818, -1051.1685, 21.0473, 108.4360)
    },
    {
        coords = vector3(-577.5104, -1052.5254, 22.0023), offsetZ = -0.10, heading = 34.1275, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-578.0346, -1052.1064, 21.0473, 36.8572)
    },
    {
        coords = vector3(-579.7154, -1052.4957, 22.0023), offsetZ = -0.10, heading = 336.4822, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-579.3543, -1051.9960, 21.0473, 359.9889)
    },
    {
        coords = vector3(-580.8413, -1051.2714, 22.0023), offsetZ = -0.10, heading = 287.9801, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-580.2059, -1051.1025, 21.0473, 283.2544)
    },
    --KOLO
    {
        coords = vector3(-580.1898, -1062.1125, 21.9400), offsetZ = -0.10, heading = 28.1975, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-580.3461, -1061.8046, 21.0465, 20.6683)
    },
    {
        coords = vector3(-580.7620, -1062.5127, 21.9400), offsetZ = -0.10, heading = 46.8980, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-581.0005, -1062.2947, 21.0465, 47.6675)
    },
    {
        coords = vector3(-579.5212, -1062.0239, 21.9400), offsetZ = -0.10, heading = 350.6352, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-579.4653, -1061.7098, 21.0465, 345.0456)
    },
    {
        coords = vector3(-578.7706, -1062.3292, 21.9400), offsetZ = -0.10, heading = 329.5334, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-578.5662, -1061.9424, 21.0465, 335.2235)
    },
    {
        coords = vector3(-578.3378, -1062.9244, 21.9400), offsetZ = -0.10, heading = 292.5714, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-577.8839, -1062.6056, 21.0465, 282.7989)
    },
    {
        coords = vector3(-578.2416, -1063.5408, 21.9400), offsetZ = -0.10, heading = 262.9378, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-577.8278, -1063.6219, 21.0465, 262.6644)
    },
    {
        coords = vector3(-578.5033, -1064.2761, 21.9400), offsetZ = -0.10, heading = 229.8175, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-578.2021, -1064.4210, 21.0465, 247.0550)
    },
    {
        coords = vector3(-579.3058, -1064.8365, 21.9400), offsetZ = -0.10, heading = 203.1745, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-579.2278, -1065.1390, 21.0465, 191.9849)
    },
    {
        coords = vector3(-580.1214, -1064.8102, 21.9400), offsetZ = -0.10, heading = 161.4964, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-580.2249, -1065.1128, 21.0465, 160.4243)
    },
    {
        coords = vector3(-580.8416, -1064.2723, 21.9400), offsetZ = -0.10, heading = 119.6424, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-581.1003, -1064.4791, 21.0465, 134.7384)
    },
    {
        coords = vector3(-581.1042, -1063.4369, 21.9400), offsetZ = -0.10, heading = 87.2536, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-581.4283, -1063.4341, 21.0465, 91.5554)
    },
    --SOFA 1
    {
        coords = vector3(-573.5166, -1052.0762, 26.1836), offsetZ = -0.10, heading = 267.7054, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-573.0812, -1052.0747, 25.2141, 270.1332)
    },
    {
        coords = vector3(-573.5984, -1052.9655, 26.1836), offsetZ = -0.10, heading = 277.2194, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-573.0812, -1052.8793, 25.2141, 275.0467)
    },
    {
        coords = vector3(-573.6161, -1053.6951, 26.1836), offsetZ = -0.10, heading = 277.9612, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-573.0785, -1053.6414, 25.2141, 275.8367)
    },
    --SOFA 2
    {
        coords = vector3(-572.5027, -1069.1954, 26.1836), offsetZ = -0.10, heading = 10.2079, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-572.5611, -1068.7144, 25.2141, 23.0572)
    },
    {
        coords = vector3(-570.9792, -1069.2565, 26.1836), offsetZ = -0.10, heading = 1.3958, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-570.9197, -1068.7147, 25.2141, 8.7731)
    },
    {
        coords = vector3(-569.8362, -1068.2833, 26.1836), offsetZ = -0.10, heading = 100.6467, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-570.4001, -1068.0865, 25.2141, 86.2488)
    },
    {
        coords = vector3(-569.8613, -1066.6639, 26.1836), offsetZ = -0.10, heading = 96.8839, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-570.3916, -1066.6631, 25.2141, 94.0108)
    },
    --SOFA 3
    {
        coords = vector3(-577.1812, -1058.0598, 26.1836), offsetZ = -0.10, heading = 183.5157, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-577.1871, -1058.5391, 25.2141, 182.9106)
    },
    {
        coords = vector3(-577.9976, -1058.0470, 26.1836), offsetZ = -0.10, heading = 180.7132, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-577.7840, -1058.5404, 25.2141, 173.9615)
    },
    {
        coords = vector3(-578.7830, -1058.0217, 26.1836), offsetZ = -0.10, heading = 187.0402, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-578.7288, -1058.5397, 25.2141, 184.3329)
    },
    --SOFA 4
    {
        coords = vector3(-589.7712, -1049.0630, 21.9830), offsetZ = -0.10, heading = 183.2213, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-589.7332, -1049.7123, 21.1442, 181.0418)
    },
    {
        coords = vector3(-590.5945, -1049.0754, 21.9673), offsetZ = -0.10, heading = 188.0585, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-590.6094, -1049.7126, 21.1442, 177.6097)
    },
    {
        coords = vector3(-591.2742, -1049.0862, 21.9513), offsetZ = -0.10, heading = 189.3418, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-591.3625, -1049.7102, 21.1442, 174.1082)
    },
    --TABLE 4
    {
        coords = vector3(-586.2788, -1067.6814, 22.2141), offsetZ = -0.10, heading = 100.8177, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-585.8483, -1067.7372, 21.1442, 89.3140)
    },
    {
        coords = vector3(-586.2598, -1066.6761, 22.2141), offsetZ = -0.10, heading = 90.6263, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-585.7845, -1066.6095, 21.1442, 90.2129)
    },
    {
        coords = vector3(-586.2632, -1065.6392, 22.2141), offsetZ = -0.10, heading = 86.9081, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-585.7640, -1065.6335, 21.1442, 95.4810)
    },
    {
        coords = vector3(-586.2688, -1064.6926, 22.2141), offsetZ = -0.10, heading = 91.2326, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-585.7527, -1064.6591, 21.1442, 89.8206)
    },
    --BENCH 1
    {
        coords = vector3(-579.3099, -1075.7548, 21.8979), offsetZ = -0.10, heading = 92.8444, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-579.7678, -1075.8286, 21.1297, 90.0015)
    },
    {
        coords = vector3(-579.2702, -1077.0818, 21.8979), offsetZ = -0.10, heading = 100.1041, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-579.7706, -1077.1023, 21.1206, 92.2882)
    },
    --BENCH 2
    {
        coords = vector3(-582.7400, -1075.6958, 21.8979), offsetZ = -0.10, heading = 265.4174, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-582.1862, -1075.8342, 21.1244, 272.9906)
    },
    {
        coords = vector3(-582.7840, -1077.1689, 21.8979), offsetZ = -0.10, heading = 268.2014, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-582.1810, -1077.1821, 21.1278, 272.0880)
    },
    --BENCH 3
    {
        coords = vector3(-579.2113, -1081.3999, 21.8979), offsetZ = -0.10, heading = 89.0855, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-579.7753, -1081.4353, 21.1244, 86.4701)
    },
    {
        coords = vector3(-579.2404, -1082.8878, 21.8979), offsetZ = -0.10, heading = 88.2679, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-579.7745, -1082.8654, 21.1244, 84.5229)
    },
    --BENCH 4
    {
        coords = vector3(-582.7099, -1081.4022, 21.8979), offsetZ = -0.10, heading = 276.7716, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-582.1857, -1081.3337, 21.1244, 267.7541)
    },
    {
        coords = vector3(-582.7518, -1082.8485, 21.8979), offsetZ = -0.10, heading = 273.3067, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-582.1866, -1082.8582, 21.1244, 267.9531)
    },
    --TABLE 5
    {
        coords = vector3(-587.06, -1080.58, 21.9220), offsetZ = -0.10, heading = 214.3157, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-586.7689, -1080.0925, 21.1297, 176.5098)
    },
    {
        coords = vector3(-585.47, -1080.8, 21.9220), offsetZ = -0.10, heading = 114.6497, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-585.0361, -1081.1782, 21.1297, 116.6434)
    },
    {
        coords = vector3(-585.51, -1082.5, 21.9220), offsetZ = -0.10, heading = 42.3983, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-585.8930, -1083.0211, 21.1297, 40.1283)
    },
    {
        coords = vector3(-587.6703, -1082.4713, 21.9220), offsetZ = -0.10, heading = 313.3883, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-588.0133, -1082.1542, 21.1297, 293.2788)
    },
    --TABLE 6
    {
        coords = vector3(-587.67, -1075.87, 21.9220), offsetZ = -0.10, heading = 264.0885, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-587.4899, -1075.3021, 21.1297, 260.2307)
    },
    {
        coords = vector3(-586.12, -1074.83, 21.9220), offsetZ = -0.10, heading = 175.5514, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-585.5186, -1074.7286, 21.1297, 168.2569)
    },
    {
        coords = vector3(-585.05, -1076.18, 21.9220), offsetZ = -0.10, heading = 89.7072, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-585.0471, -1076.7749, 21.1297, 86.4471)
    },
    {
        coords = vector3(-586.38, -1077.31, 21.9220), offsetZ = -0.10, heading = 2.1660, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-586.9310, -1077.2749, 21.1297, 338.7051)
    },
    --TABLE 7
    {
        coords = vector3(-592.16, -1081.02, 21.9220), offsetZ = -0.10, heading = 301.8429, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-592.5508, -1080.5975, 21.1297, 279.9665)
    },
    {
        coords = vector3(-591.89, -1079.08, 21.9220), offsetZ = -0.10, heading = 214.3831, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-591.4936, -1078.6957, 21.1297, 201.7770)
    },
    {
        coords = vector3(-590.16, -1079.61, 21.9220), offsetZ = -0.10, heading = 129.3428, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-589.8172, -1080.0602, 21.1297, 111.3758)
    },
    {
        coords = vector3(-590.48, -1081.3, 21.9220), offsetZ = -0.10, heading = 37.6883, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-590.9778, -1081.5203, 21.1297, 15.5231)
    },
    --CHAIR 1
    {
        coords = vector3(-578.2318, -1067.6531, 26.2150), offsetZ = -0.10, heading = 359.0290, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-577.5839, -1067.5729, 25.4141, 358.2033)
    },
    {
        coords = vector3(-577.1417, -1065.2870, 26.2150), offsetZ = -0.10, heading = 168.2997, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-577.8129, -1064.9791, 25.4141, 179.6456)
    },
    {
        coords = vector3(-578.8456, -1065.3474, 26.2150), offsetZ = -0.10, heading = 194.2722, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-579.5594, -1065.4858, 25.4141, 185.6743)
    },
    --CHAIR 2
    {
        coords = vector3(-578.9146, -1061.2754, 26.2150), offsetZ = -0.10, heading = 261.4271, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-578.9777, -1062.0709, 25.4141, 281.1406)
    },
    {
        coords = vector3(-576.9505, -1062.4664, 26.2150), offsetZ = -0.10, heading = 357.4593, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-576.1931, -1062.5695, 25.4141, 40.6062)
    },
    --CHAIR 3
    {
        coords = vector3(-596.2625, -1053.3574, 21.9217), offsetZ = -0.10, heading = 353.9018, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-595.5660, -1053.4266, 21.1438, 4.2685)
    },
    {
        coords = vector3(-598.3495, -1050.1283, 21.9217), offsetZ = -0.10, heading = 264.3328, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-597.7604, -1050.1469, 21.1411, 270.7823)
    },
    {
        coords = vector3(-598.3517, -1051.0193, 21.9217), offsetZ = -0.10, heading = 264.8366, radius = 0.5, distance = 2.2,
        LeaveCoords = vector4(-597.7953, -1051.1156, 21.1411, 259.0909)
    },

}

Config.Bench = {
    --WINDOW 1 
    {
        coords = vector3(-584.7419, -1069.2986, 22.0905), offsetZ = 1.00, heading = 272.3058, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-585.0519, -1068.6437, 21.1442, 345.5218)
    },
    --WINDOW 2
    {
        coords = vector3(-578.6300, -1069.2866, 22.0905), offsetZ = 1.00, heading = 285.8839, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-578.5605, -1068.6353, 21.1344, 7.3951)
    },
    --WINDOW 3
    {
        coords = vector3(-578.4955, -1069.2393, 26.2605), offsetZ = 1.00, heading = 282.1516, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-578.5605, -1068.6353, 25.9344, 7.3951)
    },
    --SEAT 1
    {
        coords = vector3(-582.8824, -1049.4991, 22.0891), offsetZ = 1.00, heading = 120.1690, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-582.9769, -1050.3119, 21.1442, 192.7837)
    },
    --SEAT 2
    {
        coords = vector3(-592.8516, -1077.7429, 21.7015), offsetZ = 1.00, heading = 317.5504, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-593.4307, -1077.3423, 21.1297, 239.5108)
    },
    --SEAT 3
    {
        coords = vector3(-594.9337, -1077.9856, 21.7024), offsetZ = 1.00, heading = 316.6184, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-595.3847, -1077.3186, 21.1293, 315.7857)
    },
    --SEAT 4
    {
        coords = vector3(-594.9964, -1075.6824, 21.7024), offsetZ = 1.00, heading = 212.0379, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-594.3222, -1075.3815, 21.1263, 225.3110)
    },
    --SEAT 5
    {
        coords = vector3(-592.4146, -1075.2598, 21.7024), offsetZ = 1.00, heading = 183.1610, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-591.6434, -1075.6534, 21.1290, 186.9127)
    },
}

Config.Pillow = {
    --PILLOW 1 
    {
        coords = vector3(-582.1502, -1054.5817, 21.3311), offsetZ = 1.10, heading = 182.9807, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-581.4259, -1054.5087, 21.1473, 191.5424)
    },
    --PILLOW 2 
    {
        coords = vector3(-574.0070, -1054.9114, 21.3311), offsetZ = 1.10, heading = 89.2040, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-574.1600, -1054.1501, 21.1442, 94.2657)
    },
    --PILLOW 3 
    {
        coords = vector3(-573.9882, -1056.3031, 21.3311), offsetZ = 1.10, heading = 84.6315, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-573.1756, -1056.2449, 21.1475, 115.6737)
    },
    --PILLOW 4 
    {
        coords = vector3(-576.4922, -1056.2847, 21.3311), offsetZ = 1.10, heading = 271.6547, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-577.3233, -1056.3135, 21.1473, 267.1850)
    },
    --PILLOW 5 
    {
        coords = vector3(-574.1905, -1067.9054, 25.6161), offsetZ = 1.10, heading = 265.9863, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-573.5264, -1067.8971, 25.4141, 290.6563)
    },
    --PILLOW 6 
    {
        coords = vector3(-574.1637, -1066.6559, 25.6159), offsetZ = 1.10, heading = 280.7148, radius = 0.8, distance = 2.5,
        LeaveCoords = vector4(-573.4716, -1066.5393, 25.4147, 277.9704)
    },
}

Config.Delivery = {
    {   
        item = "gingerkitty_cookie", -- Item name
        Label = "Gingerkitty Cookie", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "kira_kira_currye", -- Item name
        Label = "Kira Kira Currye", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "om_nom_omurice", -- Item name
        Label = "Om nom omurice", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "ballbarry_cupcake", -- Item name
        Label = "Ballbarry cupcake", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "purrfect_parfait", -- Item name
        Label = "Purrfect Parfait", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "oxygen_cake", -- Item name
        Label = "Oxygen Cake", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "meowchi_mochi_ice_cream", -- Item name
        Label = "Meowchi Mochi Ice Cream", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "meowchi_mochi_ice_cream", -- Item name
        Label = "Meowchi mochi icecream", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "strawberry_shortcake", -- Item name
        Label = "Strawberry shortcake", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "awwdorable_valentines_chocolate", -- Item name
        Label = "Awwdorable valentines chocolate", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "warm_chicken_noodle", -- Item name
        Label = "Warm chicken noodle", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "rice_balls", -- Item name
        Label = "Rice balls", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "doki_doki_pancakes", -- Item name
        Label = "Doki doki pancakes", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "hamburg_stake", -- Item name
        Label = "Hamburg steak", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "sugoi_katsu_sando", -- Item name
        Label = "Sugoi katsu sando", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "cat_macaroon_pink", -- Item name
        Label = "Cat macaroon pink", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "cat_macaroon_turquoise", -- Item name
        Label = "Cat macaroon turquoise", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "cat_macaroon_brown", -- Item name
        Label = "Cat macaroon brown", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "cat_macaroon_green", -- Item name
        Label = "Cat macaroon green", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "sweet_herbal_tea", -- Item name
        Label = "Sweet herbal tea", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "booba_milk_tea_2", -- Item name
        Label = "Booba milk", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "lovely_hot_chocolate", -- Item name
        Label = "Lovely hot chocolate", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "hot_chocolate", -- Item name
        Label = "Hot chocolate", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {   
        item = "matcha_coffee", -- Item name
        Label = "Matcha_coffee", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 25, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
    {
        item = "dragos_fire_cupcake", -- Item name
        Label = "Dragos fire cupcake", -- Item label
        MinPrice = 25, -- Min price
        MaxPrice = 55, -- Max price
        MinCount = 1, -- Min Count
        MaxCount = 5, -- Max Count
    },
}