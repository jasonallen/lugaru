--------------
-- Everything in a game is represented by an Entity. Oddly enough, entities have no state or logic.
-- @usage
-- local e = L.Entity()
-- @module Entity
local class = require 'pl.class'
local List = require 'pl.list'
local pretty = require 'pl.pretty'
local Component = require 'components.component'
local Position = require 'components.position'
local Sprite = require 'components.sprite'

local Entity = class()

function Entity:_init()
	self.components = List()
end

---------------
-- Will attach a component to an entity.
-- @usage
-- local e = L.Entity()
-- local p = L.Position(0, 0)
-- e.addComponent(p)
function Entity:addComponent(component)
	self.components:append(component)
end

---------------
-- Will fetch an attached component (or return nil if not present).
-- @usage
-- local p = e.getComponent(L.Position)
function Entity:getComponent(klass)
	for component in self.components:iter() do
		if component:is_a(klass) then
			return component
		end
	end
	return nil
end

---------------
-- Will invoke the callback function with each component attached to this entity
-- @usage
-- entity:eachComponent(function(component)
--   print("...and more more component!")
-- end)
function Entity:eachComponent(fn)
	for component in self.components:iter() do
		fn(component)
	end
end

return Entity
