--------------
-- A Scene is a stage where things in your game appear and interact. You will typically have one scene active at a time. A typical game might have a "Menu" scene and a "Game" scene, for example. More advanced games may have a smaller scene overlayed on top of another scene - like a "CommandBar" scene shown at the bottom, on top of a "Game" Scene as is typical in RTS games. Scenes are responsible for setup up the entities at the beginning. Then they don't do anything, until it's time to clean up. They are therefore created by defining three things: a name, a setup function, and a teardown function.
-- @usage
-- local L = require 'Lugaru'
--
-- local menuSetup = function(scene)
--   -- create your entities here!
-- end
--
-- local menuTeardown = function(scene)
--   -- delete your entities here!
-- end
--
-- local menuScene = L.Scene("Menu", menuSetup, menuTeardown)
-- menuScene:play()
-- @module Scene
local class = require 'pl.class'
local SceneMgr = require 'scene_mgr'
local List = require 'pl.List'
local LugaruTable = require 'lugaru_table'

local Scene = class()

function Scene:_init(name, setup, teardown)
  self.name = name
  self.priority = 0
  self.moaiLayer = MOAILayer.new()
  self.entities = List
  self.nextEntityID = 1
  self.setup = setup
  self.teardown = teardown
end

function Scene.__lt(a, b)
  return a.priority < b.priority
end

function Scene:_setup()
  self.moaiLayer:setViewport ( LugaruTable.viewport )
  if self.setup then
    self:setup()
  end
end

function Scene:_teardown()
  if (self.teardown) then
    self:teardown()
  end
end

---------------------------------------------------------------------------
-- Will make a scene visible and activate all the entities contained within.
-- @usage
-- local s = Scene("test")
-- s:start() -- scene is now visible and playing
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

return Scene
