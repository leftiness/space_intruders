local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.player.shoot'))

function System:initialize()
  self.filter = tiny.requireAll('isPlayer', 'timeout', 'cooldown')
end

function System:process(e, dt)
  if e.timeout <= 0 and e.space then
    e.shoot = true
    e.timeout = e.cooldown
  elseif e.timeout > 0 then
    e.timeout = e.timeout - dt
  end
end

return System
