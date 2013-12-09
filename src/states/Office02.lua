local Office02 = State:new()

Office02.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door = Exit:new(),
                      }

Office02.paramList = { bg = { map = 'coworkeroffice02.tmx'},
                      player = {},
                      door = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Hallway',
                                        x = 16 * tilesize,
                                        y = 14 * tilesize },
                      },
                     }

Office02.zList = { "bg",
                  "player",
}

Office02.staticList = { "bg",
                       "player",
                       "door",
}

return Office02
