fx_version 'cerulean'
game 'gta5'

files {
    'peds.meta'
}

client_scripts {
    '@menuv/menuv.lua',
    'MainMenu.lua',
    'MenuFunctions/*.lua'
}

server_scripts {
    'server.lua'
}

shared_script 'config.lua'

dependency 'menuv'

data_file 'PED_METADATA_FILE' 'peds.meta'