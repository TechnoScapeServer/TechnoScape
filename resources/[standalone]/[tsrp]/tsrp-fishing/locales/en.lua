local Translations = {
    blips = {
        pier_zone = "Pier Fishing Zone",
        ocean_zone = "Ocean Fishing Zone",
        bait_store = "Del Perro Bait Store",
        fishery = "Millers Fishery Company",
    },
    notify = {
        fishing_input = "Press ~INPUT_REPLAY_HIDEHUD~ to Fish",
        bite = "You Feel a Bite",
        catch = "You Caught a ",
        rod1 = "Given Homemade Fishing Rod",
        rod2 = "Given Cheap Fishing Rod",
        rod3 = "Given Mid-Tier Fishing Rod",
        rod4 = "Given High-Tier Fishing Rod",
        rod5 = "Given Master Fishing Rod",
        upgrade_cheap = "Upgraded To Cheap Fishing Rod!",
        upgrade_mid = "You upgraded to Mid-Tier Fishing Rod!",
        upgrade_high = "You upgraded to High-Tier Fishing Rod!",
        upgrade_master = "You upgraded to The Master Fishing Rod!",
        sold_fish = "You have sold your fish and recieved $ ",
    },
    target = {
        bait_shop_label = "Open Bait Shop",
        illegal_bait_shop_label = "View Wares",
        sell_fish = "Sell Fish",
        sell_illegal_fish = "Sell Fish",
    },
    notify_error = {
        fish_escaped = "Fish Got Away",
        no_rod = "You Dont Have a Fishing Rod",
        no_bait = "You Dont Have Fishing Bait",
        no_lower_level_rod = "You Dont Have The Lower Level Fishing Rod!",
        not_enough_fish = "You Havent Fished Enough",
        already_have_level = "You Have Already Achieved This Level",
        not_high_enough_level = "Not High Enough Level!",
        no_fish = "You Dont Have Any Fish To Sell!",
        no_items = "You Dont Have Any Items",
        cant_be_in_vehicle = "You Cant Be In a Vehicle While Fishing",
    },
    menu = {
        fishing_main_menu_header = "Fishing Main Menu",
        open_bait_shop_header = "Open Bait Shop 🐟",
        open_bait_shop_text = "Open The Bait Shop",
        fishing_rod_header = "Get a Fishing Rod 🎣",
        fishing_rod_text = "Get a Fishing Rod",
        level_up_header = "Level Up Menu ⬆️",
        level_up_text = "Menu For Leveling Up!",
        level_menu_header = "Fishing Level",
        level_up_2_header = "Level Up To Level 2",
        level_up_2_text = "Need To Have Caught "..Config.Level2FishAmount.." Fish",
        level_up_3_header = "Level Up To Level 3",
        level_up_3_text = "Need To Have Caught "..Config.Level3FishAmount.." Fish",
        level_up_4_header = "Level Up To Level 4",
        level_up_4_text = "Need To Have Caught "..Config.Level4FishAmount.." Fish",
        level_up_5_header = "Level Up To Level 5",
        level_up_5_text = "Need To Have Caught "..Config.Level5FishAmount.." Fish",

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
