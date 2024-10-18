name 'SW-Fishing'
author 'SH4UN'
version '1.4'
description 'Fishing Script'
fx_version 'cerulean'
game 'gta5'

client_scripts {
	'client/*.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/EntityZone.lua',
	'@PolyZone/CircleZone.lua',
	'@PolyZone/ComboZone.lua'
}

server_scripts {
    'server/*.lua'
}

shared_scripts {
    'config.lua',
	'shared/*.lua',
	'locales/*.lua',
	'@ox_lib/init.lua'
}

lua54 'yes'

escrow_ignore {
	'config.lua',
	'shared/*.lua',
	'README.md',
	'locales/*.lua'
}

dependencies {
	'qb-core',
	'ox_lib'
}
dependency '/assetpacks'