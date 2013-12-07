local State = class:new()

-- TODO: come up with function wrapper that checks for self.objects
-- TODO: check what empty table is equal to


function State:load(x, y)

   if self.music then
      love.audio.rewind(self.music)
      love.audio.stop()
      love.audio.play(self.music)
   end

   -- all entities that will appear in or affect the scene, should be in this table
   self.objects = self.objectList or {}
   -- entities in objectList that will be drawn at some point
   self.z = self.zList or {}
   -- entities in objectList that will always be active
   self.static = self.staticList or {}
   -- chronological ordering of entities that will temporarily be active
   self.events = self.eventList or {}

   -- start with the first event in the state's eventList
   self.currevent = 1

   -- initialize all entities with their parameters
   for k,v in pairs(self.paramList) do
      self.objects[k]:init(v)
   end

   if x then self.objects.player.x = x end
   if y then self.objects.player.y = y end

   -- mark everything in self.static as active
   for i,v in ipairs(self.static) do
      print(i)
      print(v)
      if self.objects[v] then
         self.objects[v].active = true
      end
   end

   -- mark the first entity in self.events as active
   if self.objects[self.events] then
      self.objects[self.events[self.currevent]].active = true
   end

   -- everything will be drawn to a canvas
   self.canvas = love.graphics.newCanvas(256, 240)
   self.canvas:setFilter("nearest","nearest")

end


function State:update(dt)

   -- events in self.events are ordered by number
   -- the index of the currently active event is represented by self.currevent
   -- make sure we have an event that matches self.currevent first
   if self.events[self.currevent] then
      -- if the event that matches self.currevent is inactive,
      -- increment the current event
      if not self.objects[self.events[self.currevent]].active then
         self.currevent = self.currevent + 1
         -- make sure there's an event that matches the new current event,
         -- and mark it as active
         ---- remember, if an entity is added to self.events after the
         ---- last event has been marked inactive, the new event will
         ---- have to be manually marked as active (i.e. the following code
         ---- won't work).
         if self.objects[self.events[self.currevent]] then
            self.objects[self.events[self.currevent]].active = true
         end

      end
   end

   -- update all the active entities
   if self.objects then
      for _,v in pairs(self.objects) do
         if v.active and v.update then
            v:update(dt)
         end
      end
   end

  -- used for non standard update functions
   if self.customupdate then
      self:customupdate(dt)
   end

end


function State:draw()

   --DBUGprint("entered state:draw")
   love.graphics.setCanvas(self.canvas)
   self.canvas:clear()
   love.graphics.setBlendMode('alpha')
   -- go through everything in the z table and draw it to canvas in the indexed order
   if self.z and self.objects then
      for _,v in ipairs(self.z) do
         if self.objects[v].active and self.objects[v].draw then
            --DBUGprint("drawing object " .. v )
            self.objects[v]:draw()
         end
      end
   end

   playerstats:draw()

   --DBUG
   --love.graphics.setColor(255,255,255)
   --love.graphics.rectangle("line", 0,0,500,400)
   --collision:draw()

   --unset the canvas
   love.graphics.setCanvas()
   -- the following is so the color will be rendered properly
   love.graphics.setBlendMode('premultiplied')

   love.graphics.draw(self.canvas,0,0,0,scale)
   -- do we really need to set the canvas twice? oh well
   love.graphics.setCanvas(self.canvas)

end


function State:keypressed(key)


   --print("state keypressed before: " .. playerstats.PP.cur)
   -- route keypressed calls to individual objects
   if self.objects then
      for i,v in pairs(self.objects) do
         if v.active and v.keypressed then
            v:keypressed(key)
            --print(i .. " makes it " .. playerstats.PP.cur)
         end
      end
   end

end


return State
