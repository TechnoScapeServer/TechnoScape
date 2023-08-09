OX INSTALL QUIDE

1. Download all dependencies!
    Dependencies:
    ox_lib | https://github.com/overextended/ox_lib/releases/latest
    es_extended / qb-core
    qtarget / qb-target
    ox_inventory / qb-inventory

2. Add Images to your inventory
	ox_inventory > web > build > images
	Paste images from folder images to ox_inventory > web > build > img

3. Add Items to your inventory
	ox_inventory > data> items.lua

	['cat_purple'] = {
		label = 'Purple cat figurine',
		weight = 150,
		stack = true
	},
	['cat_yellow'] = {
		label = 'Yellow cat figurine',
		weight = 150,
		stack = true
	},
	['cat_brown'] = {
		label = 'Brown cat figurine',
		weight = 150,
		stack = true
	},
	['cat_blue'] = {
		label = 'Blue cat figurine',
		weight = 150,
		stack = true
	},
	['cat_red'] = {
		label = 'Red cat figurine',
		weight = 150,
		stack = true
	},
	['cat_green'] = {
		label = 'Green cat figurine',
		weight = 150,
		stack = true
	},
	['princess_robo'] = {
		label = 'Princess Robo',
		weight = 150,
		stack = true
	},
	['shiny_wasabi'] = {
		label = 'Wasabi shiny',
		weight = 150,
		stack = true
	},
		['onion'] = {
		label = 'Onion',
		weight = 10,
		stack = true,
		close = true,
	},
	['chicken_thighs'] = {
		label = 'Chicken thighs',
		weight = 10,
		stack = true,
		close = true,
	},
	['virgin_olive_oil'] = {
		label = 'Virgin olive oil',
		weight = 10,
		stack = true,
		close = true,
	},
	['rice'] = {
		label = 'Rice',
		weight = 10,
		stack = true,
		close = true,
	},
	['soy_sauce'] = {
		label = 'Soy sauce',
		weight = 10,
		stack = true,
		close = true,
	},
	['pullman_bread'] = {
		label = 'Pullman bread',
		weight = 10,
		stack = true,
		close = true,
	},
	['egg'] = {
		label = 'Egg',
		weight = 10,
		stack = true,
		close = true,
	},
	['chicken_breast'] = {
		label = 'Chicken breast',
		weight = 10,
		stack = true,
		close = true,
	},
	['flour'] = {
		label = 'Flour',
		weight = 10,
		stack = true,
		close = true,
	},
	['butter'] = {
		label = 'Butter',
		weight = 10,
		stack = true,
		close = true,
	},
	['milk'] = {
		label = 'Milk',
		weight = 10,
		stack = true,
		close = true,
	},
	['sea_moss'] = {
		label = 'Sea Moss',
		weight = 10,
		stack = true,
		close = true,
	},
	['matcha_powder'] = {
		label = 'Matcha Powder',
		weight = 10,
		stack = true,
		close = true,
	},
	['brewed_coffee'] = {
		label = 'Brewed coffee',
		weight = 10,
		stack = true,
		close = true,
	},
	['sugar'] = {
		label = 'Sugar',
		weight = 10,
		stack = true,
		close = true,
	},
	['cocoa_powder'] = {
		label = 'Cocoa powder',
		weight = 10,
		stack = true,
		close = true,
	},
	['dried_boba_tapioca_pearls'] = {
		label = 'Dried boba tapioca pearls',
		weight = 10,
		stack = true,
		close = true,
	},
	['juice'] = {
		label = 'Juice',
		weight = 10,
		stack = true,
		close = true,
	},
	['lemon'] = {
		label = 'Lemon',
		weight = 10,
		stack = true,
		close = true,
	},
	['mint'] = {
		label = 'Mint',
		weight = 10,
		stack = true,
		close = true,
	},
	['noodles'] = {
		label = 'Noodles',
		weight = 10,
		stack = true,
		close = true,
	},
	['chicken'] = {
		label = 'Chicken',
		weight = 10,
		stack = true,
		close = true,
	},
	['strawberry'] = {
		label = 'Strawberry',
		weight = 10,
		stack = true,
		close = true,
	},
	['baking_powder'] = {
		label = 'Baking powder',
		weight = 10,
		stack = true,
		close = true,
	},
	['rice_flour'] = {
		label = 'Rice Flour',
		weight = 10,
		stack = true,
		close = true,
	},
	['awwdorable_valentines_chocolate'] = {
		label = 'Awwdorable valentines chocolate',
		weight = 10,
		stack = true,
		close = true,
	},
	['booba_milk_tea_1'] = {
		label = 'Booba milk tea 1',
		weight = 10,
		stack = true,
		close = true,
	},
	['booba_milk_tea_2'] = {
		label = 'Booba milk tea 2',
		weight = 10,
		stack = true,
		close = true,
	},
	['bowl_inperfect'] = {
		label = 'Bowl inperfect',
		weight = 10,
		stack = true,
		close = true,
	},
	['brewed_coffe'] = {
		label = 'Brewed coffe',
		weight = 10,
		stack = true,
		close = true,
	},
	['cocoa_powder'] = {
		label = 'Cocoa powder',
		weight = 10,
		stack = true,
		close = true,
	},
	['doki_doki_pancakes'] = {
		label = 'Doki doki pancakes',
		weight = 10,
		stack = true,
		close = true,
	},
	['dried_boba_tapioca_pearls'] = {
		label = 'Dried boba tapioca pearls',
		weight = 10,
		stack = true,
		close = true,
	},
	['gingerkitty_cookie'] = {
		label = 'Gingerkitty cookie',
		weight = 10,
		stack = true,
		close = true,
	},
	['hamburg_stake'] = {
		label = 'Hamburg steak',
		weight = 10,
		stack = true,
		close = true,
	},
	['hot_chocolate'] = {
		label = 'Hot chocolate',
		weight = 10,
		stack = true,
		close = true,
	},
	['jelly_beans'] = {
		label = 'Jelly beans',
		weight = 10,
		stack = true,
		close = true,
	},
	['lovely_hot_chocolate'] = {
		label = 'Lovely hot chocolate',
		weight = 10,
		stack = true,
		close = true,
	},
	['matcha_powder'] = {
		label = 'Matcha powder',
		weight = 10,
		stack = true,
		close = true,
	},
	['matcha_coffee'] = {
		label = 'Matcha coffee',
		weight = 10,
		stack = true,
		close = true,
	},
	['meowchi_mochi_ice_cream'] = {
		label = 'Meowchi mochi ice cream',
		weight = 10,
		stack = true,
		close = true,
	},
	['noodles'] = {
		label = 'Noodles',
		weight = 10,
		stack = true,
		close = true,
	},
	['om_nom_omurice'] = {
		label = 'Om nom omurice',
		weight = 10,
		stack = true,
		close = true,
	},
	['nuts'] = {
		label = 'Nuts',
		weight = 10,
		stack = true,
		close = true,
	},
	['pullman_bread'] = {
		label = 'Pullman bread',
		weight = 10,
		stack = true,
		close = true,
	},
	['rice_balls'] = {
		label = 'Rice balls',
		weight = 10,
		stack = true,
		close = true,
	},
	['rice_flour'] = {
		label = 'Rice flour',
		weight = 10,
		stack = true,
		close = true,
	},
	['sea_moss'] = {
		label = 'Sea moss',
		weight = 10,
		stack = true,
		close = true,
	},
	['soy_sauce'] = {
		label = 'Soy sauce',
		weight = 10,
		stack = true,
		close = true,
	},
	['strawberry'] = {
		label = 'Strawberry',
		weight = 10,
		stack = true,
		close = true,
	},
	['strawberry_shortcake'] = {
		label = 'Strawberry shortcake',
		weight = 10,
		stack = true,
		close = true,
	},
	['suger'] = {
		label = 'Suger',
		weight = 10,
		stack = true,
		close = true,
	},
	['sugoi_katsu_sando'] = {
		label = 'Sugoi katsu sando',
		weight = 10,
		stack = true,
		close = true,
	},
	['sweet_herbal_tea'] = {
		label = 'Sweet herbal tea',
		weight = 10,
		stack = true,
		close = true,
	},
	['warm_chicken_noodle'] = {
		label = 'Warm chicken noodle',
		weight = 10,
		stack = true,
		close = true,
	},
	['uwu_mysterybox'] = {
		label = 'UWU Mystery Box',
		weight = 10,
		stack = true,
		close = true,
	},
	['glass_tall_dirty'] = {
		label = 'Dirty Tall Glass',
		weight = 50,
		stack = true,
		close = false,
		consume = 0
	},
	['bar_bowl_dirty'] = {
		label = 'Dirty bowl',
		weight = 10,
		stack = true,
		close = true,
	},
	['bar_bowl'] = {
		label = 'Bowl',
		weight = 10,
		stack = true,
		close = true,
	},
	['glass_tall'] = {
		label = 'Glass Tall',
		weight = 50,
		stack = true,
		close = false,
		consume = 0
	},
	['steak'] = {
		label = 'Steak',
		weight = 10,
		stack = true,
		close = true,
	},
	['oxygen_cake'] = {
		label = 'Oxygen Cake',
		weight = 10,
		stack = true,
		close = true,
	},
	['dragos_fire_cupcake'] = {
		label = 'Dragon s Fire Cupcake',
		weight = 10,
		stack = true,
		close = true,
	},
	['kira_kira_currye'] = {
		label = 'Kira Kira Currye',
		weight = 10,
		stack = true,
		close = true,
	},
	['purrfect_parfait_ballaberry'] = {
		label = 'Purrfect Parfait',
		weight = 10,
		stack = true,
		close = true,
	},
	['ballbarry_cupcake'] = {
		label = 'Ballbarry Cupcake',
		weight = 10,
		stack = true,
		close = true,
	},
	['purrfect_parfait'] = {
		label = 'Purrfect Parfait',
		weight = 10,
		stack = true,
		close = true,
	},
	['cat_macaroon_brown'] = {
		label = 'Brown cat macaroon',
		weight = 10,
		stack = true,
		close = true,
	},
	['cat_macaroon_green'] = {
		label = 'Green cat macaroon',
		weight = 10,
		stack = true,
		close = true,
	},
	['cat_macaroon_pink'] = {
		label = 'Pink cat macaroon',
		weight = 10,
		stack = true,
		close = true,
	},
	['cat_macaroon_turquoise'] = {
		label = 'Turquoise cat macaroon',
		weight = 10,
		stack = true,
		close = true,
	},
	['brown_dye'] = {
		label = 'Brown dye',
		weight = 10,
		stack = true,
		close = true,
	},
	['pink_dye'] = {
		label = 'Pink dye',
		weight = 10,
		stack = true,
		close = true,
	},
	['green_dye'] = {
		label = 'Green dye',
		weight = 10,
		stack = true,
		close = true,
	},
	['turquoise_dye'] = {
		label = 'Turquoise dye',
		weight = 10,
		stack = true,
		close = true,
	},
	['plate'] = {
		label = 'Plate',
		weight = 10,
		stack = true,
		close = true,
	},
	['cup'] = {
		label = 'Cup',
		weight = 10,
		stack = true,
		close = true,
	},
	['cup_dirty'] = {
		label = 'Cup Dirty',
		weight = 10,
		stack = true,
		close = true,
	},
	['plate_dirty'] = {
		label = 'Plate Dirty',
		weight = 10,
		stack = true,
		close = true,
	},
	['ice'] = {
		label = 'Ice',
		weight = 10,
		stack = true,
		close = true,
	},


4. add ensure drc_uwucafe into your server.cfg (make sure to start it after ox_lib and your target system!)

5. Enjoy your new UWU Cafe script from DRC SCRIPTS!

-- ESX JOB

1. insert into database

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_uwu', 'Uwu Cafe', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_uwu', 'Uwu Cafe', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_uwu', 'Uwu Cafe', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('uwu', 'Uwu Cafe')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('uwu',0,'recruit','Recruit',120,'{}','{}'),
	('uwu',1,'novice','Novice',240,'{}','{}'),
	('uwu',2,'experienced','Experienced',360,'{}','{}'),
	('uwu',3,'advanced',"Advanced",480,'{}','{}'),
	('uwu',4,'manager',"Manager",480,'{}','{}'),
	('uwu',5,'boss','Boss',500,'{}','{}')
;