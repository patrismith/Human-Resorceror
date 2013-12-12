local endturn = class:new()


function endturn:load(winner)

   self.levelup = nil
   self.show = nil
   --print('endturn loading')
   --print('player health is: ' .. playerstats.PP.cur)
   love.audio.rewind(defaultmusic)
   love.audio.stop()
   love.audio.play(defaultmusic)
   self.dialogue = DialogueBox:new()
   if winner == 'player' then
      local exp = 2 * combat.currenemy.LVL
      playerstats.EXP.cur = playerstats.EXP.cur + exp
      self.endtext = 'The ' .. combat.currenemy.name .. ' is fed up with your circular reasoning!\nYou gain ' .. exp .. ' exp!'
      if playerstats.EXP.cur >= playerstats.EXP.max then
         playerstats:levelup()
         self.levelup = DialogueBox:new()
         self.levelup:init({text = "You gained a level! Your arguments have more force now!"})
      end
   else
      self.endtext = "You're out of passion! You can no longer argue!"
   end

   self.dialogue:init({text = self.endtext})

end


function endturn:update(dt)

   if self.show == true and self.levelup then
      self.levelup:update(dt)
   else
      --print("endturn update")
      self.dialogue:update(dt)
   end

end


function endturn:draw()

   if self.show == true and self.levelup then
      self.levelup:draw()
   else
      self.dialogue:draw()
   end

end


function endturn:keypressed(key)

   if key == " " and self.dialogue.complete then
      if self.levelup then
         self.show = true
      else
         combat:finish()
      end
      if key == " " and self.show and self.levelup.complete then
         combat:finish()
      end
   end

end


return endturn
