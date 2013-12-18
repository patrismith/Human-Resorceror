local gamemanager = {}


function gamemanager:init()

   constants:init()

   collisionmanager:init()

   displaymanager:init()

   mapmanager:init()

   playermanager:init(20,15)

end


function gamemanager:update(dt)

   playermanager:update(dt)

end


function gamemanager:keypressed(key)

   --dbug.show("gamemanager registered keypress: " .. key)

end

return gamemanager
