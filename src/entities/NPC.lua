local NPC = class:new()


function NPC:init(params)

   local params = params or {}

   self.x = params.x or 0
   self.y = params.y or 0

   -- name is necessary for identification (string)
   self.name = params.name
   collision:addMover(self.x, self.y, self.name)

   self.dialogue = DialogueBoxSeries:new()
   if params.dialogue then self.dialogue:init(params.dialogue) end

   -- these describe what actions the NPC performs
   -- moves means it moves around, attacks means it will attack player
   if params.moves then self.moves = params.moves end
   if params.attacks then self.attacks = params.attacks end
   if params.heals then self.heals = params.heals end

   -- timer for when to move
   self.movetimer = 0
   self.movealarm = math.random(200,250)
   -- coords to move to
   self.tx = self.x
   self.ty = self.y

   self.img = params.img
   self.sheet = params.sheet
   print("tipe for " .. self.name)
   print(type(params.tipe))
   print(type(params.img))

end


function NPC:talk()

   print(self.name .. " is talking.")
   self.dialogue.active = true
   if self.attacks and playerstats.PP.cur ~= 0 then combat.triggered = true end

end


function NPC:draw()

   --DBUGprint("NPC:draw() drawn")
   love.graphics.setColor(255,255,255)

   --love.graphics.rectangle("fill", self.x, self.y, 8, 8)
   if self.img then
      love.graphics.drawq(self.sheet,self.img,self.x,self.y-tilesize)
   end

   if self.dialogue.active then self.dialogue:draw() end


   love.graphics.setColor(255,255,255)

end


function NPC:update(dt)

   --put move pattern here
   -- right now only using random move pattern
   if self.moves then

      self.movetimer = self.movetimer + 1

      if self.movetimer >= self.movealarm then
         self.movetimer = 0
         self.movealarm = math.random(200,250)
         self.tx = self.x + math.random(-16,16)
         self.ty = self.y + math.random(-16,16)
      end


      if self.x < self.tx and collision:canMove(self.x + 1, self.y, self.name) then
         self.x = self.x + 1
      elseif self.x > self.tx and collision:canMove(self.x - 1, self.y, self.name) then
         self.x = self.x - 1
      end

      if self.y < self.ty and collision:canMove(self.x, self.y + 1, self.name) then
         self.y = self.y + 1
      elseif self.y > self.ty and collision:canMove(self.x, self.y - 1, self.name) then
         self.y = self.y - 1
      end

   end

   if self.dialogue.active then
      --print("dialogue for " .. self.name .. " is active")
      self.dialogue:update(dt)
   elseif self.attacks and combat.ready and not self.dialogue.active then
      --print("combat.ready and dialogue not active for " .. self.name)
      --attacking waits till after the dialogue
      combat:load(self.name)
   elseif not self.dialogue.active then
      collision:updateMover(self.x, self.y, self.name)
   end

end


function NPC:keypressed(key)

   if self.dialogue.active then
      self.dialogue:keypressed(key)
      if self.heals then
         playerstats.PP.cur = playerstats.PP.max
      end
   end

end


return NPC
