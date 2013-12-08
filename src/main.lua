--constants = require('constants')
statemanager = require('statemanager')
class = require('class')
collision = require('collision')
playerstats = require('playerstats')
combat = require('combat')
ATL = require('Advanced-Tiled-Loader')

State = require('states.State')

Map = require('entities.Map')
Player = require('entities.Player')
NPC = require('entities.NPC')
DialogueBox = require('entities.DialogueBox')
DialogueBoxSeries = require('entities.DialogueBoxSeries')
Exit = require('entities.Exit')

introturn = require('introturn')
playerturn = require('playerturn')
enemyturn = require('enemyturn')
resolveturn = require('resolveturn')
endturn = require('endturn')

tilesize = 8

function love.load()

   ATL.Loader.path = 'assets/maps/'

   collision:init()
   combat:init()
   playerstats:init()

   love.graphics.setColorMode('replace')
   love.graphics.setLine(1,'rough')

   local img = love.graphics.newImage('assets/littlefont.png')
   img:setFilter("nearest","nearest")
   dialogueFont = love.graphics.newImageFont(img, " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,!'\"-:?")

   othersprites = love.graphics.newImage('assets/maps/tileset.png')
   charsprites = love.graphics.newImage('assets/sprites.png')
   playerimg = love.graphics.newQuad(0,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   mustache = love.graphics.newQuad(tilesize,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   oldone = love.graphics.newQuad(tilesize*2,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   pigtails = love.graphics.newQuad(tilesize*3,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   fashionable = love.graphics.newQuad(tilesize*4,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   oldtwo = love.graphics.newQuad(tilesize*5,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   boss = love.graphics.newQuad(tilesize*6,0,tilesize,tilesize*2,tilesize*8,tilesize*2)

   computerq = love.graphics.newQuad(48,24,tilesize,tilesize,256,240)

   statemanager:init()

   love.graphics.setFont(dialogueFont)

end


function love.update(dt)

   statemanager:update(dt)

end


function love.draw()

   statemanager:draw()

end


function love.keypressed(key)

   statemanager:keypressed(key)

end
