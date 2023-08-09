QBCORE INSTALL QUIDE

1. Download all dependencies!
    Dependencies:
    ox_lib | https://github.com/overextended/ox_lib/releases/latest
    es_extended / qb-core
    qtarget / qb-target
    ox_inventory / qb-inventory


2. Add Images to your inventory
    qb-inventory > html > images
    Paste images from folder images to qb-inventory > html > images 

3. Add Items to your inventory and jobs
    qb-core > shared.lua
    ['koi'] = {
        label = 'Koi',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 50
            },
            ['1'] = {
                name = 'Novice',
                payment = 75
            },
            ['2'] = {
                name = 'Experienced',
                payment = 100
            },
            ['3'] = {
                name = 'Advanced',
                payment = 125
            },
            ['4'] = {
                name = 'Manager',
                payment = 150
            },
            ['5'] = {
                name = 'Boss',
                isboss = true,
                payment = 150
            },
        },
    },
    qb-core > shared.lua


["avocado"]                         = {["name"] = "avocado",                       ["label"] = "Avocado",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "avocado.png",            ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["bacon"]                         = {["name"] = "bacon",                       ["label"] = "Bacon",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "bacon.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["bamboo_skewers"]                         = {["name"] = "bamboo_skewers",                       ["label"] = "Bamboo Skewers",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "bamboo_skewers.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["banhxeo"]                         = {["name"] = "banhxeo",                       ["label"] = "Banhxeo",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "banhxeo.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["beef_leg"]                         = {["name"] = "beef_leg",                       ["label"] = "Beef Leg",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "beef_leg.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["brisket"]                         = {["name"] = "brisket",                       ["label"] = "Brisket",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "brisket.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["brocoli"]                         = {["name"] = "brocoli",                       ["label"] = "brocoli",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "brocoli.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["bunbonambo"]                         = {["name"] = "bunbonambo",                       ["label"] = "Bun bo nam bo",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "bunbonambo.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["cane_sugar"]                         = {["name"] = "cane_sugar",                       ["label"] = "cane sugar",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "cane_sugar.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["carrot"]                         = {["name"] = "carrot",                       ["label"] = "Carrot",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "carrot.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["cocacola"]                         = {["name"] = "cocacola",                       ["label"] = "CocaCola",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "cocacola.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["cocacola_clear"]                         = {["name"] = "cocacola_clear",                       ["label"] = "cocacola clear",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "cocacola_clear.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["coconut_milk"]                         = {["name"] = "coconut_milk",                       ["label"] = "coconut milk",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "coconut_milk.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["coriander"]                         = {["name"] = "coriander",                       ["label"] = "coriander",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "coriander.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["cucumber"]                         = {["name"] = "cucumber",                       ["label"] = "Cucumber",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "cucumber.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["cup"]                         = {["name"] = "cup",                       ["label"] = "Cup",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "cup.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["chocolate_mocha"]                         = {["name"] = "chocolate_mocha",                       ["label"] = "Chocolate mocha",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "chocolate_mocha.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["dirty_cup"]                         = {["name"] = "dirty_cup",                       ["label"] = "dirty_cup",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "dirty_cup.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["dirty_glass"]                         = {["name"] = "dirty_glass",                       ["label"] = "dirty glass",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "dirty_glass.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["dirty_plate"]                         = {["name"] = "dirty_plate",                       ["label"] = "Dirty plate",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "dirty_plate.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["dorayaki"]                         = {["name"] = "dorayaki",                       ["label"] = "Dorayaki",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "dorayaki.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["dorayaki_plate"]                         = {["name"] = "dorayaki_plate",                       ["label"] = "Dorayaki plate",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "dorayaki_plate.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["dried_tuna_katsuobushi"]                         = {["name"] = "dried_tuna_katsuobushi",                       ["label"] = "dried tuna katsuobushi",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "dried_tuna_katsuobushi.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["eggs"]                         = {["name"] = "eggs",                       ["label"] = "eggs",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "eggs",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["fanta"]                         = {["name"] = "fanta",                       ["label"] = "Fanta",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "fanta.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["fish_sauce"]                         = {["name"] = "fish_sauce",                       ["label"] = "fish sauce",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "fish_sauce.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["garlic"]                         = {["name"] = "garlic",                       ["label"] = "Garlic",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "garlic.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["glass"]                         = {["name"] = "glass",                       ["label"] = "glass",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "glass.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["greentea"]                         = {["name"] = "greentea",                       ["label"] = "green tea",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "greentea    .png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["gyokuro"]                         = {["name"] = "gyokuro",                       ["label"] = "Gyokuro",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "gyokuro.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["chicken_meat"]                         = {["name"] = "chicken_meat",                       ["label"] = "cchicken meat",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "chicken_meat.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["chilli"]                         = {["name"] = "chilli",                       ["label"] = "chilli",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "chilli.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["chinese_rice_wine"]                         = {["name"] = "chinese_rice_wine",                       ["label"] = "chinese rice wine",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "chinese_rice_wine.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["chocolate"]                         = {["name"] = "chocolate",                       ["label"] = "Chocolate",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "chocolate.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["japanese_cheesecake"]                         = {["name"] = "japanese_cheesecake",                       ["label"] = "japanese cheesecake",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "japanese_cheesecake.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["japanese_cheesecake_plate"]                         = {["name"] = "japanese_cheesecake_plate",                       ["label"] = "japanese cheesecake plate",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "japanese_cheesecake_plate.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["kombucha"]                         = {["name"] = "kombucha",                       ["label"] = "kombucha",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "kombucha.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["kungpao"]                         = {["name"] = "kungpao",                       ["label"] = "kungpao",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "kungpao.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["leek"]                         = {["name"] = "leek",                       ["label"] = "leek",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "leek.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["lemon"]                         = {["name"] = "lemon",                       ["label"] = "lemon",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "lemon.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["matcha_swiss"]                         = {["name"] = "matcha_swiss",                       ["label"] = "matcha swiss",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "matcha_swiss.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["matcha_swiss_plate"]                         = {["name"] = "matcha_swiss_plate",                       ["label"] = "matcha swiss plate",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "matcha_swiss_plate.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["matchatea"]                         = {["name"] = "matchatea",                       ["label"] = "matcha tea",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "matchatea.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["mayonese"]                         = {["name"] = "mayonese",                       ["label"] = "mayonese",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "mayonese.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["milk"]                         = {["name"] = "milk",                       ["label"] = "milk",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "milk.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["mirin"]                         = {["name"] = "mirin",                       ["label"] = "mirin",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "mirin.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["mugichatea"]                         = {["name"] = "mugichatea",                       ["label"] = "mugicha tea",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "mugichatea",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["mungo_sprouts"]                         = {["name"] = "mungo_sprouts",                       ["label"] = "mungo sprouts",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "mungo_sprouts.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["nori"]                         = {["name"] = "nori",                       ["label"] = "nori",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "nori.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["oil"]                         = {["name"] = "oil",                       ["label"] = "oil",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "oil.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["strawberry"]                         = {["name"] = "strawberry",                       ["label"] = "Strawberry",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "strawberry.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["okonomiyaki"]                         = {["name"] = "okonomiyaki",                       ["label"] = "okonomiyaki",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "okonomiyaki.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["okonomiyaki_mixtures"]                         = {["name"] = "okonomiyaki_mixtures",                       ["label"] = "okonomiyaki_mixtures",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "okonomiyaki_mixtures.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["okonomiyaki_sauce"]                         = {["name"] = "okonomiyaki_sauce",                       ["label"] = "okonomiyaki sauce",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "okonomiyaki_sauce.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["onigiri"]                         = {["name"] = "onigiri",                       ["label"] = "onigiri",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "onigiri.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["peanut_butter"]                         = {["name"] = "peanut_butter",                       ["label"] = "peanut butter",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "peanut_butter.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["plate"]                         = {["name"] = "plate",                       ["label"] = "plate",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "plate.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["potato_starch"]                         = {["name"] = "potato_starch",                       ["label"] = "potato starch",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "potato_starch.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["ramune_lychee"]                         = {["name"] = "ramune_lychee",                       ["label"] = "ramune lychee",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "ramune_lychee.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["ramune_original"]                         = {["name"] = "ramune_original",                       ["label"] = "ramune original",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "ramune_original.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["ramune_strawberry"]                         = {["name"] = "ramune_strawberry",                       ["label"] = "ramune strawberry",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "ramune_strawberry.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["ramune_watermelon"]                         = {["name"] = "ramune_watermelon",                       ["label"] = "ramune watermelon",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "ramune_watermelon.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["red_pepper"]                         = {["name"] = "red_pepper",                       ["label"] = "red pepper",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "red_pepper.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["rice"]                         = {["name"] = "rice",                       ["label"] = "rice",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "rice.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["rice_flour"]                         = {["name"] = "rice_flour",                       ["label"] = "rice flour",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "rice_flour.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["rice_noodles"]                         = {["name"] = "rice_noodles",                       ["label"] = "rice noodles",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "rice_noodles.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["rice_paper"]                         = {["name"] = "rice_paper",                       ["label"] = "rice paper",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "rice_paper.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["rice_vinegar"]                         = {["name"] = "rice_vinegar",                       ["label"] = "rice vinegar",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "rice_vinegar.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["sake"]                         = {["name"] = "sake",                       ["label"] = "sake",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "sake.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["salad"]                         = {["name"] = "salad",                       ["label"] = "salad",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "salad.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["sesame_oil"]                         = {["name"] = "sesame_oil",                       ["label"] = "sesame oil",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "sesame_oil.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["sesame_seeds"]                         = {["name"] = "sesame_seeds",                       ["label"] = "sesame seeds",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "sesame_seeds.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["shelled_peanuts"]                         = {["name"] = "shelled_peanuts",                       ["label"] = "shelled peanuts",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "shelled_peanuts.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["shrimp"]                         = {["name"] = "shrimp",                       ["label"] = "shrimp",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "shrimp.png",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["soba"]                         = {["name"] = "soba",                       ["label"] = "soba",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "soba",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["soba_noodles"]                         = {["name"] = "soba_noodles",                       ["label"] = "soba_ oodles",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "soba_noodles",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["soy_sauce"]                         = {["name"] = "soy_sauce",                       ["label"] = "soy sauce",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "soy_sauce",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["spring_onion"]                         = {["name"] = "spring_onion",                       ["label"] = "spring onion",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "spring_onion",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["spring_rolls"]                         = {["name"] = "spring_rolls",                       ["label"] = "spring rolls",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "spring_rolls",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["sprite"]                         = {["name"] = "sprite",                       ["label"] = "sprite",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "sprite",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["sugar"]                         = {["name"] = "sugar",                       ["label"] = "sugar",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "sugar",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["sushi"]  = {["name"] = "sushi",   ["label"] = "sushi",  ["weight"] = 150, ["type"] = "item",  ["image"] = "sushi",   ["unique"] = false,  ["useable"] = true,  ["shouldClose"] = false,  ["combinable"] = nil, ["description"] = ""},
["sushi_rice"]                         = {["name"] = "sushi_rice",                       ["label"] = "sushi rice",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "sushi_rice",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["tofu"]                         = {["name"] = "tofu",                       ["label"] = "tofu",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "tofu",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["turmeric"]                         = {["name"] = "turmeric",                       ["label"] = "turmeric",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "turmeric",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["udon"]                         = {["name"] = "udon",                       ["label"] = "udon",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "udon",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["udon_noodles"]                         = {["name"] = "udon_noodles",                       ["label"] = "udon_noodles",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "udon_noodles",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["wakame"]                         = {["name"] = "wakame",                       ["label"] = "wakame",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "wakame",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["wasabi_paste"]                         = {["name"] = "wasabi_paste",                       ["label"] = "wasabi paste",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "wasabi_paste",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},
["white_cabbage"]                         = {["name"] = "white_cabbage",                       ["label"] = "white cabbage",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "white_cabbage",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["yakitori"]                         = {["name"] = "yakitori",                       ["label"] = "yakitori",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "yakitori",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},

["yellow_pepper"]                         = {["name"] = "yellow_pepper",                       ["label"] = "yellow_pepper",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "yellow_pepper",             ["unique"] = false,     ["useable"] = true,     ["shouldClose"] = false,   ["combinable"] = nil, ["description"] = ""},



4. add ensure drc_koi into your server.cfg (make sure to start it after ox_lib and your target system!)

5. Enjoy your new Koi script from DRC SCRIPTS!