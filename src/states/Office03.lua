local Office03 = State:new()

Office03.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Office03.paramList = { bg = { map = 'coworkeroffice03.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Office08',
                                        x = 5 * tilesize,
                                        y = 15 * tilesize },
                      },
                      door02 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'FileHall',
                                          x = 23 * tilesize,
                                          y = 14 * tilesize },
                      },
                     }

Office03.zList = { "bg",
                  "player",
}

Office03.staticList = { "bg",
                       "player",
                       "door01",
                       "door02"
}

return Office03
