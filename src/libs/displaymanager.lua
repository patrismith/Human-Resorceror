local displaymanager = {}


function displaymanager:init()

   self.canvas = love.graphics.newCanvas(256,240)
   self.canvas:setFilter("nearest","nearest")

   -- let's store the draw functions of other modules in this table
   -- FUTURE: sort by z value
   self.drawfunctions = {}

   self.sprites = {}
   self.spriteindex = {}

   --[[for example
   table.insert(self.drawfunctions, mapmanager.draw)
   table.insert(self.drawfunctions, displaymanager.drawSprites)
   -- for dbug only
   table.insert(self.drawfunctions, playermanager.draw)
   table.insert(self.drawfunctions, collisionmanager.draw)
   --]]

end


function displaymanager:addDrawFuncs(funcs)

   for i,v in ipairs(funcs) do
      table.insert(self.drawfunctions, v)
   end

end


function displaymanager:clearDrawFuncs()

   constants.clearTable(self.drawfunctions)

end


function displaymanager:resetSprites()

   constants.clearTable(self.sprites)
   constants.clearTable(self.spriteindex)

end


function displaymanager:addSprite(name, x, y, img)

   -- add a player or npc sprite to a key table
   -- if the sprite already exists, update the x/y values of the sprite

   if not self.sprites[name] then
      self.sprites[name] = {}
   end

   -- y is altered because we are assuming all sprites are 8x16 px.
   -- if a different size sprite is needed, alter the x/y values
   -- before passing to this function
   self.sprites[name].x = x
   self.sprites[name].y = y-constants.tilesize

   self.sprites[name].img = img

   self:updateSpriteindex()

end


function displaymanager:updateSpriteindex()

   -- add sprites from the key table (self.sprites) to this indexed table
   --so we can sort them all by y-position

   -- wipe the table of old sprites
   constants.clearTable(self.spriteindex)

   for k,v in pairs(self.sprites) do
      --dbug.show('updater: ' .. v.img)
      table.insert(self.spriteindex, {img = v.img, x = v.x, y = v.y})
   end

   -- sort table by y value
   table.sort(self.spriteindex, function(a,b) return a.y<b.y end)

end


function displaymanager:renderSprites()


   for i,v in ipairs(self.spriteindex) do
      --dbug.show(i .. ' ' .. type(v))
      --dbug.show(v.img .. ' ' .. v.x .. ' ' .. v.y)
      love.graphics.drawq(constants.charsheet, constants.sprites[v.img], v.x, v.y)
   end

end


function displaymanager.drawSprites()

   displaymanager:renderSprites()

end

-- subtract draw functions from table


function displaymanager:draw()

   if self.canvas and self.drawfunctions then
      -- canvas wrapper begin
      love.graphics.setCanvas(self.canvas)
      self.canvas:clear()
      love.graphics.setBlendMode('alpha')

      -- run draw functions from a table
      for _,v in ipairs(self.drawfunctions) do
         v()
      end

      -- canvas wrapper end
      love.graphics.setCanvas()
      love.graphics.setBlendMode('premultiplied')
      love.graphics.draw(self.canvas,0,0,0,scale)
   end

end

return displaymanager
