fx_version 'cerulean'

game 'gta5'

author 'DRC Scripts'
description 'DRC UWU CAFE'

version '1.0.1'

lua54 'yes'

shared_scripts {
	'@ox_lib/init.lua',
	'shared/*.lua',
}

client_scripts {
	'client/*.lua',
}

server_scripts {
	'server/*.lua',
}

files {
	'locales/*.json'
}

escrow_ignore {
	'shared/*.lua',
	'client/cl_Utils.lua',
	'server/sv_Utils.lua',
}

data_file 'DLC_ITYP_REQUEST' 'stream/uwu_mysterybox.ytyp'
dependency '/assetpacks'