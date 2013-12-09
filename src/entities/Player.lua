local Player = class:new()


function Player:init(params)

   local params = params or {}

   print("player init")
   self.x = params.x or 0
   self.y = params.y or 0
   self.name = 'player'
   collision:addMover(self.x, self.y, self.name)


end


function Player:draw()

   --DBUGprint("Player:draw() drawn")
   love.graphics.setColor(255,255,255)

   --love.graphics.rectangle("fill", self.x, self.y, 8, 8)
   love.graphics.drawq(charsprites,playerimg,self.x,self.y-tilesize)

   love.graphics.setColor(255,255,255)

end


function Player:update(dt)

   if not self.frozen then
      if love.keyboard.isDown('left') then
         if collision:canMove(self.x - 1, self.y, self.name) then
            self.x = self.x - 1 end end
      if love.keyboard.isDown('right') then
         if collision:canMove(self.x + 1, self.y, self.name) then
            self.x = self.x + 1 end end
      if love.keyboard.isDown('up') then
         if collision:canMove(self.x, self.y - 1, self.name) then
            self.y = self.y - 1 end end
      if love.keyboard.isDown('down') then
         if collision:canMove(self.x, self.y + 1, self.name) then
            self.y = self.y + 1 end end

   collision:updateMover(self.x, self.y, self.name)

   end

end


function Player:keypressed(key)

   if key == ' ' then
      -- repeat the below for all directions
      local who = collision:isNextTo(self.x, self.y, self.name)
      if who then
         --print("talky to " .. who or "nobody")
         statemanager:initiateChat(who)
      end
   end

   --if key == 'escape' then
   --   print("when esc is pressed: " .. playerstats.PP.cur)
   --   playerstats:toggleMenu()
   --end

end


return Player
