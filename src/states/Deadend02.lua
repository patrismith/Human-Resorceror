local Deadend02 = State:new()

Deadend02.music = overworld03bgm

Deadend02.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door = Exit:new(),
                      }

Deadend02.paramList = { bg = { map = 'deadend02.tmx'},
                      player = {},
                      door = { x = 4 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Hallway03',
                                        x = 26 * tilesize,
                                        y = 15 * tilesize },
                      },
                     }

Deadend02.zList = { "bg",
                  "player",
}

Deadend02.staticList = { "bg",
                       "player",
                       "door",
}

return Deadend02
