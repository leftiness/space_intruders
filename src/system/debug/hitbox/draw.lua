local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.debug.hitbox.draw'))

function System:initialize()
  self.filter = tiny.requireAll('hitbox')
  self.isDrawSystem = true
end

function System:process(e, dt)
  local x1, y1, x2, y2 = e.hitbox:bbox()
  local width = x2 - x1
  local height = y2 - y1
  love.graphics.rectangle('line', x1, y1, width, height)
end

return System
