local Hallway04 = State:new()

Hallway04.music = overworld02bgm

Hallway04.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Hallway04.paramList = { bg = { map = 'hallway04.tmx'},
                      player = {},
                      door01 = { x = 29 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'FileHall',
                                        x = 4 * tilesize,
                                        y = 15 * tilesize },
                      },
                      door02 = { x = 2 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Office07',
                                          x = 26 * tilesize,
                                          y = 16 * tilesize },
                      },
                     }

Hallway04.zList = { "bg",
                  "player",
}

Hallway04.staticList = { "bg",
                       "player",
                       "door01",
                       "door02"
}

return Hallway04
