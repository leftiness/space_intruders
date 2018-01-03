local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.bullet.prune'))

function System:initialize()
  self.filter = tiny.requireAll('isBullet', 'x', 'y')
end

function System:process(e, dt)
  local out = e.x < 0
    or e.y < 0
    or e.x > love.graphics.getWidth()
    or e.y > love.graphics.getHeight()
  if out then
    self.world:remove(e)
  end
end

return System
