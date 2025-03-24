# br3ndino_cotton

# DEPENDENCIES:
1. qbcore
2. qb-inventory v2 (untested with v1)
3. progressbar (comes with qb by default in standalone folder)
4. ox-lib

# HOW TO INSTALL
1. Move images from imgs folder into your qbcore inventory images folder.
2. Add the following to your items.lua:
-- Br3ndino Cotton
    cotton                  = { name = 'cotton', label = 'Cotton', weight = 100, type = 'item', image = 'cotton.png', unique = false, useable = false, shouldClose = false, description = 'A piece of freshly picked cotton' },
    sock                  = { name = 'sock', label = 'Socks', weight = 100, type = 'item', image = 'sock.png', unique = false, useable = false, shouldClose = false, description = 'A pair of socks' },
    shirt                  = { name = 'shirt', label = 'Shirt', weight = 100, type = 'item', image = 'shirt.png', unique = false, useable = false, shouldClose = false, description = 'A nice looking shirt' },
    pants                  = { name = 'pants', label = 'Pants', weight = 100, type = 'item', image = 'pants.png', unique = false, useable = false, shouldClose = false, description = 'A pair of pants' },
    purse                  = { name = 'purse', label = 'Purse', weight = 100, type = 'item', image = 'purse.png', unique = false, useable = false, shouldClose = false, description = 'A purse' },
    fake_shirt                  = { name = 'fake_shirt', label = 'Fake Designer Shirt', weight = 100, type = 'item', image = 'fake_shirt.png', unique = false, useable = false, shouldClose = false, description = 'A fake designer shirt' },
    fake_pants                   = { name = 'fake_pants', label = 'Fake Designer Pants', weight = 100, type = 'item', image = 'fake_pants.png', unique = false, useable = false, shouldClose = false, description = 'Pair of fake designer pants' },
    fake_purse                  = { name = 'fake_purse', label = 'Fake Designer Purse', weight = 100, type = 'item', image = 'fake_purse.png', unique = false, useable = false, shouldClose = false, description = 'A fake designer purse' },
    fake_police                  = { name = 'fake_police', label = 'Fake Police Uniform', weight = 100, type = 'item', image = 'fake_police.png', unique = false, useable = false, shouldClose = false, description = 'A fake police uniform' },

3. Drag the resource over into an ensured folder, or manually ensure br3ndino_cotton.
4. Restart and enjoy