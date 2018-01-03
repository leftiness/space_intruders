local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.enemy.invert'))

function System:initialize()
  self.filter = tiny.requireAll('isEnemy', 'row', 'width')
end

function System:process(e, dt)
  e.invert = e.row % 2 == 0
  e.sx = e.invert and 1 or -1
  e.sy = 1
  e.ox = e.invert and e.width or 0
  e.oy = 0
end

return System
