local class = require('lib.middleclass')
local hard = require('lib.hardoncollider')

local Mixin = class('mixin.hitbox')

function Mixin.static.attach(self)
  self.hitbox = hard.rectangle(self.x, self.y, self.w, self.h)
  self.hitbox.entity = self
end

function Mixin:initialize(faction)
  self.faction = faction
end

function Mixin:included(klass)
  local initialize = klass.initialize

  function klass:initialize(...)
    initialize(self, ...)
    Mixin.attach(self)
  end
end

return Mixin
