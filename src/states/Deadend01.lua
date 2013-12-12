local Deadend01 = State:new()

Deadend01.music = overworld03bgm

Deadend01.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door = Exit:new(),
                      }

Deadend01.paramList = { bg = { map = 'deadend01.tmx'},
                      player = {},
                      door = { x = 4 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Hallway02',
                                        x = 26 * tilesize,
                                        y = 15 * tilesize },
                      },
                     }

Deadend01.zList = { "bg",
                  "player",
}

Deadend01.staticList = { "bg",
                       "player",
                       "door",
}

return Deadend01
