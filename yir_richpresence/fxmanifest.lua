fx_version 'cerulean'
game 'gta5'

author 'YIR (ykitsrico)'
description 'Discord Rich Presence Script'
version '1.0.0'

resource_type 'client_script' { name = 'Discord Rich Presence', type = 'client' }

client_script 'client/client.lua'
server_script 'server/server.lua'
shared_script 'config.lua'