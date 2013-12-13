local Ceooffice = State:new()

Ceooffice.music = overworld03bgm

Ceooffice.objectList = { bg = Map:new(),
                       player = Player:new(),
                       ceo = NPC:new(),
                       door = Exit:new(),
                      }

Ceooffice.paramList = { bg = { map = 'ceooffice.tmx'},
                      player = {},
                      ceo = { x = 15 * tilesize,
                              y = 7 * tilesize,
                              name = 'ceo',
                              img = boss,
                              sheet = charsprites,
                              attacks = true,
                              dialogue = {
                                 {"You're the only one who has been able to recognize my true form. Now, I must dispose of you."},
                                 {"By the time I finish arguing with you, you won't know what's what!"},},
                      },
                      door = { x = 4 * tilesize,
                               y = 14 * tilesize,
                               dest = { name = 'Deadend02', -- replace
                                        x = 13 * tilesize,
                                        y = 13 * tilesize },
                      },
                     }

Ceooffice.zList = { "bg",
                  "player",
                  "ceo",
}

Ceooffice.staticList = { "bg",
                       "player",
                       "ceo",
                       "door",
}

return Ceooffice
