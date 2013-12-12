local Eyeroom = State:new()

Eyeroom.music = overworld03bgm

Eyeroom.objectList = { bg = Map:new(),
                       player = Player:new(),
                       door01 = Exit:new(),
                       door02 = Exit:new()
                      }

Eyeroom.paramList = { bg = { map = 'eyeroom.tmx'},
                      player = {},
                      door01 = { x = 27 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Ceoroom',
                                        x = 5 * tilesize,
                                        y = 16 * tilesize },
                      },
                     }

Eyeroom.zList = { "bg",
                  "player",
}

Eyeroom.staticList = { "bg",
                       "player",
                       "door01",
}

return Eyeroom
