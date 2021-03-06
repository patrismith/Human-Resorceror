local Clockroom = State:new()

Clockroom.music = overworld02bgm

Clockroom.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Clockroom.paramList = { bg = { map = 'clockroom.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Office06',
                                        x = 5 * tilesize,
                                        y = 16 * tilesize },
                      },
                      door02 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Office10',
                                          x = 26 * tilesize,
                                          y = 15 * tilesize },
                      },
                     }

Clockroom.zList = { "bg",
                  "player",
}

Clockroom.staticList = { "bg",
                       "player",
                       "door01",
                       "door02"
}

return Clockroom
