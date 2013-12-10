local Switcharound = State:new()

Switcharound.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new(),
                       door03 = Exit:new()
                      }

Switcharound.paramList = { bg = { map = 'switcharound.tmx'},
                      player = {},
                      door01 = { x = 2 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Hallway', -- replace
                                        x = 16 * tilesize,
                                        y = 14 * tilesize },
                      },
                      door02 = { x = 15 * tilesize,
                                 y = 10 * tilesize,
                                 dest = { name = 'Office04',
                                          x = 26 * tilesize,
                                          y = 15 * tilesize },
                      },
                      door03 = { x = 29 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'FileHall', -- replace
                                          x = 28 * tilesize,
                                          y = 15 * tilesize },
                      },
                     }

Switcharound.zList = { "bg",
                  "player",
}

Switcharound.staticList = { "bg",
                       "player",
                       "door01",
                       "door02",
                       "door03"
}

return Switcharound