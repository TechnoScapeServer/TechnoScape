Config.Locations["SplitSides"] = {}

--Job Info
Config.Locations["SplitSides"].JobName = "splitsides"
Config.Locations["SplitSides"].BossGradeLevel = 4
Config.Locations["SplitSides"].label = "Split Sides"
Config.Locations["SplitSides"].StockPrice = 1000

--Locations
Config.Locations["SplitSides"].WarehouseLocation = vector4(158.63, -2879.3, 7.24, 86.8)
Config.Locations["SplitSides"].BossComputerLocation = vector4(-435.04, 271.82, 83.56+1,90)

Config.Locations["SplitSides"].DutyLocations = {
    vector4(-435.04, 271.82, 83.56+1,90),
}

Config.Locations["SplitSides"].WashHandsLocations = {
    vector4(-424.45, 275.55, 83.42, 85),
}

Config.Locations["SplitSides"].Storage = {

}

Config.Locations["SplitSides"].BarLocations = {
    vector4(-433.49, 276.85, 83.53+1.03, 356)
}

Config.Locations["SplitSides"].Taps = {
    vector4(-434.91, 272.95, 83.56+1, 85),
}

Config.Locations["SplitSides"].CoffeeMachineLocations = {
    vector4(-432.78, 271.59, 83.42, 356),
}

Config.Locations["SplitSides"].TrayLocations = {
    vector4(-434.8, 274.4, 83.57,85),
}

--Items
Config.Locations["SplitSides"].PalleteItem = 'splitsides_crate'
Config.Locations["SplitSides"].Items = {
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
Config.Locations["SplitSides"].CraftingMenus = {
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
