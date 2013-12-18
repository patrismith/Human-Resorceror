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
                                y = 0 }
                    }
   self.mapFile = 'testload.txt'
   self.npcFile = 'testnpc.txt'
   self.startingRoom = 'YourOffice'

   self.charsheet = love.graphics.newImage('assets/sprites.png')
   self.sprites = {}
   self.sprites.player = love.graphics.newQuad(0,0,8,8*2,8*8,8*2)
   self.sprites.pigtails = love.graphics.newQuad(8*4,0,8,8*2,8*8,8*2)

   self.status = {}
   self.status.normal = {mapmanager.draw,
                         displaymanager.drawSprites,
                         playermanager.draw,
                         collisionmanager.draw}
   self.status.dialogue = {mapmanager.draw,
                           displaymanager.drawSprites,
                           dialoguemanager.draw}

   dbug.show('constants loaded')

end


function constants.clearTable(tbl)

   for k,_ in pairs(tbl) do
      tbl[k] = nil
   end

end


function constants:pxtotile(n)

   return math.floor(n / self.tilesize)

end


function constants:tiletopx(n)

   return n * self.tilesize

end

return constants
