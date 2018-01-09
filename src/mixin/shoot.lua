local class = require('lib.middleclass')

local Mixin = class('mixin.shoot')

function Mixin:initialize(shoot)
  self.shoot = shoot or false
end

return Mixin
