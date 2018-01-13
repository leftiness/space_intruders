local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.draw'))

local GAMEBOY_WIDTH  = 160
local GAMEBOY_HEIGHT = 144

function System:initialize()
  self.filter = tiny.requireAll('drawable', 'x', 'y')
  self.canvas = love.graphics.newCanvas(GAMEBOY_WIDTH, GAMEBOY_HEIGHT)
  self.isDrawSystem = true

  love.graphics.setCanvas(self.canvas)
end

function System:preWrap(dt)
  love.graphics.setCanvas(self.canvas)
  love.graphics.clear()
end

function System:process(e, dt)
  love.graphics.draw(e.drawable, e.x, e.y)
end

function System:postWrap(dt)
  local w, h = love.window.getMode()
  local sx = w / GAMEBOY_WIDTH
  local sy = h / GAMEBOY_HEIGHT

  love.graphics.setCanvas()
  love.graphics.scale(sx, sy)
  love.graphics.draw(self.canvas)
end

return System
