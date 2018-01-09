local class = require('lib.middleclass')

local Draw = require('mixin.draw')
local Hitbox = require('mixin.hitbox')

local Entity = class('entity.bunker')

local COLUMNS = 6
local SPACER = 10
local GROUPING = 2
local GROUP_SPACER = 20

function Entity:initialize(index)
  local row = 1 + math.floor(index / COLUMNS)
  local column = 1 + index % COLUMNS
  local group = math.ceil(column / GROUPING)

  local x = (group * GROUP_SPACER) + (column * SPACER)
  local y = love.graphics.getHeight() - (2 * self.h) - (row * SPACER)

  self.x = x
  self.y = y
end

Entity:include(
  Draw('/asset/rsvg/bunker.png'),
  Hitbox('bunker')
)

return Entity
