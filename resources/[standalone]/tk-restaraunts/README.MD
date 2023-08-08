# Made By: Tkiljoy

# GuideLines:
**You May NOT Repost This Script On ANY platform Without Our Written Consent To Do So.**
**You May NOT Take This Script And Say The Contents Are Yours And You Made It.**

# Dependencies
* [QBCore-Framework] https://github.com/qbcore-framework
* [QB-Target] https://github.com/BerkieBb/qb-target

# How To Install:

**1:Before Starting tk-restarauntcreator Make Sure You Add Whatever Optional Items You Want!, To Do So Go Into [qb]/qb-core/shared/items.lua**
**And Paste The Following**
```lua
    --Peckerwood
    ["peckerwood_crate"] 				         = {["name"] = "peckerwood_crate", 			    		            ["label"] = "Peckerwood Crate", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "crate.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["pepperoni_pizza"] 				         = {["name"] = "pepperoni_pizza", 			    		            ["label"] = "Pepperoni Pizza", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "pepperonipizza.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["shredded_mozzcheese"] 				         = {["name"] = "shredded_mozzcheese", 			    		            ["label"] = "Shredded Mozzarella Cheese", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "mozzcheese.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["pizzadough"] 				         = {["name"] = "pizzadough", 			    		            ["label"] = "Pizza Dough", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "pizzadough.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["pepperoni"] 				         = {["name"] = "pepperoni", 			    		            ["label"] = "Pepperoni", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "pepperoni.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["pizzasauce"] 				         = {["name"] = "pizzasauce", 			    		            ["label"] = "Pizza Sauce", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "pizzasauce.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["frozen_wings"] 				         = {["name"] = "frozen_wings", 			    		            ["label"] = "Frozen Wings", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "frozen_wings.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["hot_sauce"] 				         = {["name"] = "hot_sauce", 			    		            ["label"] = "Hot Sauce", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "hotsauce.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["hot_wings"] 				         = {["name"] = "hot_wings", 			    		            ["label"] = "Hot Wings", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "hotwings.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["egg"] 				         = {["name"] = "egg", 			    		            ["label"] = "Egg", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "egg.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["mayonnaise"] 				         = {["name"] = "mayonnaise", 			    		            ["label"] = "Mayonnaise", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "mayonnaise.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["panko_bread_crumbs"] 				         = {["name"] = "panko_bread_crumbs", 			    		            ["label"] = "Panko Bread Crumbs", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "pankobreadcrumbs.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["crabmeat"] 				         = {["name"] = "crabmeat", 			    		            ["label"] = "Crab Meat", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "crabmeat.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["crabcake"] 				         = {["name"] = "crabcake", 			    		            ["label"] = "Crab Cake", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "crabcake.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["franks"] 				         = {["name"] = "franks", 			    		            ["label"] = "Franks", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "franks.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["hotdogbun"] 				         = {["name"] = "hotdogbun", 			    		            ["label"] = "Hot Dog Bun", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "hotdogbun.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["ketchup"] 				         = {["name"] = "ketchup", 			    		            ["label"] = "Ketchup", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "ketchup.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["mustard"] 				         = {["name"] = "mustard", 			    		            ["label"] = "Mustard", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "mustard.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["hotdog"] 				         = {["name"] = "hotdog", 			    		            ["label"] = "Hot Dog", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "hotdog.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["groundbeef"] 				         = {["name"] = "groundbeef", 			    		            ["label"] = "Ground Beef", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "groundbeef.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["cooked_burgerpatty"] 				         = {["name"] = "cooked_burgerpatty", 			    		            ["label"] = "Cooked Burger Patty", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "cookedburgerpatty.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["hamburgerbuns"] 				         = {["name"] = "hamburgerbuns", 			    		            ["label"] = "Hamburger Buns", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "hamburgerbuns.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["cheese"] 				         = {["name"] = "cheese", 			    		            ["label"] = "Cheese", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "cheese.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["burger"] 				         = {["name"] = "burger", 			    		            ["label"] = "Burger", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "burger.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["frozen_onionrings"] 				         = {["name"] = "burger", 			    		            ["label"] = "Burger", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "burger.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["frozen_mozzarellasticks"] 				         = {["name"] = "frozen_mozzarellasticks", 			    		            ["label"] = "Frozen Mozzarella Sticks", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "frozenmozzarellasticks.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["sampler"] 				         = {["name"] = "sampler", 			    		            ["label"] = "Sampler", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "sampler.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    --Drinks
    ["rum"] 				         = {["name"] = "rum", 			    		            ["label"] = "Rum", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "rum.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["coke"] 				         = {["name"] = "coke", 			    		            ["label"] = "Coke", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "coke.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["rumandcoke"] 				         = {["name"] = "rumandcoke", 			    		            ["label"] = "Rum and Coke", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "rumandcoke.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["orangecrush"] 				         = {["name"] = "orangecrush", 			    		            ["label"] = "Orange Crush", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "orangecrush.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["vodka"] 				         = {["name"] = "vodka", 			    		            ["label"] = "Vodka", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "vodka.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["tomatojuice"] 				         = {["name"] = "tomatojuice", 			    		            ["label"] = "Tomato Juice", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "tomatojuice.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["bloodymary"] 				         = {["name"] = "bloodymary", 			    		            ["label"] = "Bloody Mary", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "bloodymary.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["nattyboe"] 				         = {["name"] = "nattyboe", 			    		            ["label"] = "Natty Boe", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "nattyboe.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    ["oldbaychips"] 				         = {["name"] = "oldbaychips", 			    		            ["label"] = "Old Bay Chips", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "oldbaychips.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
    --Shared Items
    ["ice"] 				         = {["name"] = "ice", 			    		            ["label"] = "Ice", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "ice.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},

    --Jim-Bakery
    ["bakery_crate"] 				         = {["name"] = "bakery_crate", 			    		            ["label"] = "Bakery Crate", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "crate.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["chocolatesyrup"] 				= {["name"] = "chocolatesyrup",  	     	["label"] = "Chocolate Syrup",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "chocolatesyrup.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["jimeggs"] 					= {["name"] = "jimeggs",  	    			["label"] = "Eggs",						["weight"] = 100, 		["type"] = "item", 		["image"] = "jimeggs.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["chocolate"] 				 	= {["name"] = "chocolate",  		     	["label"] = "Chocolate",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "chocolate.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["sugar"] 						= {["name"] = "sugar",  			     	["label"] = "Sugar",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "sugar.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["flour"] 						= {["name"] = "flour",  			     	["label"] = "Flour",					["weight"] = 100, 		["type"] = "item", 		["image"] = "flour.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["dough"] 						= {["name"] = "dough",  	     			["label"] = "Dough",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "pizzadough.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 50) },
	["heavycream"] 					= {["name"] = "heavycream",  	     		["label"] = "Heavy Cream",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "heavycream.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(40, 50) },
	["icecream"] 					= {["name"] = "icecream",					["label"] = "Ice Cream",				["weight"] = 500,		["type"] = "item",		["image"] = "burger-icecream.png",			["unique"] = false, 	["useable"] = true,	["shouldClose"] = true,	["combinable"] = nil,	["description"] = ""},
	["milk"] 						= {["name"] = "milk",						["label"] = "Milk",						["weight"] = 500,		["type"] = "item",		["image"] = "burger-milk.png",				["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "", },
	["lettuce"] 	 			 	= {["name"] = "lettuce",       				["label"] = "Lettuce",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "lettuce.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Some big taco brother"},
	["cheddar"] 					= {["name"] = "cheddar",					["label"] = "Cheddar Slice",			["weight"] = 100,		["type"] = "item",		["image"] = "cheddar.png",					["unique"] = false, 	["useable"] = true,	["shouldClose"] = true,	["combinable"] = nil,	["description"] = "Slice of Cheese"},
	["ham"] 						= {["name"] = "ham",  	     				["label"] = "Ham",						["weight"] = 100, 		["type"] = "item", 		["image"] = "ham.png", 						["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", },
	["strawberry"] 					= {["name"] = "strawberry",  			    ["label"] = "Strawberry",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "strawberry.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", },
	["vanillaextract"] 				= {["name"] = "vanillaextract",				["label"] = "Vanilla Extract",			["weight"] = 500,		["type"] = "item",		["image"] = "vanillaextract.png",			["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "", ['thirst'] = math.random(35, 54) },
	["cocoapowder"] 				= {["name"] = "cocoapowder",				["label"] = "Cocoa Powder",				["weight"] = 500,		["type"] = "item",		["image"] = "cocoapowder.png",				["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "", ['hunger'] = math.random(5, 10) },
	["icing"] 						= {["name"] = "icing",						["label"] = "Icing",					["weight"] = 500,		["type"] = "item",		["image"] = "icing.png",					["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "", ['thirst'] = math.random(35, 54) },
	["tbbread"] 					= {["name"] = "tbbread",					["label"] = "Loaf of Bread",			["weight"] = 500,		["type"] = "item",		["image"] = "tbbread.png",					["unique"] = true, 		["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "", ['hunger'] = math.random(35, 54) },
	["tbwhitebread"] 				= {["name"] = "tbwhitebread",				["label"] = "White Bread Roll",			["weight"] = 500,		["type"] = "item",		["image"] = "tbwhitebread.png",				["unique"] = true, 		["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "", ['hunger'] = math.random(10, 20) },
	["tbbrownbread"] 				= {["name"] = "tbbrownbread",				["label"] = "Brown Bread Roll",			["weight"] = 500,		["type"] = "item",		["image"] = "tbbrownbread.png",				["unique"] = true, 		["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "", ['hunger'] = math.random(10, 20) },
	["breadslice"] 					= {["name"] = "breadslice",					["label"] = "Slice of Bread",			["weight"] = 50,		["type"] = "item",		["image"] = "breadslice.png",				["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "", ['hunger'] = math.random(10, 20) },

	["milkshake"] 					= {["name"] = "milkshake",					["label"] = "Milkshake",				["weight"] = 200,		["type"] = "item",		["image"] = "burger-milkshake.png",			["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,	 	["combinable"] = nil,	["description"] = "", ['thirst'] = math.random(35, 54) },
	["strawberrymilkshake"] 		= {["name"] = "strawberrymilkshake",		["label"] = "Strawberry Milkshake",		["weight"] = 200,		["type"] = "item",		["image"] = "strawberrymilkshake.png",		["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,	 	["combinable"] = nil,	["description"] = "", ['thirst'] = math.random(35, 54) },
	["chocolatemilkshake"] 			= {["name"] = "chocolatemilkshake",			["label"] = "Chocolate Milkshake",		["weight"] = 200,		["type"] = "item",		["image"] = "chocolatemilkshake.png",		["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,	 	["combinable"] = nil,	["description"] = "", ['thirst'] = math.random(35, 54) },
	--SODA
	["sprunk"] 						= {["name"] = "sprunk",  	    	 		["label"] = "Sprunk",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunk.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["sprunklight"] 				= {["name"] = "sprunklight",  	    	 	["label"] = "Sprunk Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "sprunklight.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecola"] 						= {["name"] = "ecola",  	    	 		["label"] = "eCola",		 			["weight"] = 100, 		["type"] = "item", 		["image"] = "ecola.png", 					["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },
	["ecolalight"] 					= {["name"] = "ecolalight",  	    	 	["label"] = "eCola Light",		 		["weight"] = 100, 		["type"] = "item", 		["image"] = "ecolalight.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['thirst'] = math.random(20, 30) },

	["tbbirthdaycake"] 				= {["name"] = "tbbirthdaycake",  		    ["label"] = "Birthday Cake",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "tbbirthdaycake.png", 			["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 60) },
	["tbcake"] 						= {["name"] = "tbcake",  		   			["label"] = "Cake",	 					["weight"] = 200, 		["type"] = "item", 		["image"] = "tbcake.png", 					["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40, 60) },
	["tbchoccake"] 				 	= {["name"] = "tbchoccake",  		     	["label"] = "Chocolate Cake",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "tbchoccake.png", 				["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(40,60) },
	["tbcookie"] 				 	= {["name"] = "tbcookie",  		     		["label"] = "Cookie",	 				["weight"] = 50, 		["type"] = "item", 		["image"] = "tbcookie.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(10, 20) },
	["tbbrownie"] 				 	= {["name"] = "tbbrownie",  		     	["label"] = "Brownie",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "tbbrownie.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["tbcroissant"] 			 	= {["name"] = "tbcroissant",  		     	["label"] = "Croissant",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "tbcroissant.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["tbchoccroiss"] 			 	= {["name"] = "tbchoccroiss",  		     	["label"] = "Bloody Cross",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "tbblcroiss.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["tbcupcake"] 				 	= {["name"] = "tbcupcake",  		     	["label"] = "CupCake",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "tbcupcake.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["tbsweetroll"] 				= {["name"] = "tbsweetroll",  		     	["label"] = "Sweet Roll",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "tbsweetroll.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "", ['hunger'] = math.random(20, 30) },
	["tbdonut"] 					= {["name"] = "tbdonut",					["label"] = "Donut",					["weight"] = 500,		["type"] = "item",		["image"] = "tbdonut.png",					["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "", ['hunger'] = math.random(20,30) },
	["tblongjohn"] 					= {["name"] = "tblongjohn",					["label"] = "Long John",				["weight"] = 500,		["type"] = "item",		["image"] = "tblongjohn.png",				["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "", ['hunger'] = math.random(35, 54) },
	["tbcakebase"] 					= {["name"] = "tbcakebase",					["label"] = "Cake Base",				["weight"] = 500,		["type"] = "item",		["image"] = "tbcakebase.png",				["unique"] = true, 		["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "", ['hunger'] = math.random(35, 54) },
	--BurgerShot
	["potato"] 						 = {["name"] = "potato",					["label"] = "Potatoes",					["weight"] = 500,		["type"] = "item",		["image"] = "potatoes.png",				["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Bag of Potatos"},
	["slicedpotato"] 				 = {["name"] = "slicedpotato",				["label"] = "Sliced Potatoes",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-slicedpotato.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Sliced Potato"},
	["slicedonion"] 				 = {["name"] = "slicedonion",				["label"] = "Sliced Onions",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-slicedonion.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Sliced Onion"},
	["icecream"] 					 = {["name"] = "icecream",					["label"] = "Ice Cream",				["weight"] = 500,		["type"] = "item",		["image"] = "burger-icecream.png",		["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Ice Cream."},
	["milk"] 						 = {["name"] = "milk",						["label"] = "Milk",						["weight"] = 500,		["type"] = "item",		["image"] = "burger-milk.png",			["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,		["combinable"] = nil,	["description"] = "Carton of Milk", ['thirst'] = math.random(35, 54) },
	["lettuce"] 	 			 	 = {["name"] = "lettuce",       			["label"] = "Lettuce",	 				["weight"] = 100, 		["type"] = "item", 		["image"] = "lettuce.png", 				["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,   	["combinable"] = nil,   ["description"] = "Some big taco brother"},
	["onion"] 						 = {["name"] = "onion",						["label"] = "Onion",					["weight"] = 500,		["type"] = "item",		["image"] = "burger-onion.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "An onion"},
	["frozennugget"] 				 = {["name"] = "frozennugget",				["label"] = "Frozen Nuggets",			["weight"] = 500,		["type"] = "item",		["image"] = "burger-frozennugget.png",	["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Bag of Frozen Nuggets"},
	["cheddar"] 					 = {["name"] = "cheddar",					["label"] = "Cheddar Slice",			["weight"] = 500,		["type"] = "item",		["image"] = "cheddar.png",				["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Slice of Cheese"},
	["burgerbun"] 		 			 = {["name"] = "burgerbun",       		    ["label"] = "Burger Bun",	 			["weight"] = 100, 		["type"] = "item", 		["image"] = "burgerbun.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "Some big burger brother"},
	["burgerpatty"] 				 = {["name"] = "burgerpatty",				["label"] = "Burger Patty",				["weight"] = 500,		["type"] = "item",		["image"] = "burgerpatty.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Raw Patty"},
	["burgermeat"] 				 	 = {["name"] = "burgermeat",				["label"] = "Burger Meat",				["weight"] = 500,		["type"] = "item",		["image"] = "burgermeat.png",			["unique"] = false, 	["useable"] = false,	["shouldClose"] = false,	["combinable"] = nil,	["description"] = "Cooked Burger Meat"},
	["milkshake"] 					 = {["name"] = "milkshake",					["label"] = "Milkshake",				["weight"] = 500,		["type"] = "item",		["image"] = "burger-milkshake.png",		["unique"] = false, 	["useable"] = true,		["shouldClose"] = true,	 	["combinable"] = nil,	["description"] = "BurgerShot Milkshake", ['thirst'] = math.random(35, 54) },
	["shotnuggets"] 				 = {["name"] = "shotnuggets", 			  	["label"] = "Shot Nuggets", 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-shotnuggets.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Burgershot Nuggets", ['hunger'] = math.random(40, 50) },
	["shotrings"] 				 	 = {["name"] = "shotrings", 			  	["label"] = "Ring Shots", 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-shotrings.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	   	["combinable"] = nil,   ["description"] = "Burgershot Onion Rings", ['hunger'] = math.random(40, 50) },
	["heartstopper"] 			 	 = {["name"] = "heartstopper",       		["label"] = "HeartStopper",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-heartstopper.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Heartstopper", ['hunger'] = math.random(50, 60) },
	["shotfries"] 		 			 = {["name"] = "shotfries",       			["label"] = "Shot Fries",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-fries.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Shot Fries", ['hunger'] = math.random(40, 50) },
	["moneyshot"] 		 			 = {["name"] = "moneyshot",       			["label"] = "Money Shot",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-moneyshot.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Money Shot", ['hunger'] = math.random(40, 50) },
	["meatfree"] 		 			 = {["name"] = "meatfree",       			["label"] = "Meat Free",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-meatfree.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Meat Free", ['hunger'] = math.random(40, 50) },
	["bleeder"] 		 			 = {["name"] = "bleeder",       			["label"] = "The Bleeder",	 			["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-bleeder.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "The Bleeder", ['hunger'] = math.random(40, 50) },
	["bscoffee"] 		 			 = {["name"] = "bscoffee",       			["label"] = "BurgerShot Coffee",	 	["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-coffee.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Coffee", ['thirst'] = math.random(35, 54) },
	["bscoke"] 		 				 = {["name"] = "bscoke",       				["label"] = "BurgerShot Coke",	 		["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-softdrink.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Cola", ['thirst'] = math.random(35, 54) },
	["torpedo"] 		 			 = {["name"] = "torpedo",       			["label"] = "Torpedo",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-torpedo.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Torpedo", ['hunger'] = math.random(40, 50) },
	["rimjob"] 		 				 = {["name"] = "rimjob",  	     			["label"] = "Rim Job",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-rimjob.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Donut", ['hunger'] = math.random(40, 50) },
	["creampie"] 		 			 = {["name"] = "creampie",  	     		["label"] = "Creampie",	 				["weight"] = 200, 		["type"] = "item", 		["image"] = "burger-creampie.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Apple Pie", ['hunger'] = math.random(40, 50) },
	["cheesewrap"] 					 = {["name"] = "cheesewrap", 				["label"] = "BS Cheese Wrap", 	     	["weight"] = 150, 		["type"] = "item", 		["image"] = "burger-chickenwrap.png", 	["unique"] = false,   	["useable"] = true,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Cheese Wrap", ['hunger'] = math.random(40, 50) },
	["chickenwrap"] 				 = {["name"] = "chickenwrap", 				["label"] = "BS Goat Cheese Wrap", 	    ["weight"] = 150, 		["type"] = "item", 		["image"] = "burger-goatwrap.png", 		["unique"] = false,   	["useable"] = true,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "BurgerShot Goat Cheese Wrap", ['hunger'] = math.random(40, 50)},
	["murderbag"] 					 = {["name"] = "murderbag", 				["label"] = "Murder Bag", 	   			["weight"] = 0, 		["type"] = "item", 		["image"] = "burgerbag.png", 			["unique"] = true,   	["useable"] = true,   	["shouldClose"] = true,   	["combinable"] = nil,   ["description"] = "Grab a Murder Bag of Burgers", },
```

**2:Add The Job To Do So Go Into [qb]/qb-core/shared/jobs.lua**
**And Paste The Following**
```lua
    ['peckerwood'] = {
		label = 'Peckerwood',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Bartender',
                payment = 10
            },
			['1'] = {
                name = 'Chef',
                payment = 20
            },
            ['2'] = {
                name = 'Owner',
				isboss = true,
                payment = 30
            },
        },
	},
    --Jims Jobs
    ['bakery'] = {
		label = 'Bakery',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},

    ['insertcoin'] = {
		label = 'Insert Coin',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
	['yellowjack'] = {
		label = 'Yellow Jack',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
	['cyberbar'] = {
		label = 'Cyber Bar',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
	['irishpub'] = {
		label = 'Irish Pub',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
	['splitsides'] = {
		label = 'Split Sides',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
	['bahama'] = {
		label = 'Bahama Mamas',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
	['limeys'] = {
		label = 'Limey's',
		defaultDuty = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
	['burgershot'] = {
		label = 'BurgerShot',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = { name = 'Recruit', payment = 50 },
			['1'] = { name = 'Novice', payment = 75 },
			['2'] = { name = 'Experienced', payment = 100 },
			['3'] = { name = 'Advanced', payment = 125 },
			['4'] = { name = 'Manager', isboss = true, payment = 150 },
        },
	},
```

**4: Add The Images in the image folder to [qb]/lj-inventory/html/images**

**5: Paste tk-restarauntcreator In Your a Folder In Resources And Ensure It To Your Server.cfg** 
