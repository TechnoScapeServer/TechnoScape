fx_version 'bodacious'
game 'gta5'

author 'Your Name'
description 'Your Resource Description'
version '1.0.0'

ui_page 'html/index.html'

shared_scripts {
    'config.lua'
}

client_scripts {
    'Client/client.lua',
    'Client/functions.lua',
    'Client/dialogue.lua',
    'Client/streetkid.lua'
}

server_scripts {
    'server.lua',
}

files {
    'html/index.html',
    'html/style.css',
    'html/hover-sound.mp3',
    'html/hover-sound.ogg',
    'html/script.js',
}

lua54 'yes'