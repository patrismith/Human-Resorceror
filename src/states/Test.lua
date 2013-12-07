local Test = State:new()

Test.objectList = { bg = Map:new(),
                    player = Player:new(),
                    door = Exit:new(),
                }

Test.paramList = { bg = { map = 'testmap.tmx',
                           },
                   player = {},
                   door = { x = 2 * tilesize,
                            y = 14 * tilesize,
                            dest = { name = "YourOffice",
                                     x = 26 * tilesize,
                                     y = 15 * tilesize }
                   }
               }

Test.zList = { "bg",
               "player"
           }

Test.staticList = { "bg",
                    "player",
                    "door"
                }

Test.eventList = {
}


return Test
