local Map = class:new()


function Map:init(params)

   local params = params or {}

   if params.map then
      self.map = ATL.Loader.load(params.map)

      for i in pairs(self.map.layers) do
         for x, y, tile in self.map(i):iterate() do
            if tile.properties.Solid then
               --print("Solid found @ " .. x .. " " .. y)
               collision:addRectangle(x, y)
            end
         end
      end

   end

end


function Map:draw()

   --DBUGprint("Map:draw() drawn")
   love.graphics.setColor(255,255,255)

   self.map:draw()

   love.graphics.setColor(255,255,255)

end


return Map
