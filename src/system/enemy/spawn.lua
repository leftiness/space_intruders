local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local Enemy = require('entity.enemy')

local System = tiny.processingSystem(class('system.enemy.spawn'))

local TARGET = 15

function System:initialize()
  self.filter = tiny.requireAll('isEnemy')
end

function System:onModify(dt)
  if #self.entities ~= 0 then
    return
  end
  for i = 0, TARGET - 1 do
    self.world:add(Enemy(i))
  end
end

return System
