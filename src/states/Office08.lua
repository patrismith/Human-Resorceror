local Office08 = State:new()

Office08.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door = Exit:new(),
                      }

Office08.paramList = { bg = { map = 'coworkeroffice08.tmx'},
                      player = {},
                      door = { x = 4 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Office03',
                                        x = 26 * tilesize,
                                        y = 16 * tilesize },
                      },
                     }

Office08.zList = { "bg",
                  "player",
}

Office08.staticList = { "bg",
                       "player",
                       "door",
}

return Office08
