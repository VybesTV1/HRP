fx_version 'cerulean'

games { 'gta5' }

author 'London Studios'
description 'An American Rearmount Ladder truck compatible with Smart Ladder'
version '1.0.0'
lua54 'yes'

files {
    'data/*.meta',
    'stream/*.ytyp'
}

escrow_ignore {
    'stream/*.ytd.',
    'stream/*.ytyp',
    'rearmount.lua',
    'templates/*',
    'data/*.meta',
}

data_file 'VEHICLE_METADATA_FILE' 'data/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'DLC_ITYP_REQUEST' 'stream/*.ytyp'
dependency '/assetpacks'