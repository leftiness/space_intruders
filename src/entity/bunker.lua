local class = require('lib.middleclass')
local hard = require('lib.hardoncollider')

local Entity = class('entity.bunker')

local DRAWABLE = nil
local COLUMNS = 6
local SPACER = 10
local GROUPING = 2
local GROUP_SPACER = 20

function Entity:initialize(index)
  DRAWABLE = DRAWABLE or love.graphics.newImage('asset/rsvg/bunker.png')
  self.drawable = DRAWABLE
  self.width = DRAWABLE:getWidth()
  self.height = DRAWABLE:getHeight()
  self.index = index
  self.row = 1 + math.floor(self.index / COLUMNS)
  self.column = 1 + self.index % COLUMNS
  self.group = math.ceil(self.column / GROUPING)
  self.x = (self.group * GROUP_SPACER) + (self.column * SPACER)
  self.y = love.graphics.getHeight() - (2 * self.height) - (self.row * SPACER)
  self.faction = 'bunker'
  self.hitbox = hard.rectangle(self.x, self.y, self.width, self.height)
  self.hitbox.entity = self
end

return Entity
