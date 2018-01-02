local tiny = require('lib.tiny')

local world = nil

function love.load()
  world = tiny.world(
    require('system.graphic.load')(),
    require('system.graphic.draw')(),
    require('system.input.keyboard')(),
    require('system.move')(),
    require('system.player.control')(),
    require('entity.player')()
  )
end

function love.update(dt)
  tiny.update(world, dt)
end

function love.draw()
  tiny.update(world, 0, tiny.filter('isDrawSystem'))
end
