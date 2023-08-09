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

	['avocado'] = {
		label = 'Avocado',
		weight = 10,
		stack = true,
		close = true,
	},
	['bacon'] = {
		label = 'Bacon',
		weight = 10,
		stack = true,
		close = true,
	},
	['bamboo_skewers'] = {
		label = 'Bamboo Skewers',
		weight = 10,
		stack = true,
		close = true,
	},
	['banhxeo'] = {
		label = 'Banhxeo',
		weight = 10,
		stack = true,
		close = true,
	},
	['beef_leg'] = {
		label = 'Beef Leg',
		weight = 10,
		stack = true,
		close = true,
	},
	['brisket'] = {
		label = 'Brisket',
		weight = 10,
		stack = true,
		close = true,
	},
	['brocoli'] = {
		label = 'Brocoli',
		weight = 10,
		stack = true,
		close = true,
	},
	['bunbonambo'] = {
		label = 'Bun bo nam bo',
		weight = 10,
		stack = true,
		close = true,
	},
	['cane_sugar'] = {
		label = 'Cane Sugar',
		weight = 10,
		stack = true,
		close = true,
	},
	['carrot'] = {
		label = 'Carrot',
		weight = 10,
		stack = true,
		close = true,
	},
	['cocacola'] = {
		label = 'CocaCola',
		weight = 10,
		stack = true,
		close = true,
	},
	['cocacola_clear'] = {
		label = 'CocaCola Clear',
		weight = 10,
		stack = true,
		close = true,
	},
	['coconut_milk'] = {
		label = 'Coconut Milk',
		weight = 10,
		stack = true,
		close = true,
	},
	['coriander'] = {
		label = 'Coriander',
		weight = 10,
		stack = true,
		close = true,
	},
	['cucumber'] = {
		label = 'Cucumber',
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
	['dirty_cup'] = {
		label = 'Dirty Cup',
		weight = 10,
		stack = true,
		close = true,
	},
	['dirty_glass'] = {
		label = 'Dirty Glass',
		weight = 10,
		stack = true,
		close = true,
	},
	['dirty_plate'] = {
		label = 'Dirty Plate',
		weight = 10,
		stack = true,
		close = true,
	},
	['dorayaki'] = {
		label = 'Dorayaki',
		weight = 10,
		stack = true,
		close = true,
	},
	['dorayaki_plate'] = {
		label = 'Dorayaki Plate',
		weight = 10,
		stack = true,
		close = true,
	},
	['dried_tuna_katsuobushi'] = {
		label = 'Dried Tuna Katsuobushi',
		weight = 10,
		stack = true,
		close = true,
	},
	['eggs'] = {
		label = 'Eggs',
		weight = 10,
		stack = true,
		close = true,
	},
	['fanta'] = {
		label = 'Fanta',
		weight = 10,
		stack = true,
		close = true,
	},
	['fish_sauce'] = {
		label = 'Fish Sauce',
		weight = 10,
		stack = true,
		close = true,
	},
	['garlic'] = {
		label = 'Garlic',
		weight = 10,
		stack = true,
		close = true,
	},
	['glass'] = {
		label = 'Glass Cup',
		weight = 10,
		stack = true,
		close = true,
	},
	['greentea'] = {
		label = 'Green Tea',
		weight = 10,
		stack = true,
		close = true,
	},
	['gyokuro'] = {
		label = 'Gyokuro',
		weight = 10,
		stack = true,
		close = true,
	},
	['chicken_meat'] = {
		label = 'Chicken Meat',
		weight = 10,
		stack = true,
		close = true,
	},
	['chilli'] = {
		label = 'Chilli',
		weight = 10,
		stack = true,
		close = true,
	},
	['chinese_rice_wine'] = {
		label = 'Chinese Rice Wine',
		weight = 10,
		stack = true,
		close = true,
	},
	['roasted_fresh_vegetables'] = {
		label = 'Roasted fresh vegetables',
		weight = 10,
		stack = true,
		close = true,
	},
	['chocolate'] = {
		label = 'chocolate',
		weight = 10,
		stack = true,
		close = true,
	},
	['japanese_cheesecake'] = {
		label = 'Japanese Cheesecake',
		weight = 10,
		stack = true,
		close = true,
	},
	['japanese_cheesecake_plate'] = {
		label = 'Japanese Cheesecake Plate',
		weight = 10,
		stack = true,
		close = true,
	},
	['kombucha'] = {
		label = 'Kombucha',
		weight = 10,
		stack = true,
		close = true,
	},
	['kungpao'] = {
		label = 'Kung Pao',
		weight = 10,
		stack = true,
		close = true,
	},
	['leek'] = {
		label = 'Leek',
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
	['matcha_swiss'] = {
		label = 'Matcha Swiss',
		weight = 10,
		stack = true,
		close = true,
	},
	['matcha_swiss_plate'] = {
		label = 'Matcha Swiss Plate',
		weight = 10,
		stack = true,
		close = true,
	},
	['matchatea'] = {
		label = 'Matcha Tea',
		weight = 10,
		stack = true,
		close = true,
	},
	['mayonese'] = {
		label = 'Mayonese',
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
	['mirin'] = {
		label = 'Mirin',
		weight = 10,
		stack = true,
		close = true,
	},
	['mugichatea'] = {
		label = 'Mugicha Tea',
		weight = 10,
		stack = true,
		close = true,
	},
	['mungo_sprouts'] = {
		label = 'Mungo Sprouts',
		weight = 10,
		stack = true,
		close = true,
	},
	['nori'] = {
		label = 'Nori',
		weight = 10,
		stack = true,
		close = true,
	},
	['oil'] = {
		label = 'Oil',
		weight = 10,
		stack = true,
		close = true,
	},
	['okonomiyaki'] = {
		label = 'Okonomiyaki',
		weight = 10,
		stack = true,
		close = true,
	},
	['okonomiyaki_mixtures'] = {
		label = 'Okonomiyaki Mixtures',
		weight = 10,
		stack = true,
		close = true,
	},
	['okonomiyaki_sauce'] = {
		label = 'Okonomiyaki sauce',
		weight = 10,
		stack = true,
		close = true,
	},
	['onigiri'] = {
		label = 'Onigiri',
		weight = 10,
		stack = true,
		close = true,
	},
	['peanut_butter'] = {
		label = 'Peanut Butter',
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
	['potato_starch'] = {
		label = 'Potato Starch',
		weight = 10,
		stack = true,
		close = true,
	},
	['ramune_lychee'] = {
		label = 'Ramune Lychee',
		weight = 10,
		stack = true,
		close = true,
	},
	['ramune_original'] = {
		label = 'Ramune Original',
		weight = 10,
		stack = true,
		close = true,
	},
	['ramune_strawberry'] = {
		label = 'Ramune Strawberry',
		weight = 10,
		stack = true,
		close = true,
	},
	['ramune_watermelon'] = {
		label = 'Ramune Watermelon',
		weight = 10,
		stack = true,
		close = true,
	},
	['red_pepper'] = {
		label = 'Red Pepper',
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
	['rice_flour'] = {
		label = 'Rice Flour',
		weight = 10,
		stack = true,
		close = true,
	},
	['rice_noodles'] = {
		label = 'Rice Noodles',
		weight = 10,
		stack = true,
		close = true,
	},
	['rice_paper'] = {
		label = 'Rice Paper',
		weight = 10,
		stack = true,
		close = true,
	},
	['rice_vinegar'] = {
		label = 'Rice Vinegar',
		weight = 10,
		stack = true,
		close = true,
	},
	['sake'] = {
		label = 'Sake',
		weight = 10,
		stack = true,
		close = true,
	},
	['salad'] = {
		label = 'Salad',
		weight = 10,
		stack = true,
		close = true,
	},
	['sesame_oil'] = {
		label = 'Sesame Oil',
		weight = 10,
		stack = true,
		close = true,
	},
	['sesame_seeds'] = {
		label = 'Sesame seeds',
		weight = 10,
		stack = true,
		close = true,
	},
	['shelled_peanuts'] = {
		label = 'Shelled Peanuts',
		weight = 10,
		stack = true,
		close = true,
	},
	['shrimp'] = {
		label = 'Shrimp',
		weight = 10,
		stack = true,
		close = true,
	},
	['soba'] = {
		label = 'Soba',
		weight = 10,
		stack = true,
		close = true,
	},
	['soba_noodles'] = {
		label = 'Soba noodles',
		weight = 10,
		stack = true,
		close = true,
	},
	['soy_sauce'] = {
		label = 'Soy Sauce',
		weight = 10,
		stack = true,
		close = true,
	},
	['spring_onion'] = {
		label = 'Spring Onion',
		weight = 10,
		stack = true,
		close = true,
	},
	['spring_rolls'] = {
		label = 'Spring Rolls',
		weight = 10,
		stack = true,
		close = true,
	},
	['sprite'] = {
		label = 'Sprite',
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
	['sushi'] = {
		label = 'Sushi',
		weight = 10,
		stack = true,
		close = true,
	},	
	['sushi_rice'] = {
		label = 'Sushi rice',
		weight = 10,
		stack = true,
		close = true,
	},
	['tofu'] = {
		label = 'Tofu',
		weight = 10,
		stack = true,
		close = true,
	},
	['turmeric'] = {
		label = 'Turmeric',
		weight = 10,
		stack = true,
		close = true,
	},
	['udon'] = {
		label = 'Udon',
		weight = 10,
		stack = true,
		close = true,
	},
	['udon_noodles'] = {
		label = 'Udon Noodles',
		weight = 10,
		stack = true,
		close = true,
	},	
	['wakame'] = {
		label = 'Wakame',
		weight = 10,
		stack = true,
		close = true,
	},	
	['wasabi_paste'] = {
		label = 'Wasabi paste',
		weight = 10,
		stack = true,
		close = true,
	},	
	['white_cabbage'] = {
		label = 'White Cabbage',
		weight = 10,
		stack = true,
		close = true,
	},	
	['yakitori'] = {
		label = 'Yakitori',
		weight = 10,
		stack = true,
		close = true,
	},	
	['yellow_pepper'] = {
		label = 'Yellow Pepper',
		weight = 10,
		stack = true,
		close = true,
	},



4. add ensure drc_koi into your server.cfg (make sure to start it after ox_lib and your target system!)

5. Enjoy your new koi script from DRC SCRIPTS!

-- ESX JOB

1. insert into database

INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_koi', 'koi', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_koi', 'koi', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_koi', 'koi', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('koi', 'koi')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('koi',0,'recruit','Recruit',120,'{}','{}'),
	('koi',1,'novice','Novice',240,'{}','{}'),
	('koi',2,'experienced','Experienced',360,'{}','{}'),
	('koi',3,'advanced',"Advanced",480,'{}','{}'),
	('koi',4,'manager',"Manager",480,'{}','{}'),
	('koi',5,'boss','Boss',500,'{}','{}')
;