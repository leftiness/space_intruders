local class = require('lib.middleclass')

local Load  = require('system.drawable.load')
local Entity = class('entity.enemy')

local COLUMNS =  5
local SPACER  = 20

function Entity:initialize(index)
  self.drawable_key = Load.RSVG.ENEMY
  self.isEnemy = true
  self.index = index
  self.row = 1 + math.floor(self.index / COLUMNS)
  self.column = 1 + self.index % COLUMNS
  self.x = self.column * SPACER
  self.y = self.row * SPACER
end

return Entity
