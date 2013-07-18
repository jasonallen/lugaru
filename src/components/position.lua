local class = require 'pl.class'
local Component = require 'components.component'

local Position = class(Component)

function Position:_init(x,y)
  self.prop = MOAIProp2D.new ()
  self.prop:setLoc (x, y)
end

function Position:start(e)
  e.scene.moaiLayer:insertProp(self.prop)
end

return Position


