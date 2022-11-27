fx_version 'cerulean'
game 'gta5'

author 'Cuzzman'
description 'Warehouse Robbing script'
version '1.0'

shared_script {
    'config.lua',
    'locales/en.lua',
    'locales/*.lua'
}
server_script 'server/*.lua'
client_scripts {
    'client/*.lua',
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/CircleZone.lua',
}

lua54 'yes'
