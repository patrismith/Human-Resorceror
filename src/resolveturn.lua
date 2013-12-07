local resolveturn = class:new()


function resolveturn:load(enemy)

   for i, v in ipairs(combat.rules) do
      --print("testing " .. i .. " which is " .. v)
      if v == combat.playertone then
         --print(v)
         --print(i)
         combat.playertone = i
         --print("player is " .. i)
      end
      if v == combat.enemytone then
         --print(v)
         --print(i)
         combat.enemytone = i
         --print("enemy is " .. i)
      end
   end

   --print("enemy is " .. combat.enemytone)
   self.result = (combat.playertone - combat.enemytone) % 3
   --print("result is " .. self.result)
   if self.result == 0 then
      self.text = 'No one got anywhere with their argument!'
   elseif self.result == 1 then
      self.damage = math.random(1,combat.currenemy.LVL)
      playerstats.PP.cur = playerstats.PP.cur - self.damage
      self.text = 'The ' .. combat.currenemy.name .. ' made you look foolish!\nYou lost ' .. self.damage .. ' PP!'

   else
      self.damage = math.random(1,playerstats.LVL)
      combat.currenemy.PP.cur = combat.currenemy.PP.cur - self.damage
      self.text = 'You shocked the ' .. combat.currenemy.name .. ' with your unconventional line of thought!\nThey lost ' .. self.damage .. ' PP!'

   end

   self.dialogue = DialogueBox:new()
   self.dialogue:init({text = self.text})

end


function resolveturn:checkHealth()

   if combat.currenemy.PP.cur <= 0 then
      return 'player'
   elseif playerstats.PP.cur <= 0 then
      return 'enemy'
   else
      return 'none'
   end

end


function resolveturn:update(dt)

   --print("resolveturn update")
   self.dialogue:update(dt)

end


function resolveturn:draw()

   self.dialogue:draw()

end


function resolveturn:keypressed(key)

   if key == " " and self.dialogue.complete then
      local winner = self:checkHealth()
      print(winner)
      if winner == 'player' or winner == 'enemy' then
         combat.currturn = 'end'
         combat.turn[combat.currturn]:load(winner)
      else
         combat:nextTurn()
      end
   end

end


return resolveturn
