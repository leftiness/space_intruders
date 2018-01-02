local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.graphic.draw'))

function System:initialize()
  self.filter = tiny.requireAll('graphic', 'x', 'y')
  self.isDrawSystem = true
end

function System:process(entity, dt)
  love.graphics.draw(entity.graphic, entity.x, entity.y)
end

return System
