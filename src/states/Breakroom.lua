local Breakroom = State:new()

Breakroom.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                      }

Breakroom.paramList = { bg = { map = 'breakroom.tmx' },
                      player = {},
                      door01 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Hallway',
                                          x = 28 * tilesize,
                                          y = 15 * tilesize },
                      },
                      }

Breakroom.zList = { "bg",
                  "player",
}

Breakroom.staticList = { "bg",
                       "player",
                       "door01",
}

return Breakroom
