local statemanager = {}


function statemanager.nextState(state, x, y)

   statemanager:change(state, x, y)

end


function statemanager:change(state, x, y)

   collision:destroy()
   collision:init()
--  if self.currentstate then
--      self.states[self.currentstate]:destroy()
--   end
   if self.currentstate then
      self.paststate = self.currentstate
   end
   self.currentstate = state
   self.states[self.currentstate]:load(x, y)
   if self.paststate then
      self.states[self.paststate]:destroy()
   end

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

   if self.states[self.currentstate].objects[who] then
      self.states[self.currentstate].objects[who]:talk()
   end

end


function statemanager:freezePlayer(freeze)

   -- this func is called from DialogueBoxSeries
   -- haven't figured out how to freeze the other npcs
   self.states[self.currentstate].objects.player.frozen = freeze

end


function statemanager:init()

   self.states = {YourOffice = require('states.YourOffice'),
                  Hallway = require('states.Hallway'),
                  Office01 = require('states.Office01'),
                  Office02 = require('states.Office02'),
                  Breakroom = require('states.Breakroom'),
                 }
   self:change("YourOffice", 19 * tilesize, 12 * tilesize) -- state to start with, with player coordinates.
   -- see "youroffice.lua" for more 'info' on player coords :(

end


return statemanager
