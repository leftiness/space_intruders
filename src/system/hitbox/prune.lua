local tiny = require('lib.tiny')
local class = require('lib.middleclass')
local hard = require('lib.hardoncollider')

local System = tiny.system(class('system.hitbox.prune'))

function System:initialize()
  self.filter = tiny.requireAll('hitbox')
end

function System:onRemove(e)
  hard.remove(e.hitbox)
end

return System
