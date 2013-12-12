local Hallway03 = State:new()

Hallway03.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Hallway03.paramList = { bg = { map = 'hallway03.tmx'},
                      player = {},
                      door01 = { x = 29 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Deadend02',
                                        x = 5 * tilesize,
                                        y = 16 * tilesize },
                      },
                      door02 = { x = 2 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Foodstorage',
                                          x = 26 * tilesize,
                                          y = 16 * tilesize },
                      },
                     }

Hallway03.zList = { "bg",
                  "player",
}

Hallway03.staticList = { "bg",
                       "player",
                       "door01",
                       "door02"
}

return Hallway03
