local collision = {}


function collision:addRectangle(x, y)

   local i = #self.solids + 1
   self.solids[i] = {}
   self.solids[i].x = x
   self.solids[i].y = y

end


function collision:addExit(x, y)

   local i = #self.exits + 1
   self.exits[i] = {}
   self.exits[i].x = x
   self.exits[i].y = y

end


function collision:addMover(x, y, name)

   --DBUGprint("Name: " .. name)
   self.movers[name] = {}
   self.movers[name].x = x
   self.movers[name].y = y

end


function collision:updateMover(x, y, name)

   self.movers[name].x = x
   self.movers[name].y = y

end


function collision:exitCheck(x, y)

   --print("x: " .. x .. " y: " .. y .. " player x: " .. self.movers.player.x)
   local val =  collision:compare(self.movers.player.x, self.movers.player.y, x, y, true)
   return val

end

--DBUG for displaying collision areas! very slow!!
--function collision:draw()

   --love.graphics.setColor(255,255,255)

   --for i,v in pairs(self.solids) do
      --love.graphics.rectangle("line", v.x * tilesize, v.y * tilesize, tilesize, tilesize)
   --end

--end


function collision:compare(x, y, xb, yb, mover)

   local within = false

   -- why ...
   if mover then
      within = x >= xb and x <= xb + tilesize and y >= yb and y <= yb + tilesize
   else
      within = x > xb * tilesize and x < xb * tilesize + tilesize and y > yb * tilesize and y < yb * tilesize + tilesize
   end

   return within

end


function collision:canMove(x, y, who)

   -- 'who' is:
   -- the string 'player'
   -- or the name of the NPC (e.g. 'coworker1')

   --DBUGprint("Who: " .. who)
   local testx, testy = x, y
   local canmove = true

   if (testx < 0) or (testy < 0) or (testx + tilesize > 256) or (testy + tilesize > 240) then
      return false
   end

   -- too lazy to functionalize this crap

   if who == 'player' then
      for k, v in pairs(self.movers) do
         --print("k: " .. k)
         if k ~= 'player' then
            --DBUGprint("Not player!")
            --print(testx .. " and " .. testy .. " compared to " .. v.x .. " and " .. v.y .. " of " .. k)
            for i = 0, tilesize, 2 do
               for j = 0, tilesize, 2 do
                  --print(testx + i)
                  if collision:compare(testx + i, testy + j, v.x, v.y, true) then
                     --print("This should now return false")
                     return false, k
                  end
               end
            end
         end
      end
   else
      for k, v in pairs(self.movers) do
         if k ~= who then
            for i = 0, tilesize, 2 do
               for j = 0, tilesize, 2 do
                  if collision:compare(testx + i, testy + j, v.x, v.y, true) then
                     return false
                  end
               end
            end
         end
      end
   end

   -- oh my gosh this is slow!
   for _, v in pairs(self.solids) do
      for i = 0, tilesize, 2 do
         for j = 0, tilesize, 2 do
            if collision:compare(testx + i, testy + j, v.x, v.y) then
               --print("Collision true!")
               return false
            end
         end
      end
   end

   --DBUGif not canmove then print("false") end
   return canmove

end


function collision:isNextTo(x, y, name)

   local _, who = collision:canMove(x - 1, y, name)

   if who == nil then _, who = collision:canMove(x + 1, y, name) end
   if who == nil then _, who = collision:canMove(x, y - 1, name) end
   if who == nil then _, who = collision:canMove(x, y + 1, name) end

   return who

end


function collision:destroy()

   for k, _ in pairs(self.solids) do
      --print("Deleting " .. k .. " from solids")
      self.solids[k] = nil
   end

   for k, _ in pairs(self.movers) do
      --print("Deleting " .. k .. " from movers")
      self.solids[k] = nil
   end

   for k, _ in pairs(self.exits) do
      --print("Deleting " .. k .. " from exits")
      self.solids[k] = nil
   end

end


function collision:init()

   print("collision init")
   self.solids = {}
   self.movers = {}
   self.exits = {}

end


return collision
