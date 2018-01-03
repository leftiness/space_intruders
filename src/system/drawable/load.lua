local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local RSVG = 'asset/rsvg/%s.png'
local System = tiny.system(class('system.drawable.load'))

System.RSVG = {
  BUNKER = RSVG:format('bunker'),
  BULLET = RSVG:format('bullet'),
  ENEMY  = RSVG:format('enemy'),
  PLAYER = RSVG:format('player')
}

function System:initialize()
  self.drawables = {}
  self.filter   = tiny.requireAll('drawable_key', tiny.rejectAll('drawable'))
end

function System:onAdd(e)
  if not self.drawables[e.drawable_key] then
    self.drawables[e.drawable_key] = love.graphics.newImage(e.drawable_key)
  end
  e.drawable = self.drawables[e.drawable_key]
  e.width   = e.drawable:getWidth()
  e.height  = e.drawable:getHeight()
end

return System
