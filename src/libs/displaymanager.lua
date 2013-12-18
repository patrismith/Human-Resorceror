local displaymanager = {}


function displaymanager:init()

   self.canvas = love.graphics.newCanvas(256,240)
   self.canvas:setFilter("nearest","nearest")

   -- let's store the draw functions of other modules in this table
   -- FUTURE: sort by z value
   self.drawfunctions = {}

   -- for example
   table.insert(self.drawfunctions, mapmanager.draw)
   table.insert(self.drawfunctions, playermanager.draw)
   table.insert(self.drawfunctions, collisionmanager.draw)

end


function displaymanager:add()
   -- add draw functions to table


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
