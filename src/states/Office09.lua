local Office09 = State:new()

Office09.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door = Exit:new(),
                      }

Office09.paramList = { bg = { map = 'coworkeroffice09.tmx'},
                      player = {},
                      door = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Office05',
                                        x = 5 * tilesize,
                                        y = 16 * tilesize },
                      },
                     }

Office09.zList = { "bg",
                  "player",
}

Office09.staticList = { "bg",
                       "player",
                       "door",
}

return Office09
