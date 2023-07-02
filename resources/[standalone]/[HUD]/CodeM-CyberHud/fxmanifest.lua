fx_version 'cerulean'
game 'gta5'
author 'Lucid#3604'
description 'Codem-CyberHud'
ui_page {
	'html/index.html',
}

files {
	'html/*.css',
	'html/*.js',
	'html/*.html',
	'html/*.ogg',
	'html/images/*.png',
	'html/images/*.svg',
}
shared_script 'GetFrameworkObject.lua'
shared_script 'config.lua'


client_scripts {
	'client/*.lua',
	'status.lua',
}
server_scripts {
	'server/*.lua',
}

lua54 'yes'

escrow_ignore {
	'config.lua',
	'GetFrameworkObject.lua',
	'client/seatbelt.lua',
	'status.lua',
}
dependency '/assetpacks'