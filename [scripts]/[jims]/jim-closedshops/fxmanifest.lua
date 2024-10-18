name "Jim-ClosedShops"
author "Jimathy"
version "2.0.3"
description "Closed Shop Script By Jimathy"
fx_version "cerulean"
game "gta5"
lua54 'yes'

shared_scripts { 'config.lua', 'shared/*.lua', 'locales/*.lua' }
server_scripts { '@oxmysql/lib/MySQL.lua', 'server.lua', }
client_scripts { 'client.lua' }
escrow_ignore { 'client.lua', 'config.lua', 'server.lua', 'locales/*.lua' }
dependency '/assetpacks'