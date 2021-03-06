local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.input.keyboard'))

function System:initialize()
  self.filter = tiny.requireAll('isPlayer', 'left', 'right', 'space')
end

function System:process(e, dt)
  e.left  = love.keyboard.isDown('a') or love.keyboard.isDown('left')
  e.right = love.keyboard.isDown('d') or love.keyboard.isDown('right')
  e.space = love.keyboard.isDown('space')
end

return System
