local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.draw'))

function System:initialize()
  self.filter = tiny.requireAll('drawable', 'x', 'y')
  self.isDrawSystem = true
end

function System:process(e, dt)
  love.graphics.draw(
    e.drawable,
    e.x,
    e.y,
    e.r,
    e.sx,
    e.sy,
    e.ox,
    e.oy,
    e.kx,
    e.ky
  )
end

return System
