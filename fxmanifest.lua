-- fxmanifest.lua
fx_version 'cerulean'
game 'gta5'

author 'Br3ndino'
description 'Textile Crafting Job'
version '1.0.0'

-- Server script
server_script 'server.lua'

-- Client script
client_script 'client.lua'

-- Dependencies
dependencies {
    'qb-core',
    'qb-target',
    'ox_lib',
    'progressBars' -- Optional for loading bar
}
