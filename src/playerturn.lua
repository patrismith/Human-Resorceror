local playerturn = class:new()


function playerturn:load()

   self.menu = DialogueBox:new()
   self.dialogue = DialogueBox:new()
   self.introtext = "In which tone would you like to speak?\n\n"
   self.aggrotext = " Aggressive\n"
   self.neutrtext = " Neutral\n"
   self.passitext = " Passive\n"
   self.arrow = "---"
   self.text, self.tone = self:choose(1)
   self.menu:init({text = self.text})
   self.show = false

end


function playerturn:choose(n)

   if n == 1 then
      return self.introtext .. self.arrow .. self.aggrotext .. self.neutrtext .. self.passitext, 1
   elseif n == 2 then
      return self.introtext .. self.aggrotext .. self.arrow .. self.neutrtext .. self.passitext, 2
   elseif n == 3 then
      return self.introtext .. self.aggrotext .. self.neutrtext .. self.arrow .. self.passitext, 3
   end

end


function playerturn:update(dt)

   if self.show then
      self.dialogue:update(dt)
   else
      self.menu:update(dt)
   end

end


function playerturn:draw()

   if self.show then
      self.dialogue:draw()
   else
      self.menu:draw()
   end

end


function playerturn:keypressed(key)

   if self.show then
      if key == " " and self.dialogue.complete then
         combat:nextTurn()
      end
   else
      if key == "up" and self.tone ~= 1 then
         self.text, self.tone = self:choose(self.tone - 1)
         self.menu.currtext = self.text
      elseif key == "down" and self.tone ~= 3 then
         self.text, self.tone = self:choose(self.tone + 1)
         self.menu.currtext = self.text
      elseif key == " " or key == "enter" then
         if self.tone == 1 then self.tone = 'a'
         elseif self.tone == 2 then self.tone = 'n'
         elseif self.tone == 3 then self.tone = 'p'
         end
         combat.playertone = self.tone
         self.text = combat.playerlines[self.tone][math.random(1,#combat.playerlines[self.tone])]
         print(self.text)
         self.dialogue:init({text = self.text})
         self.show = true
      end
   end

end


return playerturn
