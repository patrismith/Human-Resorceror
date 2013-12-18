local npcmanager = {}


local function strtobool(str)

   return str == 'true' and true or false

end


function npcmanager.parse(f, t)

   -- bad, evil copypaste

   h = love.filesystem.newFile(f)
   data = h:read()
   h:close()

   local column, currroom, currexit
   for line in string.gmatch(data, '[^\n]+') do
      column = 0
      currroom = ""
      currname = ""
      for word in string.gmatch(line, '[^:]+') do
         column = column + 1
         if column == 1 then
            t[word] = {}
            currroom = word
         elseif column == 2 then
            t[currroom][word] = {}
            currname = word
         elseif column == 3 then
            t[currroom][currname].img = word
         elseif column == 4 then
            t[currroom][currname].xtile = tonumber(word)
         elseif column == 5 then
            t[currroom][currname].ytile = tonumber(word)
         elseif column == 6 then
            t[currroom][currname].moves = strtobool(word)
         elseif column == 7 then
            t[currroom][currname].fights = strtobool(word)
         elseif column == 8 then
            t[currroom][currname].heals = strtobool(word)
         elseif column == 9 then
            t[currroom][currname].dialogue = {}
            t[currroom][currname].dialogue.pre = {}
            for phrase in string.gmatch(word, '[^/*]+') do
               table.insert(t[currroom][currname].dialogue.pre, phrase)
            end
         end
      end
   end

end


function npcmanager:init()

   self.npcs = {}
   self.parse(constants.npcFile, self.npcs)

end


function npcmanager:loadNPCs(map)

   if self.npcs[map] then
      for k,v in pairs(self.npcs[map]) do
         displaymanager:addSprite(k,constants:tiletopx(v.xtile),constants:tiletopx(v.ytile),v.img)
         collisionmanager:addTile({xtile = v.xtile, ytile = v.ytile, id = 'npc', name = k})
      end
   end

end


function npcmanager:talk(map, name)

   dialoguemanager:startDialogue(self.npcs[map][name].dialogue.pre or nil)

end


return npcmanager
