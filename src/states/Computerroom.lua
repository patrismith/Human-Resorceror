local Computerroom = State:new()

Computerroom.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Computerroom.paramList = { bg = { map = 'computerroom.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Office10',
                                        x = 5 * tilesize,
                                        y = 16 * tilesize },
                      },
                      door02 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'FileHall',
                                          x = 8 * tilesize,
                                          y = 14 * tilesize },
                      },
                     }

Computerroom.zList = { "bg",
                  "player",
}

Computerroom.staticList = { "bg",
                       "player",
                       "door01",
                       "door02"
}

return Computerroom
