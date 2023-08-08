Config.Locations["Bakery"] = {}

--Job Info
Config.Locations["Bakery"].JobName = "bakery"
Config.Locations["Bakery"].BossGradeLevel = 4
Config.Locations["Bakery"].label = "Bakery"
Config.Locations["Bakery"].StockPrice = 1000

--Locations
Config.Locations["Bakery"].WarehouseLocation = vector4(158.63, -2862.73, 7.24, 91.99)
Config.Locations["Bakery"].BossComputerLocation = vector4(0,0,0,0)

Config.Locations["Bakery"].DutyLocations = {
    vector4(54.83, -126.16, 55.46,340)
}

Config.Locations["Bakery"].WashHandsLocations = {
    vector4(59.4, -119.74, 54.45, 340),
    vector4(59.4, -119.74, 54.45, 340)
}

Config.Locations["Bakery"].Storage = {
    vector4(59.4, -119.74, 55.45, 340),
    vector4(56.14, -123.8, 55.45, 340),
}

Config.Locations["Bakery"].Tables = {
    vector4(56.28, -130.91, 55.46, 340),
    vector4(55.15, -134.0, 55.46, 340),
    vector4(51.32, -127.59, 55.46, 340),
    vector4(50.45, -129.96, 55.46, 340)
}

Config.Locations["Bakery"].TrayLocations = {
    vector4(56.28, -130.91, 55.46, 340),
}

Config.Locations["Bakery"].CuttingBoardLocations = {
    vector4(58.01, -119.38, 55.15, 339),
}

Config.Locations["Bakery"].PrepLocations = {
    vector4(60.57, -123.16, 55.15, 339),
}

Config.Locations["Bakery"].CoffeeMachineLocations = {
    vector4(61.34, -120.53, 55.45, 340),
}

Config.Locations["Bakery"].BlenderLocations = {
    vector4(60.26, -120.36, 55.45, 340),
}

Config.Locations["Bakery"].OvenLocations = {
    vector4(60.9, -122.55, 55.45, 340)
}

Config.Locations["Bakery"].SodaMachineLocations = {
    vector4(61.37, -121.82, 55.37, 340)
}

--[[Optional Locations

Config.Locations["Bakery"].Taps = {
    
}

Config.Locations["Bakery"].IceMakers = {
    
}

Config.Locations["Bakery"].BarLocations = {
    vector4(-302.11, 6180.24, 31.56, 225.49)
}

Config.Locations["Bakery"].Fridges = {
    vector4(-299.23, 6184.86, 31.56, 314.43),
    vector4(-299.1, 6179.87, 31.49, 45.67),
    vector4(-299.69, 6179.29, 31.49, 43.2),
    vector4(-300.38, 6178.61, 31.49, 44.96)
}

Config.Locations["Peckerwood"].FryerLocations = {
    vector4(-289.9, 6175.15, 31.49, 314.5)
}]]

--Items
Config.Locations["Bakery"].PalleteItem = 'bakery_crate'
Config.Locations["Bakery"].Items = {
    {
        name = 'flour',
        amount = 50,
    },
    {
        name = 'jimeggs',
        amount = 50,
    },
    {
        name = 'sugar',
        amount = 50,
    },
    {
        name = 'vanillaextract',
        amount = 50,
    },
    {
        name = 'chocolate',
        amount = 50,
    },
    {
        name = 'heavycream',
        amount = 50,
    },
    {
        name = 'cocoapowder',
        amount = 50,
    },
    {
        name = 'icecream',
        amount = 50,
    },
    {
        name = 'strawberry',
        amount = 50,
    },
    {
        name = 'milk',
        amount = 50,
    },
    {
        name = 'ham',
        amount = 50,
    },
    {
        name = 'cheddar',
        amount = 50,
    },
    {
        name = 'lettuce',
        amount = 50,
    },
    {
        name = 'icing',
        amount = 50,
    },
}

--Crafting
Config.Locations["Bakery"].CraftingMenus = {
    ["Oven"] = {
        { ["tbcakebase"] = { ["dough"] = 1, } },
		{ ['tbcookie'] = { ["dough"] = 1, ['chocolate'] = 1, }, ["amount"] = 3, },
		{ ['tbcupcake'] = { ['dough'] = 1, ["icing"] = 1 }, ["amount"] = 2 },
		{ ['tbsweetroll'] = { ['dough'] = 1, ["icing"] = 1 } },
		{ ['tbdonut'] = { ['dough'] = 1, }, ["amount"] = 2, },
		{ ['tblongjohn'] = { ["dough"] = 1, ['chocolatesyrup'] = 1, }, ["amount"] = 2 },
		{ ['tbbrownie'] = { ["dough"] = 1, ["chocolatesyrup"] = 1 }, ["amount"] = 2 },
		{ ['tbcroissant'] = { ["dough"] = 1, } },
		{ ['tbchoccroiss'] = { ["dough"] = 1, ["chocolatesyrup"] = 1, } },
		{ ['tbbread'] = { ["dough"] = 1, } },
		{ ['tbbrownbread'] = { ["dough"] = 1, } },
		{ ['tbwhitebread'] = { ["dough"] = 1, } },
    },
    ["CuttingBoard"] = {
        { ['breadslice'] = { ["tbbread"] = 1, }, ["amount"] = 6, },
		{ ['sandwich'] = { ["breadslice"] = 2, ["lettuce"] = 1, ["ham"] = 1 } },
		{ ['tosti'] = { ["breadslice"] = 2, ["cheddar"] = 1,  } },
    },
    ["Prep"] = {
        { ['dough'] = {
            ['flour'] = 1,
            ['jimeggs'] = 1,
            ['sugar'] = 1,
            ['heavycream'] = 1,
        }, ["amount"] = 2 },
        { ['chocolatesyrup'] = {
                ['chocolate'] = 1,
                ['flour'] = 1,
                ['jimeggs'] = 1,
                ['sugar'] = 1,
        } },
        { ['tbcake'] = { ['tbcakebase'] = 1, ["icing"] = 1 } },
        { ['tbchoccake'] = { ["tbcakebase"] = 1, ['chocolatesyrup'] = 1, } },
        { ['tbbirthdaycake'] = { ["tbcakebase"] = 1, ['icing'] = 2, } },
    },
    ["Blender"] = {
        { ['milkshake'] = { ['milk'] = 1, ['icecream'] = 1, } },
		{ ['strawberrymilkshake'] = { ['milk'] = 1, ['icecream'] = 1, ['strawberry'] = 1, } },
		{ ['chocolatemilkshake'] = { ['milk'] = 1, ['icecream'] = 1, ['chocolate'] = 1, } },
    },
    ["CoffeeMachine"] = {
        { ['milkshake'] = { ['milk'] = 1, ['icecream'] = 1, } },
		{ ['strawberrymilkshake'] = { ['milk'] = 1, ['icecream'] = 1, ['strawberry'] = 1, } },
		{ ['chocolatemilkshake'] = { ['milk'] = 1, ['icecream'] = 1, ['chocolate'] = 1, } },
    },
    ["Soda"] = {
        { ["ecola"] = {} },
		{ ["ecolalight"] = {} },
		{ ["sprunk"] = {} },
		{ ["sprunklight"] = {} },
    },
}
