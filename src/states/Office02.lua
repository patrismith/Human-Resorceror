local Office02 = State:new()

Office02.music = overworld01bgm

Office02.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Office02.paramList = { bg = { map = 'coworkeroffice02.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Hallway',
                                        x = 16 * tilesize,
                                        y = 14 * tilesize },
                      },
                      door02 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'FileHall',
                                          x = 28 * tilesize,
                                          y = 15 * tilesize },
                      },
                     }

Office02.zList = { "bg",
                  "player",
}

Office02.staticList = { "bg",
                       "player",
                       "door01",
                       "door02"
}

return Office02
