local collisionmanager = {}


function collisionmanager:init()

   self.tiles = {}
end


function collisionmanager:clearTable(tbl)

   for k,_ in pairs(tbl) do
      tbl[k] = nil
   end

end


function collisionmanager:clearAll()

   self:clearTable(self.tiles)

end


function collisionmanager:addTile(params)

   local params = params or {}
   local tbl = {}

   local toAdd = {xtile = tonumber(params.xtile), ytile = tonumber(params.ytile), id = params.id}
   if params.dest then
      dbug.show('exit added: ' .. params.dest.map)
      toAdd.dest = {xtile = tonumber(params.dest.xtile), ytile = tonumber(params.dest.ytile), map = params.dest.map}
   end

   table.insert(self.tiles, toAdd)

end


function collisionmanager:pxtotile(x)

   return math.floor(x / constants.tilesize)

end


function collisionmanager:tiletopx(x)

   return x * constants.tilesize

end


function collisionmanager:detect(x, y)

   -- detect a square
   local xtile = self:pxtotile(x)
   local ytile = self:pxtotile(y)
   local xtile2 = self:pxtotile(x+constants.tilesize-1)
   local ytile2 = self:pxtotile(y+constants.tilesize-1)

   for i,v in ipairs(self.tiles) do
      --dbug.show(i .. " " .. v.xtile .. " " .. type(v.xtile))
      if ((xtile == v.xtile) or (xtile2 == v.xtile)) and ((ytile == v.ytile) or (ytile2 == v.ytile)) then
         dbug.show('collision registered at ' .. xtile .. ', ' .. ytile .. ', ' .. v.id)
         return v.id, v.dest or nil
      end
   end

   return false

end


function collisionmanager:render()

   --[[
   if dbugglobal then
      for i,v in ipairs(self.solidTiles) do
         love.graphics.rectangle("line", self:tiletopx(v.xtile), self:tiletopx(v.ytile), constants.tilesize, constants.tilesize)
      end
   end
   ---]]

end


function collisionmanager.draw()

   collisionmanager:render()

end



return collisionmanager
