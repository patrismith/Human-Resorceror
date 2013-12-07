local enemyturn = class:new()


function enemyturn:load()

   self.text = "The " .. combat.currenemy.name .. " speaks "
   self.tone = math.random(1,3)
   if self.tone == 1 then self.tone = 'a'
      self.text = self.text .. "aggressively:"
   elseif self.tone == 2 then self.tone = 'n'
      self.text = self.text .. "neutrally:"
   elseif self.tone == 3 then self.tone = 'p'
      self.text = self.text .. "passively:"
   end

   combat.enemytone = self.tone

   self.dialogue = DialogueBox:new()
   self.dialogue:init({text = self.text})

   self.show = false

end


function enemyturn:update(dt)

   self.dialogue:update(dt)

end


function enemyturn:draw()

   self.dialogue:draw()

end


function enemyturn:keypressed(key)

   if self.show then
      if key == " " and self.dialogue.complete then
         combat:nextTurn()
      end
   elseif key == " " and self.dialogue.complete then
      self.text = combat.enemylines[self.tone][math.random(1,#combat.enemylines[self.tone])]
      self.dialogue:init({text = self.text})
      self.show = true
   end

end


return enemyturn
