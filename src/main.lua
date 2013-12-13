function love.load()

   -- game rooms are stored in a table
   rooms = {}

   -- info about game rooms are stored in a text file
   handle = love.filesystem.newFile('testload.txt')
   roomdata = handle:read()
   handle:close()

   column = 0
   -- split roomdata into lines
   for line in string.gmatch(roomdata, '[^\n]+') do
      column = 0
      temproom = ""
      tempexit = ""
      -- here assign values in a table

      for word in string.gmatch(line, '[^:]+') do
         column = column + 1
         if column == 1 then
            rooms[word] = {}
            rooms[word].exit = {}
            temproom = word
         elseif column == 2 then
            rooms[temproom].music = word
         elseif column == 3 then
            rooms[temproom].map = word
         elseif (column + 1) % 5 == 0 then
            rooms[temproom].exit[word] = {}
            tempexit = word
         elseif column % 5 == 0 then
            rooms[temproom].exit[tempexit].x = word
         elseif (column - 1) % 5 == 0 then
            rooms[temproom].exit[tempexit].y = word
         elseif (column - 2) % 5 == 0 then
            rooms[temproom].exit[tempexit].destx = word
         elseif (column - 3) % 5 == 0 then
            rooms[temproom].exit[tempexit].desty = word
         end
      end
   end

   for k,v in pairs(rooms) do
      print("Room table contains: " .. k .. ", " .. type(v))
      if type(v) == "table" then
         for k2,v2 in pairs(v) do
            if type(v2) == "string" then
               print(k .. " table contains " .. k2 .. ", " .. v2)
            else
               print(k .. " table contains " .. k2 .. ", " .. type(v2))
               for k3, v3 in pairs(v2) do
                  print(k2 .. " is to " .. k3 .. ", " .. type(v3))
                  for k4, v4 in pairs(v3) do
                     print(k4 .. ", " .. v4)
                  end
               end
            end
         end
      end
   end

end


function love.update(dt)

end


function love.draw()

   love.graphics.print(roomdata,0,0)

end


function love.keypressed(key)

end
