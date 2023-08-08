Config.Locations["Cyberbar"] = {}

--Job Info
Config.Locations["Cyberbar"].JobName = "cyberbar"
Config.Locations["Cyberbar"].BossGradeLevel = 4
Config.Locations["Cyberbar"].label = "Cyber Bar"
Config.Locations["Cyberbar"].StockPrice = 1000

--Locations
Config.Locations["Cyberbar"].WarehouseLocation = vector4(155.25, -3056.77, 7.03, 93.25)
Config.Locations["Cyberbar"].BossComputerLocation = vector4(323.12, -927.2, 29.00, 0)

Config.Locations["Cyberbar"].DutyLocations = {
    vector4(323.12, -927.2, 29.00, 0)
}

Config.Locations["Cyberbar"].WashHandsLocations = {
    vector4(338.45, -912.06, 29.00, 359),
    vector4(338.47, -910.74, 29.00, 359),
    vector4(333.51, -910.37, 29.00, 359),
    vector4(333.55, -909.07, 29.00, 359),
}

Config.Locations["Cyberbar"].Storage = {
    vector4(337.41, -907.2, 28.06, 330.15)
}

Config.Locations["Cyberbar"].BarLocations = {
    vector4(338.27, -914.51, 30.00, 350),
    vector4(333.8, -915.05, 30.00, 25),
    vector4(333.81, -907.65, 30.00, 325),
    vector4(338.42, -908.76, 30.00, 0.0)
}

Config.Locations["Cyberbar"].Taps = {
    vector4(338.66, -911.33, 29.36, 359),
    vector4(333.25, -909.71, 29.36, 359),
}

Config.Locations["Cyberbar"].CoffeeMachineLocations = {
    vector4(335.48, -915.85, 29.06, 174),
}

Config.Locations["Cyberbar"].TrayLocations = {
    vector4(338.69, -912.02, 29.25, 359),
    vector4(338.72, -910.72, 29.26, 0.0),
    vector4(333.28, -910.37, 29.26, 0.0),
    vector4(333.29, -909.08, 29.26, 0.0),
}

--Items
Config.Locations["Cyberbar"].PalleteItem = 'cyberbar_crate'
Config.Locations["Cyberbar"].Items = {
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
Config.Locations["Cyberbar"].CraftingMenus = {
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
