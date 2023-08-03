local Translations = {
    blips = {
        pier_zone = "منطقة الصيد الرصيف",
        ocean_zone = "منطقة صيد المحيط",
        bait_store = "متجر ديل بيرو بيت",
        fishery = "شركة ميلرز للسمك",
    },
    notify = {
        fishing_input = "يضعط ~INPUT_REPLAY_HIDEHUD~ للأسماك",
        bite = "تشعر بالعضة",
        catch = "لقد مسكت ",
        rod1 = "صنارة صيد محلية الصنع",
        rod2 = "نظرا رخيصة قصبة الصيد",
        rod3 = "جيفن صنارة صيد متوسطة المستوى",
        rod4 = "جيفن صنارة صيد من الدرجة العالية",
        rod5 = "جيفن ماستر صنارة صيد",
        upgrade_cheap = "ترقية إلى رخيصة قصبة الصيد!",
        upgrade_mid = "قمت بالترقية إلى قصبة صيد متوسطة المستوى!",
        upgrade_high = "قمت بالترقية إلى قصبة صيد من الدرجة العالية!",
        upgrade_master = "قمت بالترقية إلى صنارة الصيد الرئيسية!",
        sold_fish = "لقد قمت ببيع أسماكك واستلمت دولارات ",
    },
    target = {
        bait_shop_label = "افتح متجر الطعم",
        illegal_bait_shop_label = "مشاهدة ملف Wares",
        sell_fish = "بيع السمك",
        sell_illegal_fish = "بيع السمك",
    },
    notify_error = {
        fish_escaped = "ذهب السمك بعيدا",
        no_rod = "ليس لديك صنارة صيد",
        no_bait = "ليس لديك طعم صيد",
        no_lower_level_rod = "ليس لديك قضيب صيد منخفض المستوى!",
        not_enough_fish = "أنت لم تصطاد بما فيه الكفاية",
        already_have_level = "لقد حققت هذا المستوى بالفعل",
        not_high_enough_level = "مستوى غير مرتفع بما يكفي!",
        no_fish = "ليس لديك أي سمكة للبيع!",
        no_items = "ليس لديك أي عناصر",
    },
    menu = {
        fishing_main_menu_header = "قائمة الصيد الرئيسية",
        open_bait_shop_header = "افتح متجر الطُعم 🐟",
        open_bait_shop_text = "افتح متجر الطُعم",
        fishing_rod_header = "احصل على سنارة صيد 🎣",
        fishing_rod_text = "احصل على سنارة صيد",
        level_up_header = "قائمة المستوى الأعلى ⬆️",
        level_up_text = "قائمة التسوية!",
        level_menu_header = "مستوى الصيد",
        level_up_2_header = "المستوى يصل إلى المستوى 2",
        level_up_2_text = "تحتاج إلى القبض عليها "..Config.Level2FishAmount.." سمك",
        level_up_3_header = "المستوى يصل إلى المستوى 3",
        level_up_3_text = "تحتاج إلى القبض عليها "..Config.Level3FishAmount.." سمك",
        level_up_4_header = "المستوى يصل إلى المستوى 4",
        level_up_4_text = "تحتاج إلى القبض عليها "..Config.Level4FishAmount.." سمك",
        level_up_5_header = "المستوى يصل إلى المستوى 5",
        level_up_5_text = "تحتاج إلى القبض عليها "..Config.Level5FishAmount.." سمك",

    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
