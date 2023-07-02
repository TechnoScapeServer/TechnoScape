
fx_version 'adamant'
game 'gta5'

author 'c8re'
description 'Most advanced inventory on FiveM'
version '1.3.2'

ui_page 'html/form.html'

lua54 'yes'

files {
	'html/form.html',
	'html/css.css',
	'html/gradient.png',
	'html/script.js',
	'html/jquery-3.4.1.min.js',
	'html/img/*.png',
	'html/*.svg',
	'sounds/*.mp3',
	'stream/*.ytyp'
}

data_file 'DLC_ITYP_REQUEST' 'core_bbox.ytyp'

shared_scripts {
    'config.lua',
}

client_scripts{
    'config.lua',
    'client/main.lua',
}

server_scripts{
    'config.lua',
    'config_discord.lua',
    'server/metadata.lua',
    'server/main.lua',
}

escrow_ignore {
  'client/main.lua',
  'server/metadata.lua',
  'default_items_with_weapon_category_and_size.lua',
  'config.lua',
  'config_discord.lua'
}
dependency '/assetpacks'