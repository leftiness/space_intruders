local class = require('lib.middleclass')
local hard = require('lib.hardoncollider')

local Entity = class('entity.bullet')

local DRAWABLE = nil

function Entity:initialize(x, y, faction)
  DRAWABLE = DRAWABLE or love.graphics.newImage('asset/rsvg/bullet.png')
  self.drawable = DRAWABLE
  self.width = DRAWABLE:getWidth()
  self.height = DRAWABLE:getHeight()
  self.isBullet = true
  self.x = x
  self.y = y
  self.dx = 0
  self.dy = -1
  self.faction = faction
  self.hitbox = hard.rectangle(self.x, self.y, self.width, self.height)
  self.hitbox.entity = self
end

return Entity
