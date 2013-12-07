local statemanager = {}


function statemanager.nextState(state, x, y)

   statemanager:change(state, x, y)

end


function statemanager:change(state, x, y)

   collision:destroy()
   --collision:init()
   self.currentstate = state
   self.states[self.currentstate]:load(x, y)

end


function statemanager:update(dt)

   if combat.active then
      combat:update(dt)
   else
      self.states[self.currentstate]:update(dt)
   end

end


function statemanager:draw()

   if combat.active then
      combat:draw()
   else
      --print("player health is " .. playerstats.PP.cur)
      self.states[self.currentstate]:draw()
   end

end


function statemanager:keypressed(key)

   if combat.active then
      combat:keypressed(key)
   else
      self.states[self.currentstate]:keypressed(key)
   end

end


function statemanager:initiateChat(who)

   self.states[self.currentstate].objects[who]:talk()

end


function statemanager:freezePlayer(freeze)

   -- this func is called from DialogueBoxSeries
   -- haven't figured out how to freeze the npc that's talking
   self.states[self.currentstate].objects.player.frozen = freeze

end


function statemanager:init()

   self.states = {YourOffice = require('states.YourOffice'),
                  Test = require('states.Test'),
                 }
   self:change("YourOffice", 19 * tilesize, 12 * tilesize) -- state to start with, with player coordinates.
   -- see "youroffice.lua" for more 'info' on player coords :(

end


return statemanager
