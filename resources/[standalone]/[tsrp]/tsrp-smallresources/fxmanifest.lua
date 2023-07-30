fx_version 'cerulean'
game 'gta5'

description 'TK-SmallResources'
version 'Alpha 1.0'

shared_scripts {
    "config.lua"
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

client_scripts {
	'client/client.lua',
    'client/vehicle_names.lua'
}

lua54 'yes'
