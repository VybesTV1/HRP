fx_version 'cerulean'

game 'gta5'

lua54 'yes'

author 'Lusty94'

description 'Polar Ice - Ice Cream Shop Job Script For QB-Core'

version '2.0.1'


client_scripts {
    'client/icecream_client.lua',
    'shared/menus.lua',
    'shared/targets.lua'
}

server_scripts {
    'server/icecream_server.lua',
    'shared/billing.lua',
} 

shared_scripts { 
	'shared/config.lua',
    '@ox_lib/init.lua'
}

escrow_ignore {
    'shared/**.lua',
    'client/**.lua',
    'server/**.lua',
}

dependency '/assetpacks'