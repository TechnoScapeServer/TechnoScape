local Translations = {
    blips = {
        pier_zone = "Zone de pêche de la jetée",
        ocean_zone = "Zone de pêche en mer",
        bait_store = "Magasin d'appâts Del Perro",
        fishery = "Millers Fishery Company",
    },
    notify = {
        fishing_input = "Appuyez sur ~INPUT_REPLAY_HIDEHUD~ pour pêcher",
        bite = "Vous sentez une morsure",
        catch = "Vous avez attrapé un ",
        rod1 = "Compte tenu de la canne à pêche maison",
        rod2 = "Compte tenu de la canne à pêche bon marché",
        rod3 = "Canne à pêche de niveau intermédiaire donnée",
        rod4 = "Canne à pêche de haut niveau donnée",
        rod5 = "Compte tenu de la canne à pêche du maître",
        upgrade_cheap = "Mise à niveau vers une canne à pêche bon marché !",
        upgrade_mid = "Vous êtes passé à la canne à pêche de niveau intermédiaire !",
        upgrade_high = "Vous êtes passé à la canne à pêche de haut niveau !",
        upgrade_master = "Vous êtes passé à The Master Fishing Rod !",
        sold_fish = "Vous avez vendu votre poisson et reçu $ ",
    },
    target = {
        bait_shop_label = "Ouvrir la boutique d'appâts",
        illegal_bait_shop_label = "Voir les marchandises",
        sell_fish = "Vendre du poisson",
        sell_illegal_fish = "Vendre du poisson",
    },
    notify_error = {
        fish_escaped = "Le poisson s'est enfui",
        no_rod = "Vous n'avez pas de canne à pêche",
        no_bait = "Vous n'avez pas d'appâts de pêche",
        no_lower_level_rod = "Vous n'avez pas la canne à pêche de niveau inférieur !",
        not_enough_fish = "Vous n'avez pas assez pêché",
        already_have_level = "Vous avez déjà atteint ce niveau",
        not_high_enough_level = "Niveau pas assez élevé !",
        no_fish = "Vous n'avez aucun poisson à vendre !",
        no_items = "Vous n'avez aucun article",
    },
    menu = {
        fishing_main_menu_header = "Menu principal de la pêche",
        open_bait_shop_header = "Ouvrir la boutique d'appâts 🐟",
        open_bait_shop_text = "Ouvrir la boutique d'appâts",
        fishing_rod_header = "Obtenez une canne à pêche 🎣",
        fishing_rod_text = "Obtenez une canne à pêche",
        level_up_header = "Menu de niveau supérieur ⬆️",
        level_up_text = "Menu pour monter de niveau !",
        level_menu_header = "Niveau de pêche",
        level_up_2_header = "Monter au niveau 2",
        level_up_2_text = "Besoin d'avoir attrapé "..Config.Level2FishAmount.." Poisson",
        level_up_3_header = "Monter au niveau 3",
        level_up_3_text = "Besoin d'avoir attrapé "..Config.Level3FishAmount.." Poisson",
        level_up_4_header = "Monter au niveau 4",
        level_up_4_text = "Besoin d'avoir attrapé "..Config.Level4FishAmount.." Poisson",
        level_up_5_header = "Monter au niveau 5",
        level_up_5_text = "Besoin d'avoir attrapé "..Config.Level5FishAmount.." Poisson",

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
