local YourOffice = State:new()

YourOffice.music = overworld01bgm

YourOffice.objectList = { bg = Map:new(),
                          player = Player:new(),
                          coworker = NPC:new(),
                          intern = NPC:new(),
                          yourcomputer = NPC:new(),
                          othercomputer = NPC:new(),
                          door = Exit:new(),
                        }

YourOffice.paramList = { bg = { map = 'youroffice.tmx', },
                         --important note to self:
                         -- for some reason x, y parameters for the player here are useless :D
                         -- you must set the player's x, y in the dest table for each exit.
                         player = { x = 0 * tilesize,
                                    y = 0 * tilesize },
                         yourcomputer = { x = 19 * tilesize,
                                          y = 10 * tilesize,
                                          name = 'yourcomputer',
                                          heals = true,
                                          dialogue = {
                                             { "You look through conspiracy forums." },
                                             { "You have regained your passion!" } },
                         },
                         othercomputer = { x = 12 * tilesize,
                                           y = 10 * tilesize,
                                           name = 'othercomputer',
                                           dialogue = { { "You don't know the password." } }
                         },
                         coworker = { x = 17 * tilesize,
                                      y = 13 * tilesize,
                                      name = 'coworker',
                                      img = pigtails,
                                      sheet = charsprites,
                                      moves = true,
                                      dialogue = {
                                         { "Hey, partner. Looked on your computer lately?" },
                                         { "Oh, no. I'm not getting into any debates with you!" } },
                         },
                         intern = { x = 15 * tilesize,
                                    y = 10 * tilesize,
                                    name = 'intern',
                                    img = mustache,
                                    sheet = charsprites,
                                    attacks = true,
                                    dialogue = {
                                       { "Hi! I'm a new intern with the company."},
                                       { "I've been assigned to help you with any tasks you have." },
                                       { "Let's practice conversing. I'll be frank ... " },
                                       { "Conversation is just one big game of rock, paper, scissors."},
                                       { "Except the rules change at the beginning of every conversation." },
                                       { "Confusing? Go a few rounds with me and you'll get the hang of it."}, },
                         },
                         door = { x = 27 * tilesize,
                                  y = 14 * tilesize,
                                  dest = { name = "Hallway",
                                           x = 3 * tilesize,
                                           y = 16 * tilesize },
                         },
                       }

YourOffice.zList = { "bg",
                     "intern",
                     "coworker",
                     "player",
                     "yourcomputer",
                     "othercomputer"
}

YourOffice.staticList = { "bg",
                          "player",
                          "intern",
                          "coworker",
                          "yourcomputer",
                          "othercomputer",
                          "door",
}

YourOffice.eventList = {
}


return YourOffice
