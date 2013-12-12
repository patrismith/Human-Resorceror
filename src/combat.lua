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


function combat:load(enemy)

   love.audio.stop()
   love.audio.play(battlebgm)

   self.currenemy = self.enemies[enemy]
   --for k, v in pairs(self.currenemy) do
   --   print(k .. " " .. type(v))
   --end

   print("Combat started, enemy has " .. self.currenemy.PP.cur .. " health.")
   self:decideRules()

   self.playertone = 0
   self.enemytone = 0

   self.turn = {}

   self.turn[1] = introturn:new()
   self.turn[2] = playerturn:new()
   self.turn[3] = enemyturn:new()
   self.turn[4] = resolveturn:new()
   self.turn[5] = enemyturn:new()
   self.turn[6] = playerturn:new()
   self.turn[7] = resolveturn:new()
   self.turn['end'] = endturn:new()

   self.turn[1]:load(self.currenemy.name)

   self.currturn = 1

   self.active = true

   playerstats.menu = true

end


function combat:nextTurn()

   self.currturn = self.currturn + 1
   if self.currturn > 7 then self.currturn = 2 end
   self.turn[self.currturn]:load()

end


function combat:update(dt)

   self.turn[self.currturn]:update(dt)

end


function combat:draw()

   love.graphics.setCanvas(self.canvas)
   self.canvas:clear()
   love.graphics.setBlendMode('alpha')

   love.graphics.setColor(0,0,0)
   love.graphics.rectangle("fill",0,0,256,240)
   love.graphics.setColor(255,255,255)

   love.graphics.draw(self.currenemy.img, tilesize * 7, tilesize * 4)

   self.turn[self.currturn]:draw()

   playerstats:draw()

   love.graphics.setCanvas()
   love.graphics.setBlendMode('premultiplied')

   love.graphics.draw(self.canvas,0,0,0,scale)

   love.graphics.setCanvas(self.canvas)

end


function combat:keypressed(key)

   self.turn[self.currturn]:keypressed(key)

end


function combat:finish()

   self.active = false
   self.triggered = false
   self.ready = false
   playerstats.menu = false
   self.currenemy.PP.cur = self.currenemy.PP.max
   print("player health is " .. playerstats.PP.cur)

end


function combat:init()

   self.active = false
   self.triggered = false
   self.ready = false

   self.enemies = { intern = { PP = { max = 3,
                                      cur = 3 },
                               LVL = 1,
                               name = "intern",
                               img = guy01battle,},
                    fileclerk = { PP = { max = 5,
                                         cur = 5 },
                                  LVL = 3,
                                  name = "fileclerk",
                                  img = old01battle, },
                    coworker01 = { PP = { max = 7,
                                          cur = 7 },
                                   LVL = 4,
                                   name = "coworker01",
                                   img = lady01battle, },

                  }

   -- the three tones of conversation
   self.rules = {"a","n","p"}

   self.playerlines = { a = {"Science can't explain everything!",
                             "You're a tool of the Illuminati!",
                             "You have played right into Big Brother's plans!",
                             "I question everything They tell us!",
                             "Peak Fuel!!!",
                             "Don't look to Big Science for the answers!",
                             "The difference between chemtrails and contrails is that chemtrails don't go away. You've just been brainwashed into thinking that they're normal!",
                             "Television flicker rates have been set to alter your alpha brain waves, hypnotizing you!",
                             "Only an idiot would believe that there's no depopulation agenda!",
                             "Our founding fathers would be rolling their graves if they could see us today!",
                             "They're trying to sterilize the population by feeding us genetically modified foods!",
                             "Pearl Harbor was no surprise!",
                             "There's more to September 11 than the government is telling us! They've been lying to us to feed their horrific agenda!",
                             "The world's bankers have put our global governments into a stranglehold, and they have complete control over our very existence!",},
                        n = {"Maybe we should think about whether to trust science.",
                             "The Illuminati was a real historical group.",
                             "There've been increases in illegal surveillance in this country.",
                             "They didn't tell us all the facts in Intro to World History.",
                             "Fuel prices have been rising.",
                             "Let me tell you about something Karl Popper said.",
                             "The price of food has been rising.",
                             "Well, both the Democrats and the Republicans have some wackos on their side.",
                             "Boy, looks like those clowns in Congress did it again. What a bunch of clowns.",
                             "I don't trust the 'lamestream' media.",
                             "If everyone had an orgone generator, we wouldn't need hospitals.",
                             "What, do you think the hole in the ozone just 'fixed' itself?",
                             "Mankind was created as a slave race to help extraterrestrials mine gold so that they could repair their home planet's damaged atmosphere!",
                             "Atlantis didn't sink, it is orbiting the sun in a mirror orbit to Earth.",
                             "There's a reason SETI won't point their telescopes at the Pleiades you know.",
                             "The government doesn't want us to have free energy because they won't be able to control us if we do!",
},
                        p = {"I don't know, science could be wrong? But that's just my opinion.",
                             "Don't you think something's fishy with the G20?",
                             "Maybe having cameras everywhere is bad?",
                             "Sometimes, I wonder what isn't in the history books.",
                             "I get worried about how I'm going to pay for my car's gas needs.",
                             "Did you know? Science theory is just that, a theory.",
                             "Roswell was real and I know because I talked to one of the guys who showed up on site right after the crash!",
                             "Most people report their alien abductions as being horrifying and unpleasant. Mine have always been reassuring, and I've been given a lot of important secrets about the coming age.",
} }

   self.enemylines = { a = {"You need to get help.",
                            "Stop yelling at me!",
                            "Your facts are incredibly wrong.",
                            "What garbage have you been listening to?",
                            "You can't win your point by shouting.",
                            "I'm going to report you for harassment.",},
                       n = {"One could debate that point.",
                            "It's hard to tell without all the facts.",
                            "I think trained authorities might know what they're talking about.",
                            "Don't worry, I'm not the enemy.",
                            "Self-education is a lifelong pursuit.",
                            "I'm not sure if I'm getting a flu shot this season.",
                            "Sometimes I think that our pets can understand what we're saying.",
                            "Boy, the weather sure has been crazy this year, hasn't it?",
                            "If you ask me, music nowadays isn't as good as it was when we were growing up.",
                            "Did you see the game last night? Someone must've paid that ref off.",},
                       p = {"Hmm... did you see the game last night?",
                            "Have I told you about my cat?",
                            "Umm...",
                            "I mean, that's your opinion...",
                            "I guess I never thought of it that way.",
                            "Is something wrong?",
                            "I can't wait for the weekend.",
                            "Work sure is a drag.",
                            "Things sure have been quiet around here.",
                            "Have you had a chance to review the new corporate policy?",
                            "Do you think the boss will notice if I leave a few minutes early for lunch?",
                            "I'm thinking of taking a few extra days off this Christmas to finally fix that hole in my roof.",
}
                     }

   self.canvas = love.graphics.newCanvas(256,240)
   self.canvas:setFilter("nearest","nearest")

end


return combat
