local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local Bullet = require('entity.bullet')

local System = tiny.processingSystem(class('system.bullet.spawn'))

function System:initialize()
  self.filter = tiny.requireAll('x', 'y', 'shoot')
end

function System:process(e, dt)
  if e.shoot then
    self.world:add(Bullet(e.x, e.y))
    e.shoot = false
  end
end

return System
