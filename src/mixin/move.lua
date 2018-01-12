local class = require('lib.middleclass')

local Mixin = class('mixin.move')

function Mixin:initialize(dx, dy)
  self.dx = dx or 0
  self.dy = dy or 0
end

return Mixin
