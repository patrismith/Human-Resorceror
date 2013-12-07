local DialogueBoxSeries = class:new()


function DialogueBoxSeries:init(params)

   --params should be a list of tables
   -- each table is [1] text [2] the character speaking
   local params = params or {}

   self.list = {}

   for i,v in ipairs(params) do
      table.insert(self.list, DialogueBox:new())
      self.list[i]:init({text = v[1], img = v[2]})
   end

   self.curr = 1

end


function DialogueBoxSeries:update(dt)

   if self.list[self.curr] and self.active then
      self.list[self.curr]:update(dt)
   end

end


function DialogueBoxSeries:draw()

   if self.list[self.curr] and self.active then
      self.list[self.curr]:draw()
   end

end


function DialogueBoxSeries:keypressed(key)

   statemanager:freezePlayer(true)

   if self.list[self.curr].complete then
      self.list[self.curr].complete = false
      if key == " " or self.k == 'any' then
         if self.active then
            self.curr = self.curr + 1
            if not self.list[self.curr] then
               self.active = false
               if combat.triggered then combat.ready = true end
               statemanager:freezePlayer(false)
               --reset the dialogue in case we wanna call it again
               self.curr = 1
            end
         end
      end
   end

end


return DialogueBoxSeries
