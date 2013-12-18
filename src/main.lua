ATL = require('Advanced-Tiled-Loader')

gamemanager = require('libs.gamemanager')
constants = require('libs.constants')
collisionmanager = require('libs.collisionmanager')
mapmanager = require('libs.mapmanager')
displaymanager = require('libs.displaymanager')
playermanager = require('libs.playermanager')
dbug = require('libs.dbug')

dbugglobal = true

function love.load()

   ATL.Loader.path = 'assets/maps/'

   gamemanager:init()

end


function love.update(dt)

   gamemanager:update(dt)

end


function love.draw()

   displaymanager:draw()

end


function love.keypressed(key)

   if key == '`' then
      dbugglobal = not dbugglobal
   else
      gamemanager:keypressed(key)
   end

end
