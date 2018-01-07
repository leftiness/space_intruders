local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.enemy.shoot'))

function System:initialize()
  self.filter = tiny.requireAll('isEnemy', 'shoot')
  self.interval = 5
  self.shoot = false
end

function System:preProcess(dt)
  self.shoot = false
end

function System:process(e, dt)
  if self.shoot then
    return
  else
    self.shoot = math.random() > .9
    e.shoot = self.shoot
  end
end

return System
