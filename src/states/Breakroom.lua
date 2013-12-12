local Breakroom = State:new()

Breakroom.music = overworld01bgm

Breakroom.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new(),
                      }

Breakroom.paramList = { bg = { map = 'breakroom.tmx' },
                      player = {},
                      door01 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Hallway',
                                          x = 28 * tilesize,
                                          y = 15 * tilesize },
                      },
                      door02 = { x = 27 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Foodstorage',
                                          x = 5 * tilesize,
                                          y = 16 * tilesize },
                      }
                      }

Breakroom.zList = { "bg",
                  "player",
}

Breakroom.staticList = { "bg",
                       "player",
                       "door01",
                       "door02"
}

return Breakroom
