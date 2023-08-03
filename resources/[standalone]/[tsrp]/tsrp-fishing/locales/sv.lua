local Translations = {
    blips = {
        pier_zone = "Pier fiskezon",
        ocean_zone = "Havsfiskezon",
        bait_store = "Del Perro betesaffär",
        fishery = "Millers Fishery Company",
    },
    notify = {
        fishing_input = "Tryck på ~INPUT_REPLAY_HIDEHUD~ för att fiska",
        bite = "Du känner ett bett",
        catch = "Du fångade en ",
        rod1 = "Givet hemgjord fiskespö",
        rod2 = "Givet billigt fiskespö",
        rod3 = "Givet Mid-Tier fiskespö",
        rod4 = "Givet högnivå fiskespö",
        rod5 = "Givet mästare fiskespö",
        upgrade_cheap = "Uppgraderat till billigt fiskespö!",
        upgrade_mid = "Uppgraderat till billigt fiskespö!",
        upgrade_high = "Uppgraderat till billigt fiskespö!",
        upgrade_master = "Uppgraderat till billigt fiskespö!",
        sold_fish = "Uppgraderat till billigt fiskespö! ",
    },
    target = {
        bait_shop_label = "Öppna Bait Shop",
        illegal_bait_shop_label = "Visa varor",
        sell_fish = "Sälj fisk",
        sell_illegal_fish = "Sälj fisk",
    },
    notify_error = {
        fish_escaped = "Fisken kom undan",
        no_rod = "Du har inget fiskespö",
        no_bait = "Du har inte fiskebete",
        no_lower_level_rod = "Du har inte den lägre nivån fiskespö!",
        not_enough_fish = "Du har inte fiskat tillräckligt",
        already_have_level = "Du har redan uppnått denna nivå",
        not_high_enough_level = "Inte tillräckligt hög nivå!",
        no_fish = "Du har ingen fisk att sälja!",
        no_items = "Du har inga föremål",
    },
    menu = {
        fishing_main_menu_header = "Huvudmeny för fiske",
        open_bait_shop_header = "Öppna Bait Shop 🐟",
        open_bait_shop_text = "Öppna Bait Shop",
        fishing_rod_header = "Skaffa ett fiskespö 🎣",
        fishing_rod_text = "Skaffa ett fiskespö",
        level_up_header = "Level Up Meny ⬆️",
        level_up_text = "Meny för att höja nivån!",
        level_menu_header = "Fiskenivå",
        level_up_2_header = "Nivå upp till nivå 2",
        level_up_2_text = "Behöver ha fångat "..Config.Level2FishAmount.." Fisk",
        level_up_3_header = "Nivå upp till nivå 3",
        level_up_3_text = "Behöver ha fångat "..Config.Level3FishAmount.." Fisk",
        level_up_4_header = "Nivå upp till nivå 4",
        level_up_4_text = "Behöver ha fångat "..Config.Level4FishAmount.." Fisk",
        level_up_5_header = "Nivå upp till nivå 5",
        level_up_5_text = "Behöver ha fångat "..Config.Level5FishAmount.." Fisk",

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
