Config.Locations["BahamaMamas"] = {}

--Job Info
Config.Locations["BahamaMamas"].JobName = "bahama"
Config.Locations["BahamaMamas"].BossGradeLevel = 4
Config.Locations["BahamaMamas"].label = "Bahama Mamas"
Config.Locations["BahamaMamas"].StockPrice = 1000

--Locations
Config.Locations["BahamaMamas"].WarehouseLocation = vector4(155.32, -3074.97, 7.03, 88.67)
Config.Locations["BahamaMamas"].BossComputerLocation = vector4(-1390.28, -598.57, 31.39, 335)

Config.Locations["BahamaMamas"].DutyLocations = {
    vector4(-1390.28, -598.57, 31.39, 335)
}

Config.Locations["BahamaMamas"].WashHandsLocations = {
    vector4(-1385.52, -608.45, 29.32, 303),
    vector4(-1374.9, -627.1, 30.82-1, 303),
}

Config.Locations["BahamaMamas"].Storage = {
}

Config.Locations["BahamaMamas"].BarLocations = {
    vector4(-1393.29, -602.29, 30.32 + 1.03, 91),
    vector4(-1390.85, -607.83, 30.32 + 1.03, 312),
    vector4(-1375.82, -627.51, 30.82 + 1.03, 33.0),
}

Config.Locations["BahamaMamas"].Taps = {
    vector4(-1373.1, -627.85, 30.82+1.03, 32),
    vector4(-1378.01, -631.05, 30.82+1.03, 33),
    vector4(-1392.88, -604.88, 30.32+1.03, 289),
    vector4(-1391.67, -606.94, 30.32+1.03, 305),
    vector4(-1393.05, -601.09, 30.32 +1.03, 73),
}

Config.Locations["BahamaMamas"].CoffeeMachineLocations = {
    vector4(-1378.62, -631.57, 30.82, 213),
    vector4(-1389.53, -599.82, 30.30, 303),
}

Config.Locations["BahamaMamas"].TrayLocations = {
    vector4(-1393.34, -603.5, 30.37, 100),
    vector4(-1391.67, -599.63, 30.37, 32.0),
    vector4(-1389.38, -609.24, 30.37, 150.0),
    vector4(-1392.41, -605.97, 30.37, 299),
    vector4(-1374.09, -626.28, 30.84, 33),
    vector4(-1377.88, -628.74, 30.84, 33),
}

--Items
Config.Locations["BahamaMamas"].PalleteItem = 'bahamamamas_crate'
Config.Locations["BahamaMamas"].Items = {
    {
        name = 'cranberry',
        amount = 50,
    },
    {
        name = 'schnapps',
        amount = 50,
    },
    {
        name = 'gin',
        amount = 50,
    },
    {
        name = 'scotch',
        amount = 50,
    },
    {
        name = 'rum',
        amount = 50,
    },
    {
        name = 'icream',
        amount = 50,
    },
    {
        name = 'amaretto',
        amount = 50,
    },
    {
        name = 'curaco',
        amount = 50,
    },
    {
        name = 'vodka',
        amount = 50,
    },
    {
        name = 'sprunk',
        amount = 50,
    },
    {
        name = 'sprunklight',
        amount = 50,
    },
    {
        name = 'ecola',
        amount = 50,
    },
    {
        name = 'ecolalight',
        amount = 50,
    },
    {
        name = 'crisps',
        amount = 50,
    },
    {
        name = 'orange',
        amount = 50,
    },
    {
        name = 'lime',
        amount = 50,
    },
    {
        name = 'chocolate',
        amount = 50,
    },

}

--Crafting
Config.Locations["BahamaMamas"].CraftingMenus = {
    ["Bar"]  = {
        { ['b52'] = {	['coffee'] = 1,	['icream'] = 1,	['orange'] = 1,	} },
		{ ['brussian'] = { ['coffee'] = 1, ['vodka'] = 1,	} },
		{ ['bkamikaze'] = { ['curaco'] = 1, ['lime'] = 1, ['vodka'] = 1, } },
		{ ['cappucc'] = {	['coffee'] = 1,	['chocolate'] = 1,	} },
		{ ['ccookie'] = { ['amaretto'] = 1, ['cranberry'] = 1, } },
		{ ['iflag'] = { ['icream'] = 1, ['orange'] = 1, } },
		{ ['kamikaze'] = { ['vodka'] = 1, ['orange'] = 1, ['lime'] = 1, } },
		{ ['sbullet'] = { ['gin'] = 1, ['lime'] = 1, ['scotch'] = 1, } },
		{ ['voodoo'] = {	['coffee'] = 1, ['rum'] = 1, } },
		{ ['woowoo'] = {	['cranberry'] = 1, ['schnapps'] = 1, ['vodka'] = 1, }, },
    },
    ["Tap"] = {
        { ['ambeer'] = {} },
		{ ['dusche'] = {} },
		{ ['logger'] = {} },
		{ ['pisswasser'] = {} },
		{ ['pisswasser2'] = {} },
		{ ['pisswasser3'] = {} },
    },
    ["CoffeeMachine"] = {
        { ['coffee'] = {} },
    }
}
