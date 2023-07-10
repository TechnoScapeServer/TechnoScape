languages = {}

-------------------------------- EN 

languages['en'] = {
    -- ProgressBars --
    ['prog_prop_upgrade'] = "Upgrading..",
    ['prog_prop_repair'] = "Repairing..",
    ['prog_plant_c4"'] = "Planting c4..",
    ['prog_health_regen_bed'] = "Regenerating health...",
    ['prog_health_regen_sofa'] = "Regenerating health...",
    ['prog_prop_remove'] = "Removing..",
    ['prog_add_fuel'] = "Adding fuel..",
    ['prog_prop_build'] = "Building...",

    -- No Target Texts (only edit this if you are not using a target system) -- 
    -- Information when interacting with a prop from a specific Type
    ["notarget_doors"] = 'Click ~INPUT_CONTEXT~ to interact with door \nPress ~INPUT_CONTEXT~ for 2 seconds to open door menu',
    ["notarget_windows"] = 'Click ~INPUT_CONTEXT~ to interact with window \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_walls"] = 'Press ~INPUT_CONTEXT~ for 2 seconds to open wall menu',
    ["notarget_bigwall"] = 'Press ~INPUT_CONTEXT~ for 2 seconds to open big wall menu',
    ["notarget_foundations"] = 'Press ~INPUT_CONTEXT~ for 2 seconds to open foundation menu',
    ["notarget_ceiling"] = 'Press ~INPUT_CONTEXT~ for 2 seconds to open ceiling menu',
    ["notarget_pillar"] = 'Press ~INPUT_CONTEXT~ for 2 seconds to open pillar menu',
    ["notarget_cook"] = 'Click ~INPUT_CONTEXT~ to interact with campfire \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_storages"] = 'Click ~INPUT_CONTEXT~ to open storage \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_beds"] = 'Click ~INPUT_CONTEXT~ to interact with bed \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_gate"] = 'Click ~INPUT_CONTEXT~ to interact with gate \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_generator"] = 'Click ~INPUT_CONTEXT~ to interact with generator \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_recycle"] = 'Click ~INPUT_CONTEXT~ to use recycle machine \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_crafting"] ='Click ~INPUT_CONTEXT~ to craft \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_light"] ='Click ~INPUT_CONTEXT~ to interact with lamp \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_biggate"] ='Click ~INPUT_CONTEXT~ to interact with big gate \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_biggateway"] ='Click ~INPUT_CONTEXT~ to interact with big gate \nPress ~INPUT_CONTEXT~ for 2 seconds to open gate frame menu',
    ["notarget_doorway"] ='Click ~INPUT_CONTEXT~ to interact with door \nPress ~INPUT_CONTEXT~ for 2 seconds to open door frame menu',
    ["notarget_deadStorage"] ='Click ~INPUT_CONTEXT~ to interact with bag \nPress ~INPUT_CONTEXT~ for 2 seconds to delete bag',
    -- Press info --
    ["notarget_pressingText"] ="Pressing ~INPUT_CONTEXT~ to open Menu ",

    -- Tutorial Text
    ["tutorial_text"] = 'Press ~INPUT_CELLPHONE_LEFT~ or ~INPUT_CELLPHONE_RIGHT~ ro rotate, ~INPUT_CELLPHONE_UP~ or ~INPUT_CELLPHONE_DOWN~ to move up or down,  ~INPUT_FRONTEND_RRIGHT~ to cancel or ~INPUT_CELLPHONE_SELECT~ to accept',
   
    -- General Locales --
    ["object_in_that_coords"] = "There is already an object in that coords",
    ["need_door_frame"] = "You need a door Frame",
    ["no_permission"] = "You have no permission.",
    ["no_permission_build"] = "You have no permission to build here",
    ["no_item"] = "You don't have this item",
    ["base_repaired"] = "Base repaired",
    ["object_repaired"] = "Object Repaired",
    ["no_space"] = "Not enought inventory space",
    ["no_build_zone"] = "You can't build in this zone",
    ["need_window_frame"] = "You need a window frame",
    ["need_gate_frame"] = "You need a gate frame",
    ["foundation_up"] = "The foundation needs to be up",
    ["foundation_down"] = "The foundation needs to be down",
    ["need_pillars"] = "You need atleast 2 pillars or a wall to make a ceiling",
    ["light_close"] = "There is already a light close to this place",
    ["to_close_foundation"] = "You are too close to a foundation",
    ["no_under_ground"] = "You can't build under the ground",
    ["to_close"] = "Too close to another object",
    ["need_big_gateway"] = "You need a big gate frame",
    ["no_foundation"] = "There is no foundation or ceiling",
    ["no_fuel"] = "You have no fuel.",
    ["tank_full"] = "The tank is full",
    ["you_added"] = "You added ",
    ["l_fuel"] = "L of fuel",
    ["code_set"] = "Code Set to ",
    ["turn_off"] = "Turned OFF",
    ["turn_on"] = "Turned ON",
    ["no_fuel"] = "Not enought fuel",
    ["wrong_code"] = "Wrong Code",
    ["no_advanced"] = "No advanced interaction.",
    ["no_c4"] = "You need explosives",
    ["no_explode"] = "Can't explode this",
    ["need_items"] = "Needed Items:",
    ["repair_success"] = "Repair Success",
    ["no_gate"] = "There is no gate to interact",
    ["no_door"] = "There is no door to interact",
    ["no_electricity"] = "There is no electricity",
    ["no_player_id"] = "No player with this ID online",
    ["permission_added"] = "Permission added",
    ["permission_removed"] = "Permission removed",
    ["perm_clear"] = "Permissions Cleared",
    ["interact_with"] = "Interact with ",
    ["open"] = "Open ",
    ["settings"] = " settings",
    ["no_interactions"] = "You can't interact with this",
    ["delete"] = "Delete ",
    ["need_codelock"] = "You need a Code Lock item",
    ["use_c4"] = "Use c4 on this ",
    ["to_much_props"] = "To much props in this zone",
    ["incorrect_shape"] = "Incorrect shape",
    ["build_limit_1"] = "You reached your building limit",
    ["bed_limit"] = "You can Only have One Bed",

    -- CREW --

    ["crew_menu"] = "Crew Menu",
    ["crew_playerList"] = "List of Players",
    ["crew_manage"] = "Crew Management",
    ["crew_invitesList"] = "Invites List",
    ["crew_invite_header"] = "INVITE PLAYERS",
    ["crew_invite_desc"] = "click to invite players to crew",
    ["crew_manage_header"] = "MANAGE PLAYERS",
    ["crew_manage_desc"] = "click to manage crew",
    ["crew_delete_header"] = "DELETE CREW",
    ["crew_delete_desc"] = "click to delete crew",
    ["crew_leave_header"] = "LEAVE CREW",
    ["crew_leave_desc"] = "click to leave crew",
    ["crew_invites_header"] = "OPEN CREW INVITES",
    ["crew_invites_desc"] = "click to open invites",
    ["crew_create_header"] = "Create Crew",
    ["crew_create_desc"] = "click to create Crew",
    ["crew_join"] = "click join crew",
    ["crew_no_invites"] = "click join crew",
    ["crew_remove_player"] = "click remove this player from crew",
    ["crew_no_remove_you"] = "You can't remove yourself",
    ["crew_invite_player"] = "click to invite this player to crew",
    ["crew_no_players"] = "No players around you",
    ["crew_created"] = "You created a Crew",
    ["crew_deleted"] = "Your Crew got Deleted",
    ["crew_player_on_crew"] = "Player is already part of a Crew",
    ["crew_crew_limit"] = "You reached the crew limit",
    ["crew_new_invite"] = "You got a new crew invite",
    ["crew_you_invited"] = "You invited ",
    ["crew_to_crew"] = " to your Crew",
    ["crew_already_invited"] = "You already invited this player",
    ["crew_no_crew"] = "You have no crew",
    ["crew_limit_reached"] = "Crew reached the limit of members",
    ["crew_invite_accepted"] = "Invite Accepted",
    ["crew_new_to_crew"] = " is now part of your Crew",
    ["crew_joined"] = "You joined crew ",
    ["crew_you_left"] = "You left your Crew",
    ["crew_left_crew"] = ' left the Crew',
    ["crew_player_removed"] = "Player removed from Crew",
    ["crew_you_removed"] = "You got removed from your crew",

    -- code limit
    ["wrong_code_limit"] = "You reached the wrong code limit",

}

-------------------------------- Nederlands, Dutch, Netherlands 

languages['nl'] = {
    -- ProgressBars --
    ['prog_prop_upgrade'] = "Upgraden..",
    ['prog_prop_repair'] = "Repareren..",
    ['prog_plant_c4"'] = "c4 plaatsen..",
    ['prog_health_regen_bed'] = "Rust pakken...",
    ['prog_health_regen_sofa'] = "Rust pakken...",
    ['prog_prop_remove'] = "Verwijderen..",
    ['prog_add_fuel'] = "Benzine bijvullen..",
    ['prog_prop_build'] = "Bouwen...",

    -- Geen target text, niet vertaald. - No target, we didn't use this so we didn't translate it. (only edit this if you are not using a target system) -- 
    -- sInformation when interacting with a prop from a specific Type
    ["notarget_doors"] = 'Click ~INPUT_CONTEXT~ to interact with door \nPress ~INPUT_CONTEXT~ for 2 seconds to open door menu',
    ["notarget_windows"] = 'Click ~INPUT_CONTEXT~ to interact with window \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_walls"] = 'Press ~INPUT_CONTEXT~ for 2 seconds to open wall menu',
    ["notarget_bigwall"] = 'Press ~INPUT_CONTEXT~ for 2 seconds to open big wall menu',
    ["notarget_foundations"] = 'Press ~INPUT_CONTEXT~ for 2 seconds to open foundation menu',
    ["notarget_ceiling"] = 'Press ~INPUT_CONTEXT~ for 2 seconds to open ceiling menu',
    ["notarget_pillar"] = 'Press ~INPUT_CONTEXT~ for 2 seconds to open pillar menu',
    ["notarget_cook"] = 'Click ~INPUT_CONTEXT~ to interact with campfire \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_storages"] = 'Click ~INPUT_CONTEXT~ to open storage \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_beds"] = 'Click ~INPUT_CONTEXT~ to interact with bed \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_gate"] = 'Click ~INPUT_CONTEXT~ to interact with gate \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_generator"] = 'Click ~INPUT_CONTEXT~ to interact with generator \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_recycle"] = 'Click ~INPUT_CONTEXT~ to use recycle machine \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_crafting"] ='Click ~INPUT_CONTEXT~ to craft \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_light"] ='Click ~INPUT_CONTEXT~ to interact with lamp \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_biggate"] ='Click ~INPUT_CONTEXT~ to interact with big gate \nPress ~INPUT_CONTEXT~ for 2 seconds to open menu',
    ["notarget_biggateway"] ='Click ~INPUT_CONTEXT~ to interact with big gate \nPress ~INPUT_CONTEXT~ for 2 seconds to open gate frame menu',
    ["notarget_doorway"] ='Click ~INPUT_CONTEXT~ to interact with door \nPress ~INPUT_CONTEXT~ for 2 seconds to open door frame menu',
    ["notarget_deadStorage"] ='Click ~INPUT_CONTEXT~ to interact with bag \nPress ~INPUT_CONTEXT~ for 2 seconds to delete bag',
    -- Press info --
    ["notarget_pressingText"] ="Pressing ~INPUT_CONTEXT~ to open Menu ",

    -- Tutorial Text
    ["tutorial_text"] = 'Druk op ~INPUT_CELLPHONE_LEFT~ of ~INPUT_CELLPHONE_RIGHT~ om te draaien, ~INPUT_CELLPHONE_UP~ of ~INPUT_CELLPHONE_DOWN~ om omhoog/omlaag te verplaatsen, ~INPUT_FRONTEND_RRIGHT~ om te annuleren of ~INPUT_CELLPHONE_SELECT~ om te plaatsen',
   
    -- General Locales --
    ["object_in_that_coords"] = "Er bevindt zich al een object op die coördinaten",
    ["need_door_frame"] = "Je hebt een deurframe nodig",
    ["no_permission"] = "Je hebt geen toestemming",
    ["no_permission_build"] = "Je hebt geen toestemming om hier te bouwen",
    ["no_item"] = "Je hebt dit item niet",
    ["base_repaired"] = "Basis gerepareerd",
    ["object_repaired"] = "Object gerepareerd",
    ["no_space"] = "Niet genoeg inventarisruimte",
    ["no_build_zone"] = "Je kunt hier niet bouwen",
    ["need_window_frame"] = "Je hebt een raamframe nodig",
    ["need_gate_frame"] = "Je hebt een poortframe nodig",
    ["foundation_up"] = "Het fundament moet omhoog zijn",
    ["foundation_down"] = "Het fundament moet omlaag zijn",
    ["need_pillars"] = "Je hebt minstens 2 pilaren of een muur nodig om een plafond te maken",
    ["light_close"] = "Er is al een lamp dichtbij deze plek",
    ["to_close_foundation"] = "Je bent te dichtbij een fundament",
    ["no_under_ground"] = "Je kunt niet onder de grond bouwen",
    ["to_close"] = "Te dichtbij een ander object",
    ["need_big_gateway"] = "Je hebt een groot poortframe nodig",
    ["no_foundation"] = "Er is geen fundament of plafond",
    ["no_fuel"] = "Je hebt geen brandstof",
    ["tank_full"] = "De tank is vol",
    ["you_added"] = "Je hebt toegevoegd ",
    ["l_fuel"] = "L brandstof",
    ["code_set"] = "Code ingesteld op ",
    ["turn_off"] = "Uitgeschakeld",
    ["turn_on"] = "Ingeschakeld",
    ["no_fuel"] = "Niet genoeg brandstof",
    ["wrong_code"] = "Verkeerde code",
    ["no_advanced"] = "Geen geavanceerde interactie",
    ["no_c4"] = "Je hebt explosieven nodig",
    ["no_explode"] = "Kan dit niet laten exploderen",
    ["need_items"] = "Benodigde items:",
    ["repair_success"] = "Reparatie succesvol",
    ["no_gate"] = "Er is geen poort om mee te interacteren",
    ["no_door"] = "Er is geen deur om mee te interacteren",
    ["no_electricity"] = "Er is geen elektriciteit",
    ["no_player_id"] = "Er is geen speler online met dit ID",
    ["permission_added"] = "Toestemming toegevoegd",
    ["permission_removed"] = "Toestemming verwijderd",
    ["perm_clear"] = "Toestemmingen gewist",
    ["interact_with"] = "Interageer met ",
    ["open"] = "Open ",
    ["settings"] = " instellingen",
    ["no_interactions"] = "Je kunt hier niet mee interageren",
    ["delete"] = "Verwijder ",
    ["need_codelock"] = "Je hebt een Code Lock-item nodig",
    ["use_c4"] = "Gebruik c4 op de ",
    ["to_much_props"] = "Te veel props in deze zone",
    ["incorrect_shape"] = "Onjuiste vorm",
    ["build_limit_1"] = "Je hebt het limit bereikt van het bouwen.",
    ["bed_limit"] = "Je kan maar 1 bed hebben.",

    -- CREW --

    ["crew_menu"] = "Crew Menu",
    ["crew_playerList"] = "Spelers lijst",
    ["crew_manage"] = "beheer crew",
    ["crew_invitesList"] = "Invites",
    ["crew_invite_header"] = "INVITE SPELER",
    ["crew_invite_desc"] = "Klik om de speler te inviten voor je crew",
    ["crew_manage_header"] = "BEHEER SPELEERS",
    ["crew_manage_desc"] = "klik om je crew te beheren",
    ["crew_delete_header"] = "VERWIJDER CREW",
    ["crew_delete_desc"] = "klik om je crew te verwijderen",
    ["crew_leave_header"] = "VERLAAT CREW",
    ["crew_leave_desc"] = "Klik om de crew te verlaten",
    ["crew_invites_header"] = "OPEN CREW INVITES",
    ["crew_invites_desc"] = "klik om je crew invites te openen",
    ["crew_create_header"] = "MAAK CREW",
    ["crew_create_desc"] = "Klik om een nieuwe crew aan te maken",
    ["crew_join"] = "Klik om crew te joinen",
    ["crew_no_invites"] = "klik om de crew te joinen",
    ["crew_remove_player"] = "klik om de speler te verwijderen.",
    ["crew_no_remove_you"] = "Je kan jezelf niet verwijderen",
    ["crew_invite_player"] = "Klik om deze speler te inviten voor je crew",
    ["crew_no_players"] = "Er zijn geen spelers in de buurt",
    ["crew_created"] = "Je hebt een nieuwe crew aangemaakt",
    ["crew_deleted"] = "Je crew is verwijderd",
    ["crew_player_on_crew"] = "De speler zit al in je crew",
    ["crew_crew_limit"] = "Je hebt al het maximale spelers in je crew",
    ["crew_new_invite"] = "Je hebt een nieuwe crew invite gekregen",
    ["crew_you_invited"] = "Je hebt ",
    ["crew_to_crew"] = " uitgenodigd voor je crew",
    ["crew_already_invited"] = "Je hebt deze speler al geïnvite voor je crew",
    ["crew_no_crew"] = "Je hebt geen crew",
    ["crew_limit_reached"] = "Crew heeft het maximale spelers bereikt.",
    ["crew_invite_accepted"] = "Invite geaccepteerd",
    ["crew_new_to_crew"] = " Is nu onderdeel van je crew",
    ["crew_joined"] = "Je joined ",
    ["crew_you_left"] = "Je hebt je crew verlaten",
    ["crew_left_crew"] = ' verlaat de crew',
    ["crew_player_removed"] = "Speler is verwijderd uit de crew",
    ["crew_you_removed"] = "Je bent verwijderd uit de crew",

    -- code limit
    ["wrong_code_limit"] = "je hebt te vaak onjuist wachtwoord ingevuld",

}
