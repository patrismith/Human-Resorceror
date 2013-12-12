local Foodstorage = State:new()

Foodstorage.music = overworld03bgm

Foodstorage.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new(),
                       door03 = Exit:new()
                      }

Foodstorage.paramList = { bg = { map = 'foodstorage.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Hallway03',
                                        x = 4 * tilesize,
                                        y = 15 * tilesize },
                      },
                      door02 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Breakroom',
                                          x = 26 * tilesize,
                                          y = 16 * tilesize },
                      },
                      door03 = { x = 15 * tilesize,
                                 y = 10 * tilesize,
                                 dest = { name = 'Hallway02',
                                          x = 4 * tilesize,
                                          y = 15 * tilesize },
                      },
                     }

Foodstorage.zList = { "bg",
                  "player",
}

Foodstorage.staticList = { "bg",
                       "player",
                       "door01",
                       "door02",
                       "door03"
}

return Foodstorage
