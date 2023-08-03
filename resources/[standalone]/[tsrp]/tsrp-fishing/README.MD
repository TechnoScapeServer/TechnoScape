# Made By: Tkiljoy

# GuideLines:
**You May NOT Repost This Script On ANY platform Without Our Written Consent To Do So.**
**You May NOT Take This Script And Say The Contents Are Yours And You Made It.**

# Dependencies
* [QBCore-Framework] https://github.com/qbcore-framework
* [QB-Target] https://github.com/BerkieBb/qb-target
* [skillbar] https://github.com/lIAM231/skill-bar

# How To Install:

**1:Before Starting tk-fishing You Must Add The Items First, To Do So Go Into [qb]/qb-core/shared/items.lua**
**And Paste The Following**
```lua
	--Fishing Rods
	["homemadefishingrod"] 				 = {["name"] = "homemadefishingrod", 			    		["label"] = "Homemade Fishing Rod", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "rodt1.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = "A Fishing Rod Made Of Bamboo and String"},
	["cheapfishingrod"] 				 = {["name"] = "cheapfishingrod", 			    		    ["label"] = "Cheap Fishing Rod", 			    ["weight"] = 100, 		["type"] = "item", 		["image"] = "rodt2.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = "A Basic Fishing Rod"},
	["midtierfishingrod"] 				 = {["name"] = "midtierfishingrod", 			    		["label"] = "Mid-Tier Fishing Rod", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "rodt3.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = "A More Advanced Fishing Rod"},
	["hightierfishingrod"] 				 = {["name"] = "hightierfishingrod", 			    		["label"] = "High-Tier Fishing Rod", 			["weight"] = 100, 		["type"] = "item", 		["image"] = "rodt4.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = "A Luxury Fishing Rod"},
	["masterrod"] 				         = {["name"] = "masterrod", 			    		        ["label"] = "Master Rod", 			            ["weight"] = 100, 		["type"] = "item", 		["image"] = "rodt5.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = "The Best Fishing Rod Money Can Buy"},

	--Legal Fish(Pier)
	["rockfish"] 				         = {["name"] = "rockfish", 			    		            ["label"] = "Rockfish", 			            ["weight"] = 200, 		["type"] = "item", 		["image"] = "rockfish.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["californiahalibut"] 				 = {["name"] = "californiahalibut", 			    		["label"] = "California Halibut", 			    ["weight"] = 200, 		["type"] = "item", 		["image"] = "californiahalibut.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["jacksmelt"] 				         = {["name"] = "jacksmelt", 			    		        ["label"] = "JackSmelt", 			            ["weight"] = 200, 		["type"] = "item", 		["image"] = "jacksmelt.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["surfsmelt"] 				         = {["name"] = "surfsmelt", 			    		        ["label"] = "SurfSmelt", 			            ["weight"] = 200, 		["type"] = "item", 		["image"] = "surfsmelt.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["surfperch"] 				         = {["name"] = "surfperch", 			    		        ["label"] = "SurfPerch", 			            ["weight"] = 200, 		["type"] = "item", 		["image"] = "surfperch.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["halibut"] 				         = {["name"] = "halibut", 			    		            ["label"] = "Halibut", 			                ["weight"] = 200, 		["type"] = "item", 		["image"] = "halibut.png", 				["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["californiacorbina"] 				 = {["name"] = "californiacorbina", 			    		["label"] = "California Corbina", 			    ["weight"] = 200, 		["type"] = "item", 		["image"] = "californiacorbina.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["calicobass"] 				         = {["name"] = "calicobass", 			    		        ["label"] = "Calico Bass", 			            ["weight"] = 200, 		["type"] = "item", 		["image"] = "calicobass.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["mackeral"] 				         = {["name"] = "mackeral", 			    		            ["label"] = "Mackeral", 			            ["weight"] = 200, 		["type"] = "item", 		["image"] = "mackeral.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["barracuda"] 				         = {["name"] = "barracuda", 			    		        ["label"] = "Barracuda", 			            ["weight"] = 200, 		["type"] = "item", 		["image"] = "barracuda.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	
	--Legal Fish(Ocean)
	["whiteseabass"] 				     = {["name"] = "whiteseabass", 			    		        ["label"] = "White Seabass", 			        ["weight"] = 200, 		["type"] = "item", 		["image"] = "whiteseabass.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["sheephead"] 				         = {["name"] = "sheephead", 			    		        ["label"] = "Sheep Head", 			            ["weight"] = 200, 		["type"] = "item", 		["image"] = "sheephead.png", 	        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["yellowtail"] 				         = {["name"] = "yellowtail", 			    		        ["label"] = "Yellow Tail", 			            ["weight"] = 200, 		["type"] = "item", 		["image"] = "yellowtail.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["salmon"] 				             = {["name"] = "salmon", 			    		            ["label"] = "Salmon", 			                ["weight"] = 200, 		["type"] = "item", 		["image"] = "salmon.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["lingcod"] 				         = {["name"] = "lingcod", 			    		            ["label"] = "Ling Cod", 			            ["weight"] = 200, 		["type"] = "item", 		["image"] = "lingcod.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},

	--Illegal Fish(Ocean)
	["greenturtle"] 				     = {["name"] = "greenturtle", 			    		        ["label"] = "Green Turtle", 			        ["weight"] = 500, 		["type"] = "item", 		["image"] = "greenturtle.png", 		    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["leatherbackturtle"] 				 = {["name"] = "leatherbackturtle", 			    		["label"] = "Leatherback Turtle", 			    ["weight"] = 500, 		["type"] = "item", 		["image"] = "leatherbackturtle.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["oliveridleyturtle"] 				 = {["name"] = "oliveridleyturtle", 			    		["label"] = "Olive Ridley Turtle", 			    ["weight"] = 500, 		["type"] = "item", 		["image"] = "oliveridleyturtle.png", 	["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["schoolshark"] 				     = {["name"] = "schoolshark", 			    		        ["label"] = "School Shark", 			        ["weight"] = 1000, 		["type"] = "item", 		["image"] = "schoolshark.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["hornshark"] 				         = {["name"] = "hornshark", 			    		        ["label"] = "Horn Shark", 			            ["weight"] = 1200, 		["type"] = "item", 		["image"] = "hornshark.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["greatwhiteshark"] 				 = {["name"] = "greatwhiteshark", 			    		    ["label"] = "Great White Shark", 			    ["weight"] = 2000, 		["type"] = "item", 		["image"] = "greatwhiteshark.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["graywhale"] 				         = {["name"] = "graywhale", 			    		        ["label"] = "Gray Whale", 			            ["weight"] = 5000, 		["type"] = "item", 		["image"] = "graywhale.png", 	        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["bluewhale"] 				         = {["name"] = "bluewhale", 			    		        ["label"] = "Blue Whale", 			            ["weight"] = 5000, 		["type"] = "item", 		["image"] = "bluewhale.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["humpbackwhale"] 				     = {["name"] = "humpbackwhale", 			    		    ["label"] = "Hump Back Whale", 			        ["weight"] = 5000, 		["type"] = "item", 		["image"] = "humpbackwhale.png", 		["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},

	--Legal Bait
	["worms"] 				             = {["name"] = "worms", 			    		            ["label"] = "Worms", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "worms.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["minnows"] 				         = {["name"] = "minnows", 			    		            ["label"] = "Minnows", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "minnow.png", 	            ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["cricket"] 				         = {["name"] = "cricket", 			    		            ["label"] = "Cricket", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "cricket.png", 	            ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["grasshopper"] 				     = {["name"] = "grasshopper", 			    		        ["label"] = "Grass Hopper", 			        ["weight"] = 1, 		["type"] = "item", 		["image"] = "grasshopper.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["leech"] 				             = {["name"] = "leech", 			    		            ["label"] = "Leech", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "leech.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},

	--Illegal Bait
	["squid"] 				             = {["name"] = "squid", 			    		            ["label"] = "Squid", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "squid.png", 		        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["cowcarcass"] 				         = {["name"] = "cowcarcass", 			    		        ["label"] = "Cow Carcass", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "cowcarcass.png", 	        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["pigcarcass"] 				         = {["name"] = "pigcarcass", 			    		        ["label"] = "Pig Carcass", 			            ["weight"] = 1, 		["type"] = "item", 		["image"] = "pigcarcass.png", 	        ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["seaweed"] 				         = {["name"] = "seaweed", 			    		            ["label"] = "Seaweed", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "seaweed.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
	["octopus"] 				         = {["name"] = "octopus", 			    		            ["label"] = "Octopus", 			                ["weight"] = 1, 		["type"] = "item", 		["image"] = "octopus.png", 			    ["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,	["description"] = ""},
```

**2: Add The Images in the image folder to [qb]/[lj-inventory]/html/images**

**3: Add The Metadata in [qb]/qb-core/server/player.lua**
```lua
	--Underneathe This Line PlayerData.metadata['jobrep']['hotdog'] = PlayerData.metadata['jobrep']['hotdog'] or 0
	--Fishing
    PlayerData.metadata['fishingrep'] = PlayerData.metadata['fishingrep'] or 1
	PlayerData.metadata['caughtfish'] = PlayerData.metadata['caughtfish'] or 0
```

**4: Paste tk-fishing In Your a Folder In Resources And Ensure It To Your Server.cfg** 

**5: The Config is mostly configurable the only things you cant change are:**
    **1) The Fishing Rods(This is due to the fishing rods playing a part in the difficulty of fishing)**
    **2) The Different Types of Bait (This is due to the bait determining what type of fish you get)**
    **3) The Sell Locations and Shop Locations (This is due to QB-Target and having npcs in certain locations)**
**6: However You can change:**
    **1) The Types of Fish**
    **2) The Fishing Zones**
    **3) The Prices that the fish sell for**

# THANK YOU!
