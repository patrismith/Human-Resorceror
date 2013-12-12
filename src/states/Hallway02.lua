local Hallway02 = State:new()

Hallway02.objectList = { bg = Map:new(),
                       player = Player:new(),
                       coworker = NPC:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Hallway02.paramList = { bg = { map = 'hallway02.tmx'},
                      player = {},
                      coworker = { x = 12 * tilesize,
                                   y = 13 * tilesize,
                                   name = 'coworker',
                                   img = pigtails,
                                   sheet = charsprites,
                                   moves = true,
                                   dialogue = {
                                      {"The break room smells like fish 'cause I made fish sticks for lunch."},}, },
                      door01 = { x = 29 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Deadend01',
                                        x = 5 * tilesize,
                                        y = 16 * tilesize },
                      },
                      door02 = { x = 2 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Foodstorage',
                                          x = 15 * tilesize,
                                          y = 12 * tilesize },
                      },
                     }

Hallway02.zList = { "bg",
                    "coworker",
                  "player",
}

Hallway02.staticList = { "bg",
                         "coworker",
                       "player",
                       "door01",
                       "door02"
}

return Hallway02
