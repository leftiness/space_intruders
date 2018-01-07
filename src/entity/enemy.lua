local class = require('lib.middleclass')
local hard = require('lib.hardoncollider')

local Entity = class('entity.enemy')

local DRAWABLE = nil
local COLUMNS =  5
local SPACER  = 20

function Entity:initialize(index)
  DRAWABLE = DRAWABLE or love.graphics.newImage('asset/rsvg/enemy.png')
  self.drawable = DRAWABLE
  self.width = DRAWABLE:getWidth()
  self.height = DRAWABLE:getHeight()
  self.isEnemy = true
  self.index = index
  self.row = 1 + math.floor(self.index / COLUMNS)
  self.column = 1 + self.index % COLUMNS
  self.x = self.column * SPACER
  self.y = self.row * SPACER
  self.dx = 0
  self.dy = 0
  self.faction = 'enemy'
  self.hitbox = hard.rectangle(self.x, self.y, self.width, self.height)
  self.hitbox.entity = self
  self.shoot = false
end

return Entity
