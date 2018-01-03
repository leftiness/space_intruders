local tiny = require('lib.tiny')

local world = nil

function love.load()
  world = tiny.world(
    require('system.drawable.load')(),
    require('system.drawable.draw')(),
    require('system.input.keyboard')(),
    require('system.move')(),
    require('system.player.control')(),
    require('system.enemy.spawn')(),
    require('system.enemy.invert')(),
    require('entity.player')()
  )
end

function love.update(dt)
  tiny.update(world, dt)
end

function love.draw()
  tiny.update(world, 0, tiny.filter('isDrawSystem'))
end
