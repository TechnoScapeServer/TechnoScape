fx_version 'cerulean'
game 'gta5'

description 'TK-Restaraunts'
version '1.0.0'

shared_scripts {
    "shared/config.lua",
    "locations/*.lua"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua'
}

client_scripts {
	'client/*.lua',
    'locations/*lua'
}

lua54 'yes'
