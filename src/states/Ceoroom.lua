local Ceooffice = State:new()

Ceooffice.music = overworld03bgm

Ceooffice.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door = Exit:new(),
                      }

Ceooffice.paramList = { bg = { map = 'ceooffice.tmx'},
                      player = {},
                      door = { x = 4 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Deadend02', -- replace
                                        x = 13 * tilesize,
                                        y = 13 * tilesize },
                      },
                     }

Ceooffice.zList = { "bg",
                  "player",
}

Ceooffice.staticList = { "bg",
                       "player",
                       "door",
}

return Ceooffice
