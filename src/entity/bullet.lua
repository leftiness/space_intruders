local class = require('lib.middleclass')

local Draw = require('mixin.draw')
local Move = require('mixin.move')
local Hitbox = require('mixin.hitbox')

local Entity = class('entity.bullet')

function Entity:initialize(x, y, dy, faction)
  self.isBullet = true
  self.x = x
  self.y = y
  self.dy = dy
  self.faction = faction
end

Entity:include(
  Draw('asset/rsvg/bullet.png'),
  Move(),
  Hitbox('bullet')
)

return Entity
