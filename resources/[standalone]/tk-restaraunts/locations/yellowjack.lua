Config.Locations["Yellowjack"] = {}

--Job Info
Config.Locations["Yellowjack"].JobName = "yellowjack"
Config.Locations["Yellowjack"].BossGradeLevel = 4
Config.Locations["Yellowjack"].label = "Yellow Jack"
Config.Locations["Yellowjack"].StockPrice = 1000

--Locations
Config.Locations["Yellowjack"].WarehouseLocation = vector4(2911.88, 4469.89, 48.09, 306.96)
Config.Locations["Yellowjack"].BossComputerLocation = vector4(1986.63, 3056.0, 48.22,58)

Config.Locations["Yellowjack"].DutyLocations = {
    vector4(1986.63, 3056.0, 48.22,58),
}

Config.Locations["Yellowjack"].WashHandsLocations = {
    vector4(1983.8, 3053.09, 47.22, 328),
    vector4(1980.98, 3050.69, 47.21, 58)
}

Config.Locations["Yellowjack"].Storage = {
    vector4(1984.56, 3055.32, 46.19, 328.45),
}

Config.Locations["Yellowjack"].BarLocations = {
    vector4(1982.43, 3049.51, 48.00, 58)
}

Config.Locations["Yellowjack"].Taps = {
    vector4(1980.74, 3051.6, 47.22, 328),
}

Config.Locations["Yellowjack"].CoffeeMachineLocations = {
    vector4(1981.02, 3052.36, 47.22, 328),
}

Config.Locations["Yellowjack"].TrayLocations = {
    vector4(1984.93, 3054.31, 47.22, 328),
    vector4(1983.67, 3052.19, 47.22, 328),
}

--Items
Config.Locations["Yellowjack"].PalleteItem = 'yellowjack_crate'
Config.Locations["Yellowjack"].Items = {
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
Config.Locations["Yellowjack"].CraftingMenus = {
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
