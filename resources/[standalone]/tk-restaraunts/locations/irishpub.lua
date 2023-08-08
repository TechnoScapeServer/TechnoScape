Config.Locations["IrishPub"] = {}

--Job Info
Config.Locations["IrishPub"].JobName = "irishpub"
Config.Locations["IrishPub"].BossGradeLevel = 4
Config.Locations["IrishPub"].label = "Irish Pub"
Config.Locations["IrishPub"].StockPrice = 1000

--Locations
Config.Locations["IrishPub"].WarehouseLocation = vector4(158.55, -2928.28, 7.24, 87.91)
Config.Locations["IrishPub"].BossComputerLocation = vector4(831.62, -111.69, 79.77+1.0, 340)

Config.Locations["IrishPub"].DutyLocations = {
    vector4(831.62, -111.69, 79.77+1.0, 340),
}

Config.Locations["IrishPub"].WashHandsLocations = {
    vector4(842.38, -122.33, 79.77, 328),
    vector4(841.36, -124.06, 79.77, 328),
    vector4(840.33, -125.77, 79.77, 328),
    vector4(824.97, -110.45, 79.77, 328),
}

Config.Locations["IrishPub"].Storage = {
}

Config.Locations["IrishPub"].BarLocations = {
    vector4(837.03, -114.84, 79.77+1, 60)
}

Config.Locations["IrishPub"].Taps = {
    vector4(837.92, -114.92, 79.77, 60),
    vector4(835.74, -113.66, 79.77, 60),
}

Config.Locations["IrishPub"].CoffeeMachineLocations = {
    vector4(832.81, -114.79, 79.77, 328),
}

Config.Locations["IrishPub"].TrayLocations = {
    vector4(836.82, -114.01, 79.935, 330),
}

--Items
Config.Locations["IrishPub"].PalleteItem = 'irishpub_crate'
Config.Locations["IrishPub"].Items = {
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
Config.Locations["IrishPub"].CraftingMenus = {
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
