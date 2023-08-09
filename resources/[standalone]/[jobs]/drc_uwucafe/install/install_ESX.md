ESX INSTALL QUIDE

If u use ox_inventory please open install_OX.md and close this file!
1. Download all dependencies!
    Dependencies:
    ox_lib | https://github.com/overextended/ox_lib/releases/latest
    es_extended / qb-core
    qtarget / qb-target
    ox_inventory / qb-inventory

ITEMS AND JOBS

2. Add Item to your server
    Use this insert in your database or use esx_items.sql!

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('cat_purple', 'Purple cat figurine', 1, 0, 1),
('cat_yellow', 'Yellow cat figurine', 1, 0, 1),
('cat_brown', 'Brown cat figurine', 1, 0, 1),
('cat_blue', 'Blue cat figurine', 1, 0, 1),
('cat_red', 'Red cat figurine', 1, 0, 1),
('cat_green', 'Green cat figurine', 1, 0, 1),
('princess_robo', 'Princess Robo figurine', 1, 0, 1),
('shiny_wasabi', 'Wasabi shiny figurine', 1, 0, 1),
('onion', 'onion', 1, 0, 1),
('chicken_thighs', 'Chicken thighs', 1, 0, 1),
('virgin_olive_oil', 'Virgin olive oil', 1, 0, 1),
('rice', 'Rice', 1, 0, 1),
('soy_sauce', 'Soy sauce', 1, 0, 1),
('pullman_bread', 'Pullman bread', 1, 0, 1),
('egg', 'Egg', 1, 0, 1),
('chicken_breast', 'Chicken breast', 1, 0, 1),
('flour', 'Flour', 1, 0, 1),
('butter', 'Butter', 1, 0, 1),
('milk', 'Milk', 1, 0, 1),
('sea_moss', 'Sea moss', 1, 0, 1),
('matcha_powder', 'Matcha Powder', 1, 0, 1),
('sugar', 'Sugar', 1, 0, 1),
('cocoa_powder', 'Cocoa Powder', 1, 0, 1),
('dried_boba_tapioca_pearls', 'Dried boba tapioca pearls', 1, 0, 1),
('juice', 'Juice', 1, 0, 1),
('lemon', 'Lemon', 1, 0, 1),
('mint', 'Mint', 1, 0, 1),
('noodles', 'Noodles', 1, 0, 1),
('chicken', 'Chicken', 1, 0, 1),
('baking_powder', 'Baking Powder', 1, 0, 1),
('rice_flour', 'Rice flour', 1, 0, 1),
('awwdorable_valentines_chocolate', 'Awwdorable valentines chocolate', 1, 0, 1),
('booba_milk_tea_1', 'booba milk tea brown', 1, 0, 1),
('booba_milk_tea_2', 'booba milk tea orange', 1, 0, 1),
('brewed_coffe', 'Brewed coffe', 1, 0, 1),
('cocoa_powder', 'Cocoa Powder', 1, 0, 1),
('doki_doki_pancakes', 'Doki doki pancakes', 1, 0, 1),
('gingerkitty_cookie', 'Gingerkitty cookie', 1, 0, 1),
('hamburg_stake', 'Hamburg steak', 1, 0, 1),
('hot_chocolate', 'Hot chocolate', 1, 0, 1),
('jelly_beans', 'Jelly beans', 1, 0, 1),
('lovely_hot_chocolate', 'Lovely hot chocolate', 1, 0, 1),
('matcha_powder', 'Matcha powder', 1, 0, 1),
('matcha_coffee', 'Matcha coffee', 1, 0, 1),
('meowchi_mochi_ice_cream', 'Meowchi mochi ice cream', 1, 0, 1),
('noodles', 'Noodles', 1, 0, 1),
('om_nom_omurice', 'Om nom omurice', 1, 0, 1),
('nuts', 'Nuts', 1, 0, 1),
('pullman_bread', 'Pullman bread', 1, 0, 1),
('rice_balls', 'Rice balls', 1, 0, 1),
('rice_flour', 'Rice flour', 1, 0, 1),
('sea_moss', 'Sea moss', 1, 0, 1),
('soy_sauce', 'Soy sauce', 1, 0, 1),
('strawberry', 'Strawberry', 1, 0, 1),
('strawberry_shortcake', 'Strawberry shortcake', 1, 0, 1),
('sugoi_katsu_sando', 'Sugoi katsu sando', 1, 0, 1),
('sweet_herbal_tea', 'Sweet herbal tea', 1, 0, 1),
('warm_chicken_noodle', 'Warm chicken noodle', 1, 0, 1),
('uwu_mysterybox', 'UWU Mystery Box', 1, 0, 1),
('glass_tall_dirty', 'Glass tall dirty', 1, 0, 1),
('bar_bowl_dirty', 'Bar bowl dirty', 1, 0, 1),
('bar_bowl', 'Bar bowl', 1, 0, 1),
('glass_tall', 'Glass tall', 1, 0, 1),
('steak', 'Steak', 1, 0, 1),
('oxygen_cake', 'Oxygen cake', 1, 0, 1),
('dragos_fire_cupcake', 'Dragis fire cupcake', 1, 0, 1),
('kira_kira_currye', 'Kira kira currye', 1, 0, 1),
('purrfect_parfait_ballaberry', 'Purrfect parfait ballaberry', 1, 0, 1),
('ballbarry_cupcake', 'Ballbarry cupcake', 1, 0, 1),
('purrfect_parfaitl', 'Purrfect parfait', 1, 0, 1),
('cat_macaroon_brown', 'Cat macaroon brown', 1, 0, 1),
('cat_macaroon_green', 'Cat macaroon green', 1, 0, 1),
('cat_macaroon_pink', 'Cat macaroon pink', 1, 0, 1),
('cat_macaroon_turquoise', 'Cat macaroon turquoise', 1, 0, 1),
('brown_dye', 'Brown dye', 1, 0, 1),
('pink_dye', 'Pink dye', 1, 0, 1),
('green_dye', 'Cat macaroon turquoise', 1, 0, 1),
('turquoise_dye', 'Turquoise dye', 1, 0, 1);
('plate', 'Plate', 1, 0, 1);
('cup', 'Cup', 1, 0, 1);
('cup_dirty', 'Cup dirty', 1, 0, 1);
('plate_dirty', 'Plate dirty', 1, 0, 1);
('ice', 'Ice', 1, 0, 1);

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

3. Add Images to your inventory
    if your are using esx_inventory then 
    esx_inventoryhud > html > images
    Paste images from folder images to esx_inventoryhud > html > images

4. add ensure drc_uwucafe into your server.cfg (make sure to start it after ox_lib and your target system!)

5. Enjoy your new UWU cafe script from DRC SCRIPTS!
