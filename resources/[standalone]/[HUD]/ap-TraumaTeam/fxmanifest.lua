fx_version('cerulean')
games({ 'gta5' })
description '[ApolloStudios] Medical Trauma UI Exclusively Created For TRSP.'

ui_page('html/index.html');

server_scripts({
    'server/*.lua'
});

client_scripts({
    'client/*.lua'
});

files ({
    'html/index.html',
    'html/*.css',
    'html/creationCard.mp3',
    'html/creationCard.ogg',
    'html/ap-script.js',
    'html/ap-styles.css',
    'html/Partials/coloris.min.css',
    'html/Partials/coloris.min.js',
    'html/Partials/loader.css',
    'html/assets/*.svg',
    'html/assets/*.png',
    'html/assets/*.jpg',
    'html/assets/*.jpeg',
    'html/assets/sounds/*.mp3',
});