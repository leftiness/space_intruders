local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local Enemy = require('entity.enemy')

local System = tiny.processingSystem(class('system.enemy.spawn'))

local TARGET = 15

function System:initialize()
  self.filter = tiny.requireAll('isEnemy')
  self.spawn = true
end

function System:onRemove(e)
  self.spawn = #self.entities == 0
end

function System:onModify(dt)
  if not self.spawn then
    return
  elseif #self.entities < TARGET then
    self.world:add(Enemy(#self.entities))
  else
    self.spawn = false
  end
end

return System
