Config.Locations["Limeys"] = {}

--Job Info
Config.Locations["Limeys"].JobName = "limeys"
Config.Locations["Limeys"].BossGradeLevel = 4
Config.Locations["Limeys"].label = "Limeys"
Config.Locations["Limeys"].StockPrice = 1000

--Locations
Config.Locations["Limeys"].WarehouseLocation = vector4(158.6, -2911.78, 7.24, 88.91)
Config.Locations["Limeys"].BossComputerLocation = vector4(253.24, -1022.9, 30.5,320)

Config.Locations["Limeys"].DutyLocations = {
    vector4(253.24, -1022.9, 30.5,320),
}

Config.Locations["Limeys"].WashHandsLocations = {
}

Config.Locations["Limeys"].Storage = {
    vector4(255.04, -1017.12, 28.51, 340),
}

Config.Locations["Limeys"].BarLocations = {
    vector4(254.37, -1019.83, 30.50, 250)
}

Config.Locations["Limeys"].Taps = {
    vector4(254.0, -1021.39, 30.50, 250),
}

Config.Locations["Limeys"].CoffeeMachineLocations = {
    vector4(251.92, -1023.19, 29.50, 70),
}

Config.Locations["Limeys"].TrayLocations = {
    vector4(253.59, -1021.86, 29.50, 340),
}

--Items
Config.Locations["Limeys"].PalleteItem = 'limeys_crate'
Config.Locations["Limeys"].Items = {
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
Config.Locations["Limeys"].CraftingMenus = {
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
