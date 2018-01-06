local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local Enemy = require('entity.enemy')

local System = tiny.processingSystem(class('system.enemy.spawn'))

local TARGET = 15

function System:initialize()
  self.filter = tiny.requireAll('isEnemy')
end

function System:onModify(dt)
  if #self.entities < TARGET then
    self.world:add(Enemy(#self.entities))
  end
end

return System
