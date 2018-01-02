local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.move'))

function System:initialize()
  self.filter = tiny.requireAll('x', 'dx', 'y', 'dy')
end

function System:process(e, dt)
  e.x = e.x + e.dx
  e.y = e.y + e.dy
end

return System
