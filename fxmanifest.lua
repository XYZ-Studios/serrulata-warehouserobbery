fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game         'gta5'

author 'Cuzzman | Converted by Gale#4864'
description 'Warehouse Robbing script'
version '1.0'

shared_script {
    'config.lua',
    'locales/en.lua',
    'locales/*.lua',
    '@ox_lib/init.lua'
}
server_script 'server/*.lua'
client_script 'client/*.lua'