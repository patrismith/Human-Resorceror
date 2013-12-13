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

   -- npc and player sprites
   charsprites = love.graphics.newImage('assets/sprites.png')
   playerimg = love.graphics.newQuad(0,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   mustache = love.graphics.newQuad(tilesize,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   oldone = love.graphics.newQuad(tilesize*2,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   pigtails = love.graphics.newQuad(tilesize*3,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   fashionable = love.graphics.newQuad(tilesize*4,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   oldtwo = love.graphics.newQuad(tilesize*5,0,tilesize,tilesize*2,tilesize*8,tilesize*2)
   boss = love.graphics.newQuad(tilesize*6,0,tilesize,tilesize*2,tilesize*8,tilesize*2)

   -- battle images
   guy01battle = love.graphics.newImage('assets/guy01battle.png')
   guy02battle = love.graphics.newImage('assets/guy02battle.png')
   old01battle = love.graphics.newImage('assets/old01battle.png')
   old02battle = love.graphics.newImage('assets/old02battle.png')
   lady01battle = love.graphics.newImage('assets/lady01battle.png')
   lady02battle = love.graphics.newImage('assets/lady02battle.png')

   -- music
   overworld01bgm = love.audio.newSource('assets/music/Overworld01.ogg')
   overworld01bgm:setLooping(true)
   overworld02bgm = love.audio.newSource('assets/music/Overworld02.ogg')
   overworld02bgm:setLooping(true)
   overworld03bgm = love.audio.newSource('assets/music/Overworld03.ogg')
   overworld03bgm:setLooping(true)
   overworld04bgm = love.audio.newSource('assets/music/Overworld04.ogg')
   overworld04bgm:setLooping(true)
   battlebgm = love.audio.newSource('assets/music/Battle.ogg')
   battlebgm:setLooping(true)

   defaultmusic = battlebgm

   collision:init()
   combat:init()
   playerstats:init()

   love.graphics.setColorMode('replace')
   love.graphics.setLine(1,'rough')

   local img = love.graphics.newImage('assets/littlefont.png')
   img:setFilter("nearest","nearest")
   dialogueFont = love.graphics.newImageFont(img, " ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.,!'\"-:?")

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
