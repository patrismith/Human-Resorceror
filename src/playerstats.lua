local playerstats = {}


function playerstats:toggleMenu()

   --print("when playerstats is called: " .. playerstats.PP.cur)
   self.menu = not self.menu

end


function playerstats:levelup()

   self.LVL = self.LVL + 1
   self.EXP.cur = self.EXP.cur - self.EXP.max
   self.EXP.max = (math.floor(0.5 * self.EXP.max)) + self.EXP.max
   self.PP.max = (math.floor(0.5 * self.PP.max)) + self.PP.max
   self.PP.cur = self.PP.max

end


function playerstats:draw()

   --if self.menu then

      love.graphics.setColor(255,255,255)

      love.graphics.printf("PP: " .. self.PP.cur .. " of " .. self.PP.max .. "    EXP: " .. self.EXP.cur .. " of " .. self.EXP.max .. "    LEVEL: " .. self.LVL, 0, tilesize, 31 * tilesize, "center")

   --end

end


function playerstats:init()

   --print("playerinit")
   -- this is the game start!
   -- pp is 'passion points'. like hit points
   self.PP = { min = 0,
          max = 10,
          cur = 10 }
   -- exp is experience points, you collect during battle
   -- when cur hits max, LVL increments and EXP max is raised
   -- no minimum since i don't plan on making it decrease
   self.EXP = { max = 10,
           cur = 0 }
   -- LVL is a simple number representing your 'power'
   self.LVL = 1

   self.menu = false

end

return playerstats
