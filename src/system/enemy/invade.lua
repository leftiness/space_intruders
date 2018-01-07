local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.enemy.invade'))

function System:initialize()
  self.filter = tiny.requireAll('isEnemy', 'x', 'y')
end

function System:process(e, dt)
  local out = e.x < 0
    or e.y < 0
    or e.x > love.graphics.getWidth()
    or e.y > love.graphics.getHeight()
  if out then
    love.event.quit()
  end
end

return System
