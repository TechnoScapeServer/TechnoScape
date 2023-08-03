local Translations = {
    blips = {
        pier_zone = "Khu câu cá bến tàu",
        ocean_zone = "Khu câu cá đại dương",
        bait_store = "Cửa Hàng Mồi Del Perro",
        fishery = "Công ty thủy sản Millers",
    },
    notify = {
        fishing_input = "Nhấn ~INPUT_REPLAY_HIDEHUD~ để câu cá",
        bite = "Bạn cảm thấy một vết cắn",
        catch = "bạn bắt một ",
        rod1 = "Tặng cần câu tự chế",
        rod2 = "Tặng cần câu giá rẻ",
        rod3 = "Tặng cần câu trung cấp",
        rod4 = "Tặng cần câu cao cấp",
        rod5 = "Tặng cần câu Master",
        upgrade_cheap = "Nâng Cấp Lên Cần Câu Giá Rẻ!",
        upgrade_mid = "Bạn đã nâng cấp lên Cần Câu Trung Cấp!",
        upgrade_high = "Bạn đã nâng cấp lên Cần Câu Cao Cấp!",
        upgrade_master = "Bạn đã nâng cấp lên The Master Fishing Rod!",
        sold_fish = "Bạn đã bán cá của mình và nhận được $ ",
    },
    target = {
        bait_shop_label = "Mở cửa hàng mồi câu",
        illegal_bait_shop_label = "xem đồ",
        sell_fish = "bán cá",
        sell_illegal_fish = "bán cá",
    },
    notify_error = {
        fish_escaped = "cá đã đi",
        no_rod = "Bạn không có cần câu",
        no_bait = "Bạn Không Có Mồi Câu Cá",
        no_lower_level_rod = "Bạn Không Có Cần Câu Cấp Thấp Hơn!",
        not_enough_fish = "Bạn chưa đánh cá đủ",
        already_have_level = "Bạn đã đạt được cấp độ này",
        not_high_enough_level = "Trình độ không đủ cao!",
        no_fish = "Bạn không có cá để bán!",
        no_items = "Bạn không có bất kỳ mục nào",
    },
    menu = {
        fishing_main_menu_header = "Thực đơn chính câu cá",
        open_bait_shop_header = "Mở cửa hàng mồi câu 🐟",
        open_bait_shop_text = "Mở Cửa Hàng Mồi",
        fishing_rod_header = "Lấy cần câu 🎣",
        fishing_rod_text = "Lấy cần câu",
        level_up_header = "Thực đơn tăng cấp ⬆️",
        level_up_text = "Menu để tăng cấp!",
        level_menu_header = "Cấp độ câu cá",
        level_up_2_header = "Lên cấp 2",
        level_up_2_text = "cần phải có bắt "..Config.Level2FishAmount.." Cá",
        level_up_3_header = "Lên cấp 3",
        level_up_3_text = "cần phải có bắt "..Config.Level3FishAmount.." Cá",
        level_up_4_header = "Lên cấp 4",
        level_up_4_text = "cần phải có bắt "..Config.Level4FishAmount.." Cá",
        level_up_5_header = "Lên cấp 5",
        level_up_5_text = "cần phải có bắt "..Config.Level5FishAmount.." Cá",

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
