--------------
-- Scenes are a way of organizing objects. They represent distinct parts of the game.
-- These can be different screens or levels, or overlays. Scenes are rendered
-- by their priority. Scenes are setup and torn down by responding to their
-- 'added' and 'removed' callbacks.
-- @usage
-- local MyScene = class(Scene)
-- function MyScene:added(sceneMgr)
--   sceneMgr:add(SpaceShipEntity())
-- end
-- @module Scene
local class = require 'pl.class'
local SceneMgr = require 'scene_mgr'
local List = require 'pl.list'
local LugaruTable = require 'lugaru_table'

local Scene = class()

function Scene:_init(name)
	self.name = name
	self.priority = 0
	self.moaiLayer = MOAILayer.new()
	self.entities = List
	self.nextEntityID = 1
end

function Scene.__lt(a, b)
	return a.priority < b.priority
end

function Scene:_added()
	if (self.added) then
		self.moaiLayer:setViewport ( LugaruTable.viewport )
		self:added()
	end
end

function Scene:_removed()
	if (self.removed) then
		self:removed()
	end
end

---------------------------------------------------------------------------
-- Will make a scene visible and activate all the entities contained within.
-- @usage
-- local s = Scene("test")
-- s:start()  -- scene is now visible and playing
-- @see Scene:stop
function Scene:start()
	SceneMgr:add(self)
end

---------------------------------------------------------------------------
-- Hides and removes a scene, deactivating all the entities contained.
-- @usage
-- local s = Scene("test")
-- s:start()a
-- ...
-- s:stop() -- scene is now hidden, united, and removed
--
-- @see Scene:start
function Scene:stop()
	SceneMgr:remove(self)
end

function Scene:addEntity(e)
	if e.id or e.scene then error("entity already has id - already added?") end

	e.scene = self
	e.id = self.nextEntityID
	self.nextEntityID = self.nextEntityID + 1

	self.entities:append(e)
	e:eachComponent(function(component)
		if (component.start) then
			component:start(e)
		end
	end)
end

local SceneMaker = function(name, added, removed)	
	local s = Scene(name)
	s.added = added
	s.removed = removed
	return s
end

return SceneMaker
