fx_version 'cerulean'
game 'gta5'

description 'TK-Fishing'
version '1.6.5'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua',
    'locales/en.lua',
    'locales/*.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}

client_scripts {
	'Client/client.lua',
    'Client/functions.lua',
    'Client/menu.lua',
}

escrow_ignore {
    'config.lua',
    'functions.lua',
    'locales/*.lua',
  }

lua54 'yes'
