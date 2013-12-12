local Hallway = State:new()

Hallway.music = overworld01bgm

Hallway.objectList = { bg = Map:new(),
                       player = Player:new(),
                       coworker = NPC:new(),
                       door01 = Exit:new(), -- youroffice
                       door02 = Exit:new(), -- office01
                       door03 = Exit:new(), -- office02
                       door04 = Exit:new(), -- breakroom
                     }

Hallway.paramList = { bg = { map = 'hallway.tmx'},
                      player = {},
                      coworker = { x = 13 * tilesize,
                                   y = 17 * tilesize,
                                   name = 'coworker',
                                   img = oldtwo,
                                   sheet = charsprites,
                                   moves = true,
                                   dialogue = {
                                      { "In conversation, listen to others. Words don't matter nearly as much as tone." },
                                      { "You can convince people of anything if you just take the correct tone with them." }, },
                      },
                      door01 = { x = 2 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'YourOffice',
                                          x = 26 * tilesize,
                                          y = 15 * tilesize },
                      },
                      door02 = { x = 9 * tilesize,
                                 y = 12 * tilesize,
                                 dest = { name = 'Office01',
                                          x = 26 * tilesize,
                                          y = 15 * tilesize },
                      },
                      door03 = { x = 16 * tilesize,
                                 y = 12 * tilesize,
                                 dest = { name = 'Office02',
                                          x = 26 * tilesize,
                                          y = 15 * tilesize },
                      },
                      door04 = { x = 29 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Breakroom',
                                          x = 5 * tilesize,
                                          y = 15 * tilesize },
                      },
                    }

Hallway.zList = { "bg",
                  "coworker",
                  "player",
}

Hallway.staticList = { "bg",
                       "player",
                       "coworker",
                       "door01",
                       "door02",
                       "door03",
                       "door04",
}

return Hallway
