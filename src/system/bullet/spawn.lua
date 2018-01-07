local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local Bullet = require('entity.bullet')

local System = tiny.processingSystem(class('system.bullet.spawn'))

function System:initialize()
  self.filter = tiny.requireAll('x', 'y', 'width', 'shoot', 'faction')
end

function System:process(e, dt)
  if e.shoot then
    local centered_x = (e.width / 2) - 1 + e.x
    self.world:add(Bullet(centered_x, e.y, e.faction))
    e.shoot = false
  end
end

return System
