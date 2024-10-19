fx_version 'cerulean'
games { 'gta5' }
lua54 'yes'

description 'Stealth Plate Flipper by Lubes | Prime Developments'
version '1.0.5'

ui_page 'html/index.html'

client_scripts {
	'config.lua',
	'client/functions.lua',
	'locales/en.lua',
	'client/editable/esx_functions.lua',
	'client/editable/qb_functions.lua',
	'client/editable/standalone_functions.lua',
	'client/client.lua',
	'client/flipperInstall.lua'
	
}

server_scripts {
	'config.lua',
	'@mysql-async/lib/MySQL.lua',
	'server/server.lua',
	'server/editable/*.lua'
}


escrow_ignore {
	'server/editable/*.lua',
	'client/editable/*.lua',
	'config.lua',
	'locales/en.lua',
}

files {
	"image/spec.png",
	'html/*.html',
	'html/*.js',
	'html/*.wav'
}

exports {
	"GetVehiclePlate",
	"InstallFlipper"
}

data_file 'CARCOLS_FILE' 'stream/carcols.meta'

dependency '/assetpacks'