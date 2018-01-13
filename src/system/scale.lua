local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.scale'))

function System:initialize()
  self.filter = tiny.requireAll('drawable', 'x', 'y')
  self.w = love.graphics.getWidth()
  self.h = love.graphics.getHeight()
  self.sx = 1
  self.sy = 1
  self.isScaleSystem = true
end

function System:process(e, dt)
  e.sx = love.graphics.getWidth() / self.w
  e.sy = love.graphics.getHeight() / self.h
end

return System
