local Office04 = State:new()

Office04.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Office04.paramList = { bg = { map = 'coworkeroffice04.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Switcharound',
                                        x = 15 * tilesize,
                                        y = 12 * tilesize },
                      },
                      door02 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'LibHall',
                                          x = 7 * tilesize,
                                          y = 7 * tilesize },
                      },
                     }

Office04.zList = { "bg",
                  "player",
}

Office04.staticList = { "bg",
                       "player",
                       "door01",
                       "door02"
}

return Office04
