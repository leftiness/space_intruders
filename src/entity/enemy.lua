local class = require('lib.middleclass')

local Draw = require('mixin.draw')
local Hitbox = require('mixin.hitbox')
local Shoot = require('mixin.shoot')

local Entity = class('entity.enemy')

local COLUMNS =  5
local SPACER  = 20

function Entity:initialize(index)
  local row = 1 + math.floor(index / COLUMNS)
  local column = 1 + index % COLUMNS
  local x = column * SPACER
  local y = row * SPACER

  self.x = x
  self.y = y
  self.isEnemy = true
end

Entity:include(
  Draw('asset/rsvg/enemy.png'),
  Hitbox('enemy'),
  Shoot()
)

return Entity
