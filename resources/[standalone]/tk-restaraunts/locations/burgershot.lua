Config.Locations["Burgershot"] = {}

--Job Info
Config.Locations["Burgershot"].JobName = "burgershot"
Config.Locations["Burgershot"].BossGradeLevel = 4
Config.Locations["Burgershot"].label = "Burger Shot"
Config.Locations["Burgershot"].StockPrice = 1000

--Locations
Config.Locations["Burgershot"].WarehouseLocation = vector4(155.31, -3109.82, 7.03, 94.89)
Config.Locations["Burgershot"].BossComputerLocation = vector4(-298.57, 6171.33, 31.29, 311.25)

Config.Locations["Burgershot"].DutyLocations = {
    vector4(-289.8, 6169.4, 31.5, 53.09),
}

Config.Locations["Burgershot"].WashHandsLocations = {
    vector4(-292.86, 6174.07, 30.35, 134.35),
    vector4(-299.57, 6185.94, 31.47, 315.0),
}

Config.Locations["Burgershot"].Storage = {
    vector4(-300.26, 6176.12, 31.49, 135.33),
    vector4(-301.3, 6177.14, 31.49, 129.15),
    vector4(-301.27, 6177.84, 31.49, 27.43),
    vector4(-299.18, 6175.0, 31.49, 134.17),
    vector4(-298.59, 6175.01, 31.49, 224.23),
    vector4(-297.55, 6176.02, 31.49, 218.07)
}

Config.Locations["Burgershot"].IceMakers = {
    vector4(-298.14, 6184.41, 31.55, 312.94)
}

Config.Locations["Burgershot"].Fridges = {
    vector4(-299.23, 6184.86, 31.56, 314.43),
    vector4(-299.1, 6179.87, 31.49, 45.67),
    vector4(-299.69, 6179.29, 31.49, 43.2),
    vector4(-300.38, 6178.61, 31.49, 44.96)
}

Config.Locations["Burgershot"].BarLocations = {
    vector4(-302.11, 6180.24, 31.56, 225.49)
}

Config.Locations["Burgershot"].OvenLocations = {
    vector4(-292.14, 6177.26, 31.49, 313.63)
}

Config.Locations["Burgershot"].FryerLocations = {
    vector4(-289.9, 6175.15, 31.49, 314.5)
}

--Optional Locations

-- Config.Locations["Burgershot"].Taps = {
--     vector4(-304.67, 6182.52, 31.91, 38.23),
--     vector4(-305.29, 6181.97, 31.14, 44.78)
-- }

--Items
Config.Locations["Burgershot"].PalleteItem = 'peckerwood_crate'
Config.Locations["Burgershot"].Items = {
    {
        name = 'shredded_mozzcheese',
        amount = 50,
    },
    {
        name = 'pepperoni',
        amount = 50,
    },
    {
        name = 'pizzadough',
        amount = 50,
    },
    {
        name = 'pizzasauce',
        amount = 50,
    },
    {
        name = 'frozen_wings',
        amount = 50,
    },
    {
        name = 'hotsauce',
        amount = 50,
    },
    {
        name = 'mayonnaise',
        amount = 50,
    },
    {
        name = 'crabmeat',
        amount = 50,
    },
    {
        name = 'panko_bread_crumbs',
        amount = 50,
    },
    {
        name = 'egg',
        amount = 50,
    },
    {
        name = 'franks',
        amount = 50,
    },
    {
        name = 'hotdogbun',
        amount = 50,
    },
    {
        name = 'ketchup',
        amount = 50,
    },
    {
        name = 'mustard',
        amount = 50,
    },
    {
        name = 'groundbeef',
        amount = 50,
    },
    {
        name = 'hamburgerbuns',
        amount = 50,
    },
    {
        name = 'cheese',
        amount = 50,
    },
    {
        name = 'frozen_mozzarellasticks',
        amount = 50,
    },
    {
        name = 'frozen_onionrings',
        amount = 50,
    },
    {
        name = 'vodka',
        amount = 50,
    },
    {
        name = 'rum',
        amount = 50,
    },
    {
        name = 'coke',
        amount = 50,
    },
    {
        name = 'tomatojuice',
        amount = 50,
    },
    {
        name = 'nattyboe',
        amount = 50,
    },
    {
        name = 'oldbaychips',
        amount = 50,
    },
    {
        name = 'orangecrush',
        amount = 50,
    },

}

--Crafting
Config.Locations["Burgershot"].CraftingMenus = {
    ["Icebox"] = {
        {
            ['ice'] = {},
            ["amount"] = 3
        },
    },
    ["Oven"] = {
        {
            ['pepperoni_pizza'] = {
                ['pizzadough'] = 1,
                ['shredded_mozzcheese'] = 1,
                ['pizzasauce'] = 1,
                ['pepperoni'] = 1,
            },
        },
        {
            ['crabcake'] = {
                ['mayonnaise'] = 1,
                ['crabmeat'] = 1,
                ['panko_bread_crumbs'] = 1,
                ['egg'] = 2,
            },
        },
        {
            ['hotdog'] = {
                ['franks'] = 1,
                ['hotdogbun'] = 1,
                ['ketchup'] = 1,
                ['mustard'] = 1,
            },
        },
        {
            ['cookedburgerpatty'] = {
                ['groundbeef'] = 1,
            },
        },
        {
            ['burger'] = {
                ['hamburgerbuns'] = 2,
                ['cookedburgerpatty'] = 1,
                ['cheese'] = 1,
                ['ketchup'] = 1,
                ['mustard'] = 1,
            },
        },
    },
    ["Fryer"]  = {
        {
            ['hot_wings'] = {
                ['frozen_wings'] = 1,
                ['hotsauce'] = 1
            },
        },
        {
            ['sampler'] = {
                ['frozen_mozzarellasticks'] = 1,
                ['frozen_onionrings'] = 1,
            }
        }
    },
    ["Bar"]  = {
        {
            ['rumandcoke'] = {
                ['rum'] = 1,
                ['coke'] = 1
            },
        },
        {
            ['bloodymary'] = {
                ['vodka'] = 1,
                ['tomatojuice'] = 1
            },
        },
    }
}
