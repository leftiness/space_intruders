local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.enemy.invade'))

function System:initialize()
  self.filter = tiny.requireAll('isEnemy', 'x', 'y', 'sx', 'sy')
end

function System:process(e, dt)
  local x = e.x * e.sx
  local y = e.y * e.sy

  local out = x < 0
    or y < 0
    or x > love.graphics.getWidth()
    or y > love.graphics.getHeight()

  if out then
    love.event.quit()
  end
end

return System
