Config = {}

--General Settings
Config.BlipToggle = true

--Location Settings
Config.BaitShopLocation = vector4(-1600.73, 5204.18, 4.31, 205.3)
Config.LegalSellLocation = vector4(1300.84, 4318.8, 38.16, 127.13)
Config.IllegalBaitShopLocation = vector4(1051.53, -2499.84, 27.47, 91.6)
Config.IllegalSellLocation = vector4(-179.12, -2501.97, 6.25, 267.30)

--Ped Settings
Config.IllegalBaitShopPedHeading = 91.6 
Config.IllegalSellPedHeading = 267.30

--QBTarget Settings
Config.BaitShopMinZ = 0
Config.BaitShopMaxZ = 5.5
Config.IllegalBaitShopMinZ = 27
Config.IllegalBaitShopMaxZ = 29.5
Config.LegalSellMinZ = 37
Config.LegalSellMaxZ = 39.5
Config.IllegalSellLocationMinZ = 5
Config.IllegalSellLocationMaxZ = 7.5

--Delay Settings
Config.Delay = false
Config.DelayTime = 15 -- In Seconds

--Progression Settings
Config.Level2FishAmount = 250
Config.Level3FishAmount = 350
Config.Level4FishAmount = 450
Config.Level5FishAmount = 550

--Use Fishing Zones
Config.UseFishingZones = false -- True = New Fishing Rules Can Fish When in or Looking at Water, False = Continues Using old fishing zones

--The Fish you Get out on the Ocean
Config.LegalOceanFish = {
    'rockfish','californiahalibut','jacksmelt','surfperch','halibut','californiacorbina','calicobass','mackeral','barracuda'
}

--The Fish you get on the pier
Config.LegalPierFish = {
    'rockfish','californiahalibut','jacksmelt','surfperch','halibut','californiacorbina','calicobass','mackeral','barracuda','whiteseabass','sheephead','yellowtail','salmon','lingcod'
}

-- Sharks for illegal fishing
Config.Sharks = {
    'schoolshark','hornshark','greatwhiteshark'
}

-- Turtles for illegal fishing
Config.Turtles = {
    'greenturtle','leatherbackturtle','oliveridleyturtle'
}

Config.Peds = {
    {
        model = 's_m_y_dealer_01',
        coords = vec4(1051.53, -2499.84, 27.47, 91.6),
    },
    {
        model = 's_m_y_dealer_01',
        coords = vec4(-179.12, -2501.97, 5.25, 267.30),
    },
}

--BaitShop Items
Config.Items = {
    label = "BaitShop",
    slots = 30,
    items = {
        [1] = {
            name = "worms",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "minnows",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "cricket",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "grasshopper",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "leech",
            price = 5,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
    }    
}

--Illegal Bait Shop Items
Config.IllegalItems = {
    label = "Suspicious Man's Shop",
    slots = 30,
    items = {
        [1] = {
            name = "squid",
            price = 10,
            amount = 50,
            info = {},
            type = "item",
            slot = 1,
        },
        [2] = {
            name = "cowcarcass",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 2,
        },
        [3] = {
            name = "pigcarcass",
            price = 20,
            amount = 50,
            info = {},
            type = "item",
            slot = 3,
        },
        [4] = {
            name = "seaweed",
            price = 40,
            amount = 50,
            info = {},
            type = "item",
            slot = 4,
        },
        [5] = {
            name = "octopus",
            price = 30,
            amount = 50,
            info = {},
            type = "item",
            slot = 5,
        },
    }    
}

--Pier Fishing Zones(Legal Only)
Config.PierFishingZones = {
    {
        ["coords"] = vector3(-1612.22, 5262.76, 3.97)
    },
    {
        ["coords"] = vector3(-278.37, 6637.96, 7.55)
    },
    {
        ["coords"] = vector3(3867.59, 4463.81, 2.72)
    },
    {
        ["coords"] = vector3(713.44, 4092.72, 34.73)
    },
    {
        ["coords"] = vector3(1299.08, 4215.5, 33.91)
    },
    {
        ["coords"] = vector3(-3428.34, 967.05, 8.35)
    },
    {
        ["coords"] = vector3(-1844.04, -1255.64, 8.62)
    }
}

--Ocean Fishing Zones (Legal and Illegal)
Config.OceanFishingZones = {
    {
        ["coords"] = vector3(-3259.34, 7341.74, 1.11)
    },
    {
        ["coords"] = vector3(1779.03, 7861.58, 1.0)
    },
    {
        ["coords"] = vector3(5302.7, 5035.44, 1.0)
    },
    {
        ["coords"] = vector3(5289.21, 1341.8, 1.0)
    },
    {
        ["coords"] = vector3(5028.09, -2581.55, 1.0)
    },
    {
        ["coords"] = vector3(259.29, -5751.87, 1.0)
    },
    {
        ["coords"] = vector3(-3750.11, -3249.85, 1.0)
    }
}

--Prices For All Legal Fish
Config.LegalFish = {
    ["rockfish"] = {
        ["name"] = "rockfish",
        ["price"] = 10
    },
    ["californiahalibut"] = {
        ["name"] = "californiahalibut",
        ["price"] = 20
    },
    ["jacksmelt"] = {
        ["name"] = "jacksmelt",
        ["price"] = 30
    },
    ["surfperch"] = {
        ["name"] = "surfperch",
        ["price"] = 40
    },
    ["halibut"] = {
        ["name"] = "halibut",
        ["price"] = 50
    },
    ["californiacorbina"] = {
        ["name"] = "californiacorbina",
        ["price"] = 60
    },
    ["calicobass"] = {
        ["name"] = "calicobass",
        ["price"] = 70
    },
    ["mackeral"] = {
        ["name"] = "mackeral",
        ["price"] = 80
    },
    ["whiteseabass"] = {
        ["name"] = "whiteseabass",
        ["price"] = 90
    },
    ["sheephead"] = {
        ["name"] = "sheephead",
        ["price"] = 100
    },
    ["yellowtail"] = {
        ["name"] = "yellowtail",
        ["price"] = 110
    },
    ["salmon"] = {
        ["name"] = "salmon",
        ["price"] = 120
    },
    ["barracuda"] = {
        ["name"] = "barracuda",
        ["price"] = 130
    },
    ["lingcod"] = {
        ["name"] = "lingcod",
        ["price"] = 140
    }
}

--Prices For all Illegal Fish
Config.IllegalFish = {
    ["schoolshark"] = {
        ["name"] = "schoolshark",
        ["price"] = 330
    },
    ["hornshark"] = {
        ["name"] = "hornshark",
        ["price"] = 340
    },
    ["greatwhiteshark"] = {
        ["name"] = "greatwhiteshark",
        ["price"] = 350
    },
    ["greenturtle"] = {
        ["name"] = "greenturtle",
        ["price"] = 360
    },
    ["leatherbackturtle"] = {
        ["name"] = "leatherbackturtle",
        ["price"] = 370
    },
    ["oliveridleyturtle"] = {
        ["name"] = "oliveridleyturtle",
        ["price"] = 380
    },

}