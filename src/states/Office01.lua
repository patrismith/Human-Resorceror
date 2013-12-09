local Office01 = State:new()

Office01.objectList = { bg = Map:new(),
                       player = Player:new(),
                       fileclerk = NPC:new(),
                       door = Exit:new(),
                      }

Office01.paramList = { bg = { map = 'coworkeroffice01.tmx' },
                      player = {},
                      fileclerk = { x = 12 * tilesize,
                                   y = 13 * tilesize,
                                   name = 'fileclerk',
                                   img = oldone,
                                   sheet = charsprites,
                                   moves = true,
                                   attacks = true,
                                   dialogue = {
                                      { "What? Our company is engaged in a scheme to flouridate water?" },
                                      { "You're saying flouridation is responsible for lowered IQ rates across the board?" }
                                   }, },
                      door = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Hallway',
                                        x = 9 * tilesize,
                                        y = 14 * tilesize },
                      },
                     }

Office01.zList = { "bg",
                  "player",
                  "fileclerk",
}

Office01.staticList = { "bg",
                       "player",
                       "fileclerk",
                       "door",
}

return Office01
