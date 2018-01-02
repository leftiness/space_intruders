local SPACE_INTRUDERS = "space_intruders"
local GAMEBOY_WIDTH   = 160
local GAMEBOY_HEIGHT  = 144

function love.conf(t)
  t.identity              = SPACE_INTRUDERS
  t.accelerometerjoystick = false
  t.window.title          = SPACE_INTRUDERS
  t.window.width          = GAMEBOY_WIDTH
  t.window.height         = GAMEBOY_HEIGHT
  t.modules.joystick      = false
  t.modules.math          = false
  t.modules.physics       = false
  t.modules.video         = false
end
