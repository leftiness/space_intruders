local class = require('lib.middleclass')

local Loader = require('system.graphic.load')

local Player = class('entity.player')

function Player:initialize()
  self.graphic_key = Loader.CONST.RSVG.PLAYER
  self.x = 50
  self.y = 50
  self.isPlayerEntity = true
end

return Player
