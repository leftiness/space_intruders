local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local RSVG = 'asset/rsvg/%s.png'
local System = tiny.system(class('system.graphic.load'))

System.CONST= {
  RSVG = {
    BUNKER = RSVG:format('bunker'),
    ENEMY  = RSVG:format('enemy'),
    PLAYER = RSVG:format('player')
  }
}

function System:initialize()
  self.graphics = {}
  self.filter   = tiny.requireAll('graphic_key', tiny.rejectAll('graphic'))
end

function System:onAdd(e)
  if not self.graphics[e.graphic_key] then
    self.graphics[e.graphic_key] = love.graphics.newImage(e.graphic_key)
  end
  e.graphic = self.graphics[e.graphic_key]
  e.width   = e.graphic:getWidth()
  e.height  = e.graphic:getHeight()
end

return System
