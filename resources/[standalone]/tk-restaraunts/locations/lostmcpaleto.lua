Config.Locations["lostmcpaleto"] = {}

--Job/Gang Info
Config.Locations["lostmcpaleto"].GangName = "lostmc"
Config.Locations["lostmcpaleto"].BossGradeLevel = 3
Config.Locations["lostmcpaleto"].label = "Lost MC"
Config.Locations["lostmcpaleto"].StockPrice = 1000

--Locations
Config.Locations["lostmcpaleto"].WarehouseLocation = vector4(158.63, -2879.3, 7.24, 86.8)
Config.Locations["lostmcpaleto"].BossComputerLocation = vector4(-20.84, 6481.85, 32.51,315)

Config.Locations["lostmcpaleto"].DutyLocations = {
    vector4(-20.84, 6481.85, 32.51,315),
}

Config.Locations["lostmcpaleto"].WashHandsLocations = {
    vector4(-23.93, 6475.18, 31.5, 315),
}

Config.Locations["lostmcpaleto"].Storage = {
    vec4(-20.41, 6481.42, 30.49, 43)
}

Config.Locations["lostmcpaleto"].BarLocations = {
    vector4(-20.4, 6481.58, 32.41, 40)
}

Config.Locations["lostmcpaleto"].Taps = {
    vector4(-20.83, 6479.95, 31.49, 44),
}

Config.Locations["lostmcpaleto"].CoffeeMachineLocations = {
    vector4(-20.05, 6481.25, 31.39, 310),
}

Config.Locations["lostmcpaleto"].TrayLocations = {
    vector4(-21.59, 6480.62, 31.54,135),
}

--Items
Config.Locations["lostmcpaleto"].PalleteItem = 'lostmc_crate'
Config.Locations["lostmcpaleto"].Items = {
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
Config.Locations["lostmcpaleto"].CraftingMenus = {
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
