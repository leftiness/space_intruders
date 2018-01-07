local tiny = require('lib.tiny')
local class = require('lib.middleclass')

local System = tiny.processingSystem(class('system.enemy.move'))

local MOVES = 5
local SPEED = 10

function System:initialize()
  self.filter = tiny.requireAll('isEnemy', 'hitbox', 'x', 'y')
  self.interval = 2
  self.move = 0
  self.dx = 0
  self.dy = 0
end

function System:onModify(dt)
  if #self.entities == 0 then
    self.move = 0
    self.dx = 0
    self.dy = 0
  end
end

function System:preProcess(dt)
  if self.move == 0 then
    self.dx = SPEED
    self.dy = 0
  elseif self.move == MOVES - 1 then
    self.dx = 0
    self.dy = SPEED
  elseif self.move == MOVES then
    self.move = -MOVES
    self.dx = -SPEED
    self.dy = 0
  elseif self.move == -1 then
    self.dx = 0
    self.dy = SPEED
  end
  self.move = self.move + 1
end

function System:process(e, dt)
  e.x = e.x + self.dx
  e.y = e.y + self.dy
  e.hitbox:move(self.dx, self.dy)
end

return System
