local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.draw'))

function System:initialize()
  self.filter = tiny.requireAll('drawable', 'x', 'y', 'sx', 'sy')
  self.isDrawSystem = true
end

function System:process(e, dt)
  love.graphics.draw(e.drawable, e.x * e.sx, e.y * e.sy, 0, e.sx, e.sy)
end

return System
