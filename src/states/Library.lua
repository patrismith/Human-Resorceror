local Library = State:new()

Library.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door = Exit:new(),
                      }

Library.paramList = { bg = { map = 'library.tmx'},
                      player = {},
                      door = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Switcharound',
                                        x = 16 * tilesize,
                                        y = 14 * tilesize },
                      },
                     }

Library.zList = { "bg",
                  "player",
}

Library.staticList = { "bg",
                       "player",
                       "door",
}

return Library
