local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.input.keyboard'))

function System:initialize()
  self.filter = tiny.requireAll('x', 'y', 'isPlayerEntity')
  self.keys = {}
  self:map('w', 'y', 1)
  self:map('a', 'x', 1)
  self:map('s', 'y', -1)
  self:map('d', 'x', -1)
  self.rate = 100
end

function System:process(entity, dt)
  for key, val in pairs(self.keys) do
    if not love.keyboard.isDown(key) then
      local change = val.direction * self.rate * dt
      entity[val.coordinate] = entity[val.coordinate] + change
    end
  end
end

function System:map(key, coordinate, direction)
  self.keys[key] = { coordinate = coordinate, direction = direction }
end

return System
