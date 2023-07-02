fx_version 'cerulean'
game 'gta5'
author 'codem'

client_scripts {
    'Core.lua',
    'config.lua',
    'client.lua',
    'clothes.lua',
}

server_scripts {
    -- '@mysql-async/lib/MySQL.lua', -- uncomment this if you want to use mysql-async
	'@oxmysql/lib/MySQL.lua', -- uncomment this if you want to use oxmysql
    'Core.lua',
    'config.lua',
    'server.lua',
    'sv_function.lua'
}

ui_page {
    'ui/ui.html',
}

files {
    'ui/ui.html',
    'ui/style.css',
    'ui/script.js',
    'ui/fonts/*.ttf',
    'ui/fonts/*.otf',
    'ui/images/*.png',
    'ui/config.js'
}

escrow_ignore {
	'config.lua',
    'sv_function.lua',
    'clothes.lua',
    'Core.lua',
}

lua54 'yes'
dependency '/assetpacks'