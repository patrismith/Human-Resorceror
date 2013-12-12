local Office06 = State:new()

Office06.music = overworld02bgm

Office06.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Office06.paramList = { bg = { map = 'coworkeroffice06.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'LibHall',
                                        x = 3 * tilesize,
                                        y = 6 * tilesize },
                      },
                      door02 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Clockroom',
                                          x = 25 * tilesize,
                                          y = 15 * tilesize },
                      },
                     }

Office06.zList = { "bg",
                  "player",
}

Office06.staticList = { "bg",
                       "player",
                       "door01",
                       "door02"
}

return Office06
