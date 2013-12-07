local Exit = class:new()


function Exit:init(params)

   local params = params or {}

   self.x = params.x or 0
   self.y = params.y or 0

   -- dest is map name, and x, y to transport player to
   self.dest = {}
   self.dest.name = params.dest.name
   self.dest.x = params.dest.x
   self.dest.y = params.dest.y

   collision:addExit(self.x, self.y)


end


function Exit:update(dt)

   if collision:exitCheck(self.x, self.y) then
      print("over exit")
      statemanager:change(self.dest.name, self.dest.x, self.dest.y)
   end

end


return Exit
