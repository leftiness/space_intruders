local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local Bullet = require('entity.bullet')

local System = tiny.processingSystem(class('system.bullet.spawn'))

function System:initialize()
  self.filter = tiny.requireAll('x', 'y', 'w', 'shoot', 'faction')
end

function System:process(e, dt)
  if e.shoot then
    local centered_x = (e.w / 2) - 1 + e.x
    local dy = e.isPlayer and -1 or 1
    self.world:add(Bullet(centered_x, e.y, dy, e.faction))
    e.shoot = false
  end
end

return System
