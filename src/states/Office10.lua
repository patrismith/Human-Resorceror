local Office10 = State:new()

Office10.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Office10.paramList = { bg = { map = 'coworkeroffice10.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Clockroom',
                                        x = 5 * tilesize,
                                        y = 16 * tilesize },
                      },
                      door02 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Computerroom',
                                          x = 26 * tilesize,
                                          y = 15 * tilesize },
                      },
                     }

Office10.zList = { "bg",
                  "player",
}

Office10.staticList = { "bg",
                       "player",
                       "door01",
                       "door02"
}

return Office10
