local combat = {}

local function shuffle(t)

   local n = #t

   while n > 2 do
      local k = math.random(n)
      t[n], t[k] = t[k], t[n]
      n = n - 1
   end

   return t

end


function combat:decideRules()

   -- randomly set the order of aggressive, neutral, or passive tones
   shuffle(self.rules)
   for i,v in ipairs(self.rules) do
      print(i .. " " .. v)
   end

end




function combat:notify(text)

   -- maybe better implemented in DialogueBox as a reset function...
   self.notification.currtext = ""
   self.notification.textcounter = 1
   self.notification.text = text
   self.notification.complete = false


end


function combat:chooseTone(who)
   -- set an aggressive, neutral, or passive tone
   -- who = player or enemy

end


function combat:playerTurn()

   combat:notify("Choose your tone:\n\nA -- Aggressive\nN -- Neutral\nP -- Passive")
   self.playerturn = true
   self.playerchoice = ""
   --combat:chooseTone("player")
   self.wait = true

end


function combat:enemyTurn()

   combat:notify("enemy choose a tone")
   --combat:chooseTone("enemy")
   self.wait = true

end


function combat:loopit()

   -- function name is a misnomer
   if self.turn == 1 or self.turn == 5 then
      self:playerTurn()
   elseif self.turn == 2 or self.turn == 4 then
      self:enemyTurn()
   elseif self.turn == 3 or self.turn == 6 then
      self:resolveTurn()

end


function combat:start(enemy)

   print("combat starts with " .. enemy)
   self.active = true
   self.currenemy = self.enemies[enemy]
   print("PP is " .. self.currenemy.PP .. " and LVL is " .. self.currenemy.LVL)
   self:decideRules()
   self.notification = DialogueBox:new()
   self.notification:init({text = "\n\nYou start a conversation with the " .. self.currenemy.name .. "."})
   self.wait = true
   self.turn = 1

end


function combat:finish()

   self.active = false
   self.triggered = false
   self.ready = false
   self.currenemy = nil

end


function combat:update(dt)

   self.notification:update(dt)

   if self.notification.complete and self.wait == false then
      self.loopactive = true
   end

   if self.loopactive then
      self.loopactive = false
      print("loop active")
      self:loopit()
   end


end


function combat:draw()

   love.graphics.setCanvas(self.canvas)
   self.canvas:clear()
   love.graphics.setBlendMode('alpha')

   love.graphics.setColor(0,0,0)
   love.graphics.rectangle("fill",0,0,256,240)
   love.graphics.setColor(255,255,255)

   self.notification:draw()

   love.graphics.setCanvas()
   love.graphics.setBlendMode('premultiplied')

   love.graphics.draw(self.canvas,0,0,0,scale)

   love.graphics.setCanvas(self.canvas)


end


function combat:keypressed(key)

   if self.notification.complete then
      if key == " " then
         self.wait = false
      end
   end

   if self.playerturn == true then
      if key == "a" or key == "p" or key == "n" then
         playerchoice = key
         self.turn = self.turn + 1
      end
   end

end


function combat:init()

   -- determines whether statemanager draws/updates any of this
   self.active = false
   -- used for triggering/starting combat after dialogue with NPC
   self.triggered = false
   self.ready = false
   -- used as pauses between notifications
   self.wait = false

   self.enemies = { intern = { PP = 5,
                               LVL = 1,
                               name = "intern"},
                  }

   -- the three tones of conversation
   self.rules = {"a","n","p"}

   self.canvas = love.graphics.newCanvas(256,240)
   self.canvas:setFilter("nearest","nearest")



end


return combat
