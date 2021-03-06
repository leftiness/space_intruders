local class = require('lib.middleclass')

local Draw = require('mixin.draw')
local Move = require('mixin.move')
local Hitbox = require('mixin.hitbox')
local Shoot = require('mixin.shoot')

local Entity = class('entity.player')

function Entity:initialize()
  local w, h = love.graphics.getCanvas():getDimensions()

  self.x = w / 2
  self.y = h - 10
  self.isPlayer = true
  self.left = false
  self.right = false
  self.space = false
  self.speed = 1
  self.timeout = 0
  self.cooldown = 1
end

Entity:include(
  Draw('asset/rsvg/player.png'),
  Move(),
  Hitbox('player'),
  Shoot()
)

return Entity
