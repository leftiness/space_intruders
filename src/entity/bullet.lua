local class = require('lib.middleclass')

local Load = require('system.drawable.load')

local Entity = class('entity.bullet')

function Entity:initialize(x, y)
  self.drawable_key = Load.RSVG.BULLET
  self.isBullet = true
  self.x = x
  self.y = y
  self.dx = 0
  self.dy = -1
end

return Entity
