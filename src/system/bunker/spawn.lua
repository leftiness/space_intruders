local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local Bunker = require('entity.bunker')

local System = tiny.processingSystem(class('system.bunker.spawn'))

local TARGET = 12

function System:initialize()
  self.filter = tiny.requireAll('isEnemy')
  self.bunkers = {}
end

function System:onModify(dt)
  if #self.entities ~= 0 then
    return
  end
  for i = 0, TARGET - 1 do
    self.world:remove(self.bunkers[i])
    local bunker = Bunker(i)
    self.bunkers[i] = bunker
    self.world:add(bunker)
  end
end

return System
