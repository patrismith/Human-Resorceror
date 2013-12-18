local constants = {}


function constants:init()

   self.tilesize = 8
   self.playerdir = { up = { x = 0,
                             y = -1 },
                      down = { x = 0,
                               y = 1 },
                      left = { x = -1,
                               y = 0 },
                      right = { x = 1,
                                y = 0 } }
   self.mapFile = 'testload.txt'
   self.startingRoom = 'YourOffice'

end


return constants
