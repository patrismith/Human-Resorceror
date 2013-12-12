local Office09 = State:new()

Office09.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door = Exit:new(),
                      }

Office09.paramList = { bg = { map = 'coworkeroffice09.tmx'},
                      player = {},
                      door = { x = 4 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Office05',
                                        x = 26 * tilesize,
                                        y = 15 * tilesize },
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
