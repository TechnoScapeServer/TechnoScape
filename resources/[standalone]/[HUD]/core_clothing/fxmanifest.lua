
fx_version 'adamant'
game 'gta5'

author 'c8re'
description 'Create stores and sell clothes'
version '1.0.0'

ui_page 'html/form.html'

lua54 'yes'

files {
	'html/form.html',
	'html/css.css',
	'html/loader.svg',
	'html/script.js',
	'html/jquery-3.4.1.min.js',
	'html/img/*.png',
	'sounds/*.mp3',
	'html/img/*.jpg',
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua'
}

client_scripts{
    'client/main.lua',
}

server_scripts{
    'server/main.lua',
    '@oxmysql/lib/MySQL.lua',
}

escrow_ignore {
	'client/main.lua',
	'server/main.lua',
	'config.lua'
}
dependency '/assetpacks'