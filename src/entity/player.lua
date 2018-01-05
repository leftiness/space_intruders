local class = require('lib.middleclass')
local hard = require('lib.hardoncollider')

local Entity = class('entity.player')

local DRAWABLE = nil

function Entity:initialize()
  DRAWABLE = DRAWABLE or love.graphics.newImage('asset/rsvg/player.png')
  self.drawable = DRAWABLE
  self.width = DRAWABLE:getWidth()
  self.height = DRAWABLE:getHeight()
  self.isPlayer = true
  self.left = false
  self.right = false
  self.space = false
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() - 10
  self.dx = 0
  self.dy = 0
  self.speed = 1
  self.timeout = 0
  self.cooldown = 1
  self.shoot = false
  self.faction = 'player'
  self.hitbox = hard.rectangle(self.x, self.y, self.width, self.height)
  self.hitbox.entity = self
end

return Entity
