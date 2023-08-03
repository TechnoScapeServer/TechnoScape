local Translations = {
    blips = {
        pier_zone = "Pier Fishing Zone",
        ocean_zone = "Ocean Fishing Zone",
        bait_store = "Del Perron syöttikauppa",
        fishery = "Millers Fishery Company",
    },
    notify = {
        fishing_input = "Paina ~INPUT_REPLAY_HIDEHUD~ kalastaaksesi",
        bite = "Tunnet pureman",
        catch = "Sait kiinni a ",
        rod1 = "Annettu kotitekoinen onkivapa",
        rod2 = "Edullinen onki",
        rod3 = "Annettu keskitason onkivapa",
        rod4 = "Annettu korkealuokkainen onkivapa",
        rod5 = "Annettu Master Onkivapa",
        upgrade_cheap = "Päivitetty halvaksi onkiksi!",
        upgrade_mid = "Päivitit keskitason kalastusvakoon!",
        upgrade_high = "Päivitit High-Tier onkivapaan!",
        upgrade_master = "Päivitit Master-kalastusvavan!",
        sold_fish = "Olet myynyt kalasi ja saanut $ ",
    },
    target = {
        bait_shop_label = "Avaa Bait Shop",
        illegal_bait_shop_label = "Näytä tavarat",
        sell_fish = "Myy kalaa",
        sell_illegal_fish = "Myy kalaa",
    },
    notify_error = {
        fish_escaped = "Kalat pääsivät karkuun",
        no_rod = "Sinulla ei ole onkivapaa",
        no_bait = "Sinulla ei ole kalastussyöttiä",
        no_lower_level_rod = "Sinulla ei ole alemman tason onkivapaa!",
        not_enough_fish = "Et ole kalastanut tarpeeksi",
        already_have_level = "Olet jo saavuttanut tämän tason",
        not_high_enough_level = "Ei tarpeeksi korkea taso!",
        no_fish = "Sinulla ei ole kalaa Myytävänä!",
        no_items = "Sinulla ei ole mitään esineitä",
    },
    menu = {
        fishing_main_menu_header = "Kalastuksen päävalikko",
        open_bait_shop_header = "Avaa syöttikauppa 🐟",
        open_bait_shop_text = "Avaa syöttikauppa",
        fishing_rod_header = "Hanki onkivapa 🎣",
        fishing_rod_text = "Hanki onkivapa",
        level_up_header = "Level Up -valikko ⬆️",
        level_up_text = "Menu Tason nousuun!",
        level_menu_header = "Kalastustaso",
        level_up_2_header = "Tasosta tasolle 2",
        level_up_2_text = "Tarve saada kiinni "..Config.Level2FishAmount.." Kalastaa",
        level_up_3_header = "Tasosta tasolle 3",
        level_up_3_text = "Tarve saada kiinni "..Config.Level3FishAmount.." Kalastaa",
        level_up_4_header = "Tasosta tasolle 4",
        level_up_4_text = "Tarve saada kiinni "..Config.Level4FishAmount.." Kalastaa",
        level_up_5_header = "Tasosta tasolle 5",
        level_up_5_text = "Tarve saada kiinni "..Config.Level5FishAmount.." Kalastaa",

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
