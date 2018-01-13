local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.input.touch'))

function System:initialize()
  self.filter = tiny.requireAll('isPlayer', 'left', 'right', 'space')
end

function System:process(e, dt)
  if e.left or e.right or e.space then
    return
  end

  local w, h = love.graphics.getDimensions()

  for i, id in pairs(love.touch.getTouches()) do
    local x, y = love.touch.getPosition(id)
    local above = y < h / 2

    e.left = e.left or not above and (x < w / 2)
    e.right = e.right or not above and (x > w / 2)
    e.space = e.space or above
  end
end

return System
