local FileHall = State:new()

FileHall.music = overworld04bgm

FileHall.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new(),
                       door03 = Exit:new(),
                       door04 = Exit:new(),
                       door05 = Exit:new()
                      }

FileHall.paramList = { bg = { map = 'fileroomhallway.tmx'},
                      player = {},
                      door01 = { x = 29 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Office02',
                                        x = 6 * tilesize,
                                        y = 15 * tilesize },
                      },
                      door02 = { x = 2 * tilesize,
                                 y = 14 * tilesize,
                                 dest = { name = 'Hallway04',
                                          x = 28 * tilesize,
                                          y = 16 * tilesize },
                      },
                      door03 = { x = 22 * tilesize,
                                 y = 12 * tilesize,
                                 dest = { name = 'Office03',
                                          x = 6 * tilesize,
                                          y = 15 * tilesize },
                      },
                      door04 = { x = 15 * tilesize,
                                 y = 12 * tilesize,
                                 dest = { name = 'Office05',
                                          x = 6 * tilesize,
                                          y = 15 * tilesize },
                      },
                      door05 = { x = 8 * tilesize,
                                 y = 12 * tilesize,
                                 dest = { name = 'Computerroom',
                                          x = 6 * tilesize,
                                          y = 15 * tilesize },
                      },
                     }

FileHall.zList = { "bg",
                  "player",
}

FileHall.staticList = { "bg",
                       "player",
                       "door01",
                       "door02",
                       "door03",
                       "door04",
                       "door05"
}

return FileHall
