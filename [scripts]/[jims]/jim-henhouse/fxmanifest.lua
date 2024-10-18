name "Jim-HenHouse"
author "Jimathy"
version "2.0.5"
description "HenHouse Script By Jimathy"
fx_version "cerulean"
game "gta5"
lua54 'yes'

shared_scripts { 'config.lua', 'shared/*.lua', 'locales/*.lua*' }
server_scripts { 'server/*.lua' }
client_scripts { '@PolyZone/client.lua', '@PolyZone/BoxZone.lua', '@PolyZone/EntityZone.lua', '@PolyZone/CircleZone.lua', '@PolyZone/ComboZone.lua', 'client/*.lua', }
escrow_ignore { '*.lua', 'client/*.lua', 'server/*.lua', 'locales/*.lua' }
dependency '/assetpacks'