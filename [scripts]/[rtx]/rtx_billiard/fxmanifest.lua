fx_version 'cerulean'

game 'gta5'

description 'RTX BILLIARD'

version '1.0'

server_scripts {
	'config.lua',
	'language/main.lua',
	'server/main.lua',
	'server/other.lua'
}

client_scripts {
	'config.lua',
	'language/main.lua',
	'client/main.lua',
}

files {
	'html/ui.html',
	'html/styles.css',
	'html/scripts.js',
	'html/debounce.min.js',
	'html/BebasNeueBold.ttf'
}

ui_page 'html/ui.html'

lua54 'yes'

data_file 'DLC_ITYP_REQUEST' 'djn_tablepoll.ytyp'

escrow_ignore {
	'config.lua',
	'language/main.lua',
	'server/other.lua',
	'stream/djn_billiard_txtr.ytd'
}
dependency '/assetpacks'