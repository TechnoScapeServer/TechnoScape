local Translations = {
    blips = {
        pier_zone = "Pier Fischereizone",
        ocean_zone = "Meeresangelzone",
        bait_store = "Del Perro Bait Store",
        fishery = "Millers Fishery Company",
    },
    notify = {
        fishing_input = "Drücken Sie ~INPUT_REPLAY_HIDEHUD~, um zu fischen",
        bite = "Du spürst einen Biss",
        catch = "Du hast a erwischt ",
        rod1 = "Angesichts der hausgemachten Angelrute",
        rod2 = "Angesichts der günstigen Angelrute",
        rod3 = "Gegeben Mid-Tier-Angelrute",
        rod4 = "Gegeben High-Tier-Angelrute",
        rod5 = "Gegeben Meister Angelrute",
        upgrade_cheap = "Upgrade auf billige Angelrute!",
        upgrade_mid = "Du hast ein Upgrade auf eine mittelstufige Angelrute durchgeführt!",
        upgrade_high = "Du hast ein Upgrade zur High-Tier-Angelrute durchgeführt!",
        upgrade_master = "Du hast ein Upgrade auf die Meister-Angelrute durchgeführt!",
        sold_fish = "Sie haben Ihren Fisch verkauft und $ erhalten ",
    },
    target = {
        bait_shop_label = "Köderladen eröffnen",
        illegal_bait_shop_label = "Waren ansehen",
        sell_fish = "Fisch verkaufen",
        sell_illegal_fish = "Fisch verkaufen",
    },
    notify_error = {
        fish_escaped = "Fisch ist weg",
        no_rod = "Sie haben keine Angelrute",
        no_bait = "Sie haben keinen Fischköder",
        no_lower_level_rod = "Sie haben nicht die Angelrute der unteren Ebene!",
        not_enough_fish = "Sie haben nicht genug gefischt",
        already_have_level = "Sie haben dieses Level bereits erreicht",
        not_high_enough_level = "Nicht hoch genug!",
        no_fish = "Sie haben keinen Fisch zu verkaufen!",
        no_items = "Sie haben keine Artikel",
    },
    menu = {
        fishing_main_menu_header = "Angeln Hauptmenü",
        open_bait_shop_header = "Öffnen Sie den Köderladen 🐟",
        open_bait_shop_text = "Öffnen Sie den Köderladen",
        fishing_rod_header = "Holen Sie sich eine Angelrute 🎣",
        fishing_rod_text = "Holen Sie sich eine Angelrute",
        level_up_header = "Level-Up-Menü ⬆️",
        level_up_text = "Menü zum Levelaufstieg!",
        level_menu_header = "Fischereiniveau",
        level_up_2_header = "Stufe auf Stufe 2",
        level_up_2_text = "Erwischt haben müssen "..Config.Level2FishAmount.." Fische",
        level_up_3_header = "Stufe auf Stufe 3",
        level_up_3_text = "Erwischt haben müssen "..Config.Level3FishAmount.." Fische",
        level_up_4_header = "Stufe auf Stufe 4",
        level_up_4_text = "Erwischt haben müssen "..Config.Level4FishAmount.." Fische",
        level_up_5_header = "Stufe auf Stufe 5",
        level_up_5_text = "Erwischt haben müssen "..Config.Level5FishAmount.." Fische",

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
