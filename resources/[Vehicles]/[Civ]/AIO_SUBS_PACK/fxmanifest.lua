lua54 'on'

fx_version 'adamant'

game 'gta5'

-- Resource stuff --
author 'Venom_9999'
description 'Created by V&V Store. For more details contact us via our discord https://discord.gg/6HvfP2AQnz'
version 'v0.3'

files {
  'data/**/carcols.meta',
  'data/**/carvariations.meta',
  'data/**/handling.meta',
  'data/**/vehiclelayouts.meta',
  'data/**/vehicles.meta',
}

data_file 'VEHICLE_LAYOUTS_FILE'    'data/**/vehiclelayouts.meta'
data_file 'HANDLING_FILE'           'data/**/handling.meta'
data_file 'VEHICLE_METADATA_FILE'   'data/**/vehicles.meta'
data_file 'CARCOLS_FILE'            'data/**/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE'  'data/**/carvariations.meta'

client_scripts {
  'vehicle_names.lua' 
}
dependency '/assetpacks'