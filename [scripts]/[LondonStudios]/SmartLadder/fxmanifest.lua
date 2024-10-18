fx_version 'bodacious'
games { 'gta5' }

author 'London Studios'
description 'A resource providing a realistic arial ladder system'
version '1.0.0'
lua54 'yes'

files {
    'stream/*.ytyp',
    'data/*.meta',
    'sounds/index.html',
    'sounds/*.ogg',
}

client_scripts {
    'config.lua',
    'cl_utils.lua',
    'cl_ladder.lua',
    'vehicles/*.lua',
}

server_scripts {
    'config.lua',
    'sv_utils.lua',
    'sv_ladder.lua',
}

ui_page 'sounds/index.html'

shared_script '@es_extended/imports.lua'

escrow_ignore {
    'config.lua',
    'stream/*.ytd.',
    'stream/*.ytyp',
    'vehicles/*.lua',
    'config.lua',
    'sv_utils.lua',
    'cl_utils.lua',
    'template.png',
    'data/*.meta',
    'firetruk.xml',
    'surreytl.xml',
    'stream/outrigger.ydr',
}

data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'

data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
dependency '/assetpacks'