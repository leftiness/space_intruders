local tiny = require('lib.tiny')

local world = nil
local DEBUG = false

function love.load()
  world = tiny.world(
    require('system.draw')(),
    require('system.input.keyboard')(),
    require('system.input.touch')(),
    require('system.move')(),
    require('system.player.control')(),
    require('system.player.shoot')(),
    require('system.enemy.spawn')(),
    require('system.enemy.move')(),
    require('system.enemy.invade')(),
    require('system.enemy.shoot')(),
    require('system.bullet.spawn')(),
    require('system.bullet.prune')(),
    require('system.hitbox.collide')(),
    require('system.hitbox.prune')(),
    require('system.bunker.spawn')(),
    require('entity.player')()
  )

  if DEBUG then
    world:add(
      require('system.debug.hitbox.draw')()
    )
  end
end

function love.update(dt)
  tiny.update(world, dt)
end

function love.draw()
  tiny.update(world, 0, tiny.filter('isDrawSystem'))
end
