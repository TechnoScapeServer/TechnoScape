fx_version 'adamant'
game 'gta5'
ui_page 'html/index.html'
lua54 'yes'

shared_script{
	'GetFrameworkObject.lua'
}

client_scripts {
    'GetFrameworkObject.lua',
    'config.lua',
    'client.lua'
}

server_scripts {
    'GetFrameworkObject.lua',
    'config.lua',
    'serverconfig.lua',
    'server.lua',
}


files {
    'html/index.html',
    'html/css/*.css',
    'html/fonts/*.otf',
    'html/fonts/*.OTF',
    'html/img/*.png',
    'html/js/*.js'
}

escrow_ignore{
    'config.lua',
    'serverconfig.lua',
    'GetFrameworkObject.lua',
}
dependency '/assetpacks'