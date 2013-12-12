local Office07 = State:new()

Office07.music = overworld02bgm

Office07.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new(),
                       door03 = Exit:new()
                      }

Office07.paramList = { bg = { map = 'coworkeroffice07.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Hallway04',
                                        x = 3 * tilesize,
                                        y = 16 * tilesize },
                      },
                      door02 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Switcharound',
                                          x = 28 * tilesize,
                                          y = 16 * tilesize },
                      },
                      door03 = { x = 20 * tilesize,
                                 y = 10 * tilesize,
                                 dest = { name = 'Eyeroom',
                                          x = 25 * tilesize,
                                          y = 15 * tilesize },
                      },
                     }

Office07.zList = { "bg",
                  "player",
}

Office07.staticList = { "bg",
                       "player",
                       "door01",
                       "door02",
                       "door03"
}

return Office07
