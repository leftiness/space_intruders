local SPACE_INTRUDERS = "space_intruders"

function love.conf(t)
  t.identity              = SPACE_INTRUDERS
  t.accelerometerjoystick = false
  t.window.title          = SPACE_INTRUDERS
  t.modules.joystick      = false
  t.modules.math          = false
  t.modules.physics       = false
  t.modules.video         = false
end
