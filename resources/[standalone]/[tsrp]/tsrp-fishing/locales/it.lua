local Translations = {
    blips = {
        pier_zone = "Zona di pesca del molo",
        ocean_zone = "Zona di pesca oceanica",
        bait_store = "Negozio di esche Del Perro",
        fishery = "Società di pesca dei mugnai",
    },
    notify = {
        fishing_input = "Premi ~INPUT_REPLAY_HIDEHUD~ per pescare",
        bite = "Senti un morso",
        catch = "Hai preso un ",
        rod1 = "Data canna da pesca fatta in casa",
        rod2 = "Data Canna Da Pesca Economica",
        rod3 = "Data canna da pesca di livello medio",
        rod4 = "Data canna da pesca di alto livello",
        rod5 = "Dato maestro canna da pesca",
        upgrade_cheap = "Aggiornato a canna da pesca economica!",
        upgrade_mid = "Sei passato a Canna da pesca di livello intermedio!",
        upgrade_high = "Sei passato a Canna da pesca di alto livello!",
        upgrade_master = "Sei passato a The Master Fishing Rod!",
        sold_fish = "Hai venduto il tuo pesce e ricevuto $ ",
    },
    target = {
        bait_shop_label = "Apri negozio di esche",
        illegal_bait_shop_label = "Visualizza merci",
        sell_fish = "Vendi pesce",
        sell_illegal_fish = "Vendi pesce",
    },
    notify_error = {
        fish_escaped = "Il pesce è scappato",
        no_rod = "Non hai una canna da pesca",
        no_bait = "Non hai esche da pesca",
        no_lower_level_rod = "Non hai la canna da pesca di livello inferiore!",
        not_enough_fish = "You Havent Fished Enough",
        already_have_level = "Hai già raggiunto questo livello",
        not_high_enough_level = "Livello non abbastanza alto!",
        no_fish = "Non hai pesci da vendere!",
        no_items = "Non hai nessun oggetto",
    },
    menu = {
        fishing_main_menu_header = "Menu principale di pesca",
        open_bait_shop_header = "Apri negozio di esche 🐟",
        open_bait_shop_text = "Apri il negozio di esche",
        fishing_rod_header = "Prendi una canna da pesca 🎣",
        fishing_rod_text = "Prendi una canna da pesca",
        level_up_header = "Menu Sali di livello ⬆️",
        level_up_text = "Menu per salire di livello!",
        level_menu_header = "Livello di pesca",
        level_up_2_header = "Sali di livello fino al livello 2",
        level_up_2_text = "Bisogno di essere catturato "..Config.Level2FishAmount.." Pesce",
        level_up_3_header = "Sali di livello fino al livello 3",
        level_up_3_text = "Bisogno di essere catturato "..Config.Level3FishAmount.." Pesce",
        level_up_4_header = "Sali di livello fino al livello 4",
        level_up_4_text = "Bisogno di essere catturato "..Config.Level4FishAmount.." Pesce",
        level_up_5_header = "Sali di livello fino al livello 5",
        level_up_5_text = "Bisogno di essere catturato "..Config.Level5FishAmount.." Pesce",

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
