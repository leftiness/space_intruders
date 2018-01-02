local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local RSVG = 'asset/rsvg/%s.png'
local System = tiny.system(class('system.graphic.load'))

System.CONST= {
  RSVG = {
    BUNKER = RSVG:format('bunker'),
    ENEMY = RSVG:format('enemy'),
    PLAYER = RSVG:format('player')
  }
}

function System:initialize()
  self.graphics = {}
  self.filter = tiny.requireAll('graphic_key')
end

function System:onAdd(entity)
  local key = entity.graphic_key
  if not self.graphics[key] then
    self.graphics[key] = love.graphics.newImage(key)
  end
  entity.graphic = self.graphics[key]
end

return System
