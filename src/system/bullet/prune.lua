local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.bullet.prune'))

function System:initialize()
  self.filter = tiny.requireAll('isBullet', 'x', 'y')
end

function System:process(e, dt)
  local w, h = love.graphics.getCanvas():getDimensions()

  if e.x < 0 or e.y < 0 or e.x > w or e.y > h then
    self.world:remove(e)
  end
end

return System
