fx_version 'cerulean'
games {'gta5'}
version '2.0.4'
author 'Les Diables MLO'
description 'Hospital V2.0'

lua_54 'yes'

this_is_a_map 'yes'
replace_level_meta 'gta5'

files {
    --doortuning meta
    'gta5.meta',
    --doortuning
    'data/level/doortuning.ymt',
    --general
    'audio/C751129C_game.dat151.rel',
    'audio/5562FA06_game.dat151.rel',
    'audio/AE646FCE_game.dat151.rel',
    'audio/diables_hopital_doors_sounds_game.dat151.rel',
    --textures
    'data/gtxd/gtxd.meta'
}

escrow_ignore {
  'stream/interior/props/v_diables_hopital_tableau_01.ydr',
  'stream/interior/props/v_diables_hopital_tableau_02.ydr',
  'stream/interior/props/v_diables_hopital_tableau_03.ydr',
  'stream/interior/props/v_diables_hopital_tableau_04.ydr',
  'stream/exterior/ydr/props/v_diables_hopital_logo_exterior.ydr'
}

--general
data_file 'AUDIO_GAMEDATA' 'audio/C751129C_game.dat'
data_file 'AUDIO_GAMEDATA' 'audio/5562FA06_game.dat'
data_file 'AUDIO_GAMEDATA' 'audio/AE646FCE_game.dat'
data_file 'AUDIO_GAMEDATA' 'audio/diables_hopital_doors_sounds_game.dat'
--textures
data_file 'GTXD_PARENTING_DATA' 'data/gtxd/gtxd.meta'
--ytyp
data_file 'DLC_ITYP_REQUEST' 'stream/interior/ytyp/v_diables_hopital.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/interior/part2/v_diables_hopital_part2.ytyp'
dependency '/assetpacks'