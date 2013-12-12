local Office05 = State:new()

Office05.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Office05.paramList = { bg = { map = 'coworkeroffice05.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Office09',
                                        x = 5 * tilesize,
                                        y = 15 * tilesize },
                      },
                      door02 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'FileHall',
                                          x = 15 * tilesize,
                                          y = 14 * tilesize },
                      },
                     }

Office05.zList = { "bg",
                  "player",
}

Office05.staticList = { "bg",
                       "player",
                       "door01",
                       "door02"
}

return Office05
