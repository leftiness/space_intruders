local class = require('lib.middleclass')

local Load = require('system.drawable.load')

local Entity = class('entity.player')

function Entity:initialize()
  self.drawable_key = Load.RSVG.PLAYER
  self.width = 0
  self.height = 0
  self.isPlayer = true
  self.left = false
  self.right = false
  self.x = love.graphics.getWidth() / 2
  self.y = love.graphics.getHeight() - 10
  self.dx = 0
  self.dy = 0
  self.speed = 1
end

return Entity
