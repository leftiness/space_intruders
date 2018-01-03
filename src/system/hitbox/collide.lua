local tiny = require('lib.tiny')
local class = require('lib.middleclass')
local hard = require('lib.hardoncollider')

local System = tiny.processingSystem(class('system.hitbox.collide'))

function System:initialize()
  self.filter = tiny.requireAll('hitbox', 'faction')
end


function System:process(e, dt)
  for collision in pairs(hard.collisions(e.hitbox)) do
    if collision.entity.faction ~= e.faction then
      self.world:remove(e)
    end
  end
end

return System
