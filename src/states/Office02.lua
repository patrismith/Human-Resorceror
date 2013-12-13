local Office02 = State:new()

Office02.music = overworld01bgm

Office02.objectList = { bg = Map:new(),
                       player = Player:new(),
                       worker01 = NPC:new(),
                       worker02 = NPC:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Office02.paramList = { bg = { map = 'coworkeroffice02.tmx'},
                      player = {},
                      worker01 = { x = 16 * tilesize,
                                   y = 13 * tilesize,
                                   name = 'worker01',
                                   img = oldtwo,
                                   sheet = charsprites,
                                   dialogue = {
                                      {"My dad thinks I'm a failure, but I'll show him!"},},},
                      worker02 = { x = 10 * tilesize,
                                   y = 17 * tilesize,
                                   name = 'worker02',
                                   img = fashionable,
                                   sheet = charsprites,
                                   moves = true,
                                   dialogue = {
                                      {"I've heard the new CEO is a little weird. What have you heard?"},},},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Hallway',
                                        x = 16 * tilesize,
                                        y = 14 * tilesize },
                      },
                      door02 = { x = 4 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'FileHall',
                                          x = 28 * tilesize,
                                          y = 15 * tilesize },
                      },
                     }

Office02.zList = { "bg",
                   "worker01",
                   "worker02",
                  "player",
}

Office02.staticList = { "bg",
                       "player",
                       "door01",
                       "door02",
                       "worker01",
                       "worker02",
}

return Office02
