fx_version 'adamant'

lua54 'yes'

game 'gta5'

description 'HRS BASES (update 14/06/2023 (june) locales/logs/multiple explosive weapons)'

version '1.1'

ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/script.js',
    'html/main.css',
    "html/*.png"
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
	'locales/locales.lua',
	'discordLogs/logs.lua',
	'config.lua',
	'server/main_unlocked.lua',
	'server/main.lua'
}

client_scripts {
	'locales/locales.lua',
	'config.lua',
	'client/main_unlocked.lua',	
	'client/main.lua'
}

escrow_ignore {
	'@oxmysql/lib/MySQL.lua',
	'locales/locales.lua',
	'discordLogs/logs.lua',
	'server/main_unlocked.lua',
	'client/main_unlocked.lua',
	'config.lua'
}

dependency '/assetpacks'