local class = require('lib.middleclass')

local Mixin = class('mixin.draw')

Mixin.static.drawables = {}

function Mixin:initialize(key, x, y)
  if Mixin.drawables[key] == nil then
    Mixin.drawables[key] = love.graphics.newImage(key)
  end

  local drawable = Mixin.drawables[key]

  self.key = key
  self.drawable = drawable
  self.w = drawable:getWidth() or 0
  self.h = drawable:getHeight() or 0
  self.x = x or 0
  self.y = y or 0
end

return Mixin
