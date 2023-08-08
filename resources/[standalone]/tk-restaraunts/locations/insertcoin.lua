Config.Locations["InsertCoin"] = {}

--Job Info
Config.Locations["InsertCoin"].JobName = "insertcoin"
Config.Locations["InsertCoin"].BossGradeLevel = 4
Config.Locations["InsertCoin"].label = "Insert Coin"
Config.Locations["InsertCoin"].StockPrice = 1000

--Locations
Config.Locations["InsertCoin"].WarehouseLocation = vector4(158.58, -2944.43, 7.24, 98.91)
Config.Locations["InsertCoin"].BossComputerLocation = vector4(-1294.63, -300.81, 36.08+1.03, 105)

Config.Locations["InsertCoin"].DutyLocations = {
    vector4(-1294.63, -300.81, 36.08+1.03, 105),
    vector4(-1281.69, -295.7, 37.45+1.03, 295)
}

Config.Locations["InsertCoin"].WashHandsLocations = {
    vector4(-1282.43, -294.37, 37.64, 295),
}

Config.Locations["InsertCoin"].Storage = {
}

Config.Locations["InsertCoin"].BarLocations = {
    vector4(-1290.33, -295.31, 36.05+1.00, 295)
}

Config.Locations["InsertCoin"].Taps = {
    vector4(-1291.79, -295.99, 36.05, 295),
}

Config.Locations["InsertCoin"].CoffeeMachineLocations = {
    vector4(-1293.85, -302.5, 36.05, 25),
}

Config.Locations["InsertCoin"].TrayLocations = {
    vector4(-1290.43, -297.76, 36.08, 25),
    vector4(-1292.52, -300.3, 36.08, 295),
}

--Items
Config.Locations["InsertCoin"].PalleteItem = 'insertcoin_crate'
Config.Locations["InsertCoin"].Items = {
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
Config.Locations["InsertCoin"].CraftingMenus = {
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
