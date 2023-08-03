local Translations = {
    blips = {
        pier_zone = "Zona de pescuit debarcader",
        ocean_zone = "Zona de pescuit oceanic",
        bait_store = "Magazinul de momeli Del Perro",
        fishery = "Compania Millers Fishery",
    },
    notify = {
        fishing_input = "Apăsați pe ~INPUT_REPLAY_HIDEEHUD~ pentru a pescui",
        bite = "Simți o mușcătură",
        catch = "Ai prins o ",
        rod1 = "Dată undiță de casă",
        rod2 = "Dat undiță ieftină",
        rod3 = "Dată undiță de pescuit de nivel mediu",
        rod4 = "Dată undiță de nivel înalt",
        rod5 = "Dată Master Undița",
        upgrade_cheap = "Upgrade la undița ieftină!",
        upgrade_mid = "Ai trecut la undița de pescuit de nivel mediu!",
        upgrade_high = "Ai trecut la undița de pescuit de nivel înalt!",
        upgrade_master = "Ai făcut upgrade la The Master Fishing Rod!",
        sold_fish = "Ți-ai vândut peștele și ai primit $ ",
    },
    target = {
        bait_shop_label = "Deschide magazinul de momeli",
        illegal_bait_shop_label = "Vizualizați marfă",
        sell_fish = "Vinde pește",
        sell_illegal_fish = "Vinde pește",
    },
    notify_error = {
        fish_escaped = "Peștele a scăpat",
        no_rod = "Nu ai undiță",
        no_bait = "Nu ai momeală de pescuit",
        no_lower_level_rod = "Nu aveți undița de pescuit de nivel inferior!",
        not_enough_fish = "Nu ai pescuit suficient",
        already_have_level = "Ați atins deja acest nivel",
        not_high_enough_level = "Nivel insuficient de înalt!",
        no_fish = "Nu ai pește de vândut!",
        no_items = "Nu ai niciun obiect",
    },
    menu = {
        fishing_main_menu_header = "Meniul principal de pescuit",
        open_bait_shop_header = "Deschide magazinul de momeli 🐟",
        open_bait_shop_text = "Deschide magazinul de momeli",
        fishing_rod_header = "Ia o undiță 🎣",
        fishing_rod_text = "Ia o undiță",
        level_up_header = "Meniu de nivel superior ⬆️",
        level_up_text = "Meniu pentru creșterea nivelului!",
        level_menu_header = "Nivel de pescuit",
        level_up_2_header = "Nivelul până la nivelul 2",
        level_up_2_text = "Trebuie să fi prins "..Config.Level2FishAmount.." Peşte",
        level_up_3_header = "Nivelul până la nivelul 3",
        level_up_3_text = "Trebuie să fi prins "..Config.Level3FishAmount.." Peşte",
        level_up_4_header = "Nivelul până la nivelul 4",
        level_up_4_text = "Trebuie să fi prins "..Config.Level4FishAmount.." Peşte",
        level_up_5_header = "Nivelul până la nivelul 5",
        level_up_5_text = "Trebuie să fi prins "..Config.Level5FishAmount.." Peşte",

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
