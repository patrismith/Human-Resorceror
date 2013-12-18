local playermanager = {}


function playermanager:init(xtile, ytile)

   self.location = {}
   self:teleport(xtile, ytile)

end


function playermanager:teleport(xtile, ytile)
   -- change the player's location, tilewise
   dbug.show('moving player to ' .. xtile .. ', ' .. ytile)
   self.location = {x = xtile * constants.tilesize,
                    y = ytile * constants.tilesize}

end


function playermanager:render()

   if self.location then
      --test
      love.graphics.setColor(0,0,255)
      love.graphics.rectangle("line",self.location.x,self.location.y - 8,8,8)
      love.graphics.setColor(255,255,255)
      love.graphics.rectangle("fill",self.location.x,self.location.y,8,8)

      if dbugglobal then
         love.graphics.print('px: ' .. self.location.x .. ', ' .. self.location.y,0,0)
         love.graphics.print('tile: ' .. collisionmanager:pxtotile(self.location.x) .. ', ' .. collisionmanager:pxtotile(self.location.y),0,20)
      end

   end

end


function playermanager.draw()

   playermanager:render()

end


function playermanager:exit(dest)

   collisionmanager:clearAll()
   mapmanager:loadMap(dest.map)
   self:teleport(dest.xtile, dest.ytile)

end


function playermanager:update(dt)

   -- this is the moving part of the ride
   for k,v in pairs(constants.playerdir) do
      if love.keyboard.isDown(k) then

         local xtemp = self.location.x + v.x
         local ytemp = self.location.y + v.y
         local collide, dest = collisionmanager:detect(xtemp, ytemp)
         if collide ~= 'solid' then
            self.location.x = xtemp
            self.location.y = ytemp
            if collide == 'exit' then
               dbug.show(dest.map)
               self:exit(dest)
            end
         end

      end
   end

end


return playermanager
