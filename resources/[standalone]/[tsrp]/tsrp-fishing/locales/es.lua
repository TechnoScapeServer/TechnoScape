local Translations = {
    blips = {
        pier_zone = "Zona de pesca del muelle",
        ocean_zone = "Zona de pesca oceánica",
        bait_store = "Tienda de cebos Del Perro",
        fishery = "Compañía pesquera Millers",
    },
    notify = {
        fishing_input = "Prensa ~INPUT_REPLAY_HIDEHUD~ para los peces",
        bite = "sientes un mordisco",
        catch = "atrapaste un ",
        rod1 = "Caña de pescar casera dada",
        rod2 = "Caña de pescar barata dada",
        rod3 = "Caña de pescar de nivel medio dada",
        rod4 = "Caña de pescar de alto nivel dada",
        rod5 = "Caña de pescar maestra dada",
        upgrade_cheap = "¡Actualizado a caña de pescar barata!",
        upgrade_mid = "¡Has actualizado a caña de pescar de nivel medio!",
        upgrade_high = "¡Has actualizado a caña de pescar de alto nivel!",
        upgrade_master = "¡Has actualizado a La caña de pescar maestra!",
        sold_fish = "Has vendido tu pescado y has recibido $ ",
    },
    target = {
        bait_shop_label = "Tienda de cebo abierto",
        illegal_bait_shop_label = "Ver productos",
        sell_fish = "vender pescado",
        sell_illegal_fish = "vender pescado",
    },
    notify_error = {
        fish_escaped = "El pez se escapó",
        no_rod = "No tienes una caña de pescar",
        no_bait = "No tienes cebo de pesca",
        no_lower_level_rod = "¡No tienes la caña de pescar de nivel inferior!",
        not_enough_fish = "No has pescado lo suficiente",
        already_have_level = "Ya has alcanzado este nivel",
        not_high_enough_level = "¡Nivel no lo suficientemente alto!",
        no_fish = "¡No tienes pescado para vender!",
        no_items = "No tienes ningún artículo",
    },
    menu = {
        fishing_main_menu_header = "Menú principal de pesca",
        open_bait_shop_header = "Tienda de cebo abierta 🐟",
        open_bait_shop_text = "Abre la tienda de cebos",
        fishing_rod_header = "Consigue una caña de pescar 🎣",
        fishing_rod_text = "Consigue una caña de pescar",
        level_up_header = "Menú para subir de nivel ⬆️",
        level_up_text = "¡Menú para subir de nivel!",
        level_menu_header = "Nivel de pesca",
        level_up_2_header = "Nivel hasta el nivel 2",
        level_up_2_text = "Necesidad de haber capturado "..Config.Level2FishAmount.." Pez",
        level_up_3_header = "Nivel hasta el nivel 3",
        level_up_3_text = "Necesidad de haber capturado "..Config.Level3FishAmount.." Pez",
        level_up_4_header = "Nivel hasta el nivel 4",
        level_up_4_text = "Necesidad de haber capturado "..Config.Level4FishAmount.." Pez",
        level_up_5_header = "Nivel hasta el nivel 5",
        level_up_5_text = "Necesidad de haber capturado "..Config.Level5FishAmount.." Pez",

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
