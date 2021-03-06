local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.player.control'))

function System:initialize()
  self.filter = tiny.requireAll(
    'isPlayer',
    'left',
    'right',
    'speed',
    'w',
    'dx'
  )
end

function System:process(e, dt)
  if e.left and e.x > 0 then
    e.dx = -e.speed
  elseif e.right and e.x < love.graphics.getCanvas():getWidth() - e.w then
    e.dx = e.speed
  else
    e.dx = 0
  end
end

return System
