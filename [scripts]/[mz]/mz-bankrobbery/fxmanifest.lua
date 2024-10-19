fx_version 'cerulean'
game 'gta5'

description 'mz-bankrobbery - a re-worked qb-bankrobbery (functional with or without mz-skills)'

version '1.1.3'

ui_page 'html/index.html'

shared_scripts {
    'shared/sh_config.lua',
    '@qb-core/shared/locale.lua',
    'locales/*.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'shared/cl_config.lua',
    'client/*',
    'cl_client/*'
}

server_scripts {
    'shared/sv_config.lua',
    'server/*',
}

files {
    'html/*',
}

dependency 'PolyZone'

lua54 'yes'

use_fxv2_oal 'yes'

escrow_ignore {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    'locales/*',
    'html/*',
    'shared/*',
    'client/*',
    'server/*',
    'Fleeca.lua',
    'config.lua',
}

dependency '/assetpacks'