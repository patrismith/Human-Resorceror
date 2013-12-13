ATL = require('Advanced-Tiled-Loader')

function love.load()

   ATL.Loader.path = 'assets/maps/'

   -- game rooms are stored in a table
   rooms = {}

   -- info about game rooms are stored in a text file
   handle = love.filesystem.newFile('testload.txt')
   roomdata = handle:read()
   handle:close()

   column = 0
   -- split roomdata into lines
   -- roomdata follows a format like:
   -- name of room:music variable:map filename
   -- then for every exit, room to exit to:x:y:destination x:dest y
   -- x and y are in tiles, not pixels
   for line in string.gmatch(roomdata, '[^\n]+') do
      -- for every line, reset the temp variables
      column = 0
      temproom = ""
      tempexit = ""
      for word in string.gmatch(line, '[^:]+') do
         -- assign values to the room table depending on what column the word is in
         column = column + 1
         if column == 1 then
            rooms[word] = {}
            rooms[word].exit = {}
            temproom = word
         elseif column == 2 then
            rooms[temproom].music = word
         elseif column == 3 then
            rooms[temproom].map = word
         --below is the code for creating exits
         --it will break if the format is not followed!
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

   begin = "Youroffice"
   print(rooms[begin].map)

   drawmap = ATL.Loader.load(rooms[begin].map)

end


function love.update(dt)

end


function love.draw()

   drawmap:draw()

end


function love.keypressed(key)

end
