local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.enemy.invade'))

function System:initialize()
  self.filter = tiny.requireAll('isEnemy', 'x', 'y')
end

function System:process(e, dt)
  local x, y = e.x, e.y
  local w, h = love.graphics.getCanvas():getDimensions()

  if x < 0 or y < 0 or x > w or y > h then
    love.event.quit()
  end
end

return System
