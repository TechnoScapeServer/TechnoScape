local Translations = {
    blips = {
        pier_zone = "",
        ocean_zone = "Havfiskezone",
        bait_store = "Del Perro Bait Store",
        fishery = "Millers Fiskeriselskab",
    },
    notify = {
        fishing_input = "Tryk på ~INPUT_REPLAY_HIDEHUD~ for at fiske",
        bite = "Du føler en bid",
        catch = "Du fangede en ",
        rod1 = "Givet hjemmelavet fiskestang",
        rod2 = "Givet Billig Fiskestang",
        rod3 = "Givet Mid-Tier fiskestang",
        rod4 = "Givet High-Tier fiskestang",
        rod5 = "Givet mester fiskestang",
        upgrade_cheap = "Opgraderet til billig fiskestang!",
        upgrade_mid = "Du opgraderede til Mid-Tier fiskestang!",
        upgrade_high = "Du opgraderede til High-Tier fiskestang!",
        upgrade_master = "Du opgraderede til The Master Fishing Rod!",
        sold_fish = "Du har solgt din fisk og modtaget $ ",
    },
    target = {
        bait_shop_label = "Åbn Bait Shop",
        illegal_bait_shop_label = "Se varer",
        sell_fish = "Sælg fisk",
        sell_illegal_fish = "Sælg fisk",
    },
    notify_error = {
        fish_escaped = "Fisk er sluppet væk",
        no_rod = "Du har ikke en fiskestang",
        no_bait = "Du har ikke fiskeagn",
        no_lower_level_rod = "Du har ikke den lavere niveau fiskestang!",
        not_enough_fish = "Du har ikke fisket nok",
        already_have_level = "Du har allerede nået dette niveau",
        not_high_enough_level = "Ikke højt nok niveau!",
        no_fish = "Du har ingen fisk at sælge!",
        no_items = "Du har ingen varer",
    },
    menu = {
        fishing_main_menu_header = "Fiskeri hovedmenu",
        open_bait_shop_header = "Åben Bait Shop 🐟",
        open_bait_shop_text = "Åbn The Bait Shop",
        fishing_rod_header = "Få en fiskestang 🎣",
        fishing_rod_text = "Få en fiskestang",
        level_up_header = "Level Up Menu ⬆️",
        level_up_text = "Menu til niveauer op!",
        level_menu_header = "Fiskeri niveau",
        level_up_2_header = "Niveau op til niveau 2",
        level_up_2_text = "Skal have fanget "..Config.Level2FishAmount.." Fisk",
        level_up_3_header = "Niveau op til niveau 3",
        level_up_3_text = "Skal have fanget "..Config.Level3FishAmount.." Fisk",
        level_up_4_header = "Niveau op til niveau 4",
        level_up_4_text = "Skal have fanget "..Config.Level4FishAmount.." Fisk",
        level_up_5_header = "Niveau op til niveau 5",
        level_up_5_text = "Skal have fanget "..Config.Level5FishAmount.." Fisk",

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
