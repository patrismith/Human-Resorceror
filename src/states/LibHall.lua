local LibHall = State:new()

LibHall.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new(),
                       door03 = Exit:new()
                      }

LibHall.paramList = { bg = { map = 'libraryhallway.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Office01',
                                        x = 5 * tilesize,
                                        y = 15 * tilesize },
                      },
                      door02 = { x = 8 * tilesize,
                                 y = 6 * tilesize,
                                 dest = { name = 'Office04',
                                          x = 5 * tilesize,
                                          y = 15 * tilesize },
                      },
                      door03 = { x = 2 * tilesize,
                                 y = 4 * tilesize,
                                 dest = { name = 'Office06',
                                          x = 26 * tilesize,
                                          y = 16 * tilesize },
                      },
                     }

LibHall.zList = { "bg",
                  "player",
}

LibHall.staticList = { "bg",
                       "player",
                       "door01",
                       "door02",
                       "door03"
}

return LibHall
