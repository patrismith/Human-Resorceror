local introturn = class:new()


function introturn:load(enemy)

   self.dialogue = DialogueBox:new()
   self.dialogue:init({text = "You start a conversation with the " .. enemy .. "."})

end


function introturn:update(dt)

   --print("introturn update")
   self.dialogue:update(dt)

end


function introturn:draw()

   self.dialogue:draw()

end


function introturn:keypressed(key)

   if key == " " and self.dialogue.complete then
      combat:nextTurn()
   end

end


return introturn
