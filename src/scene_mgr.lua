--------------
-- Manages scenes and their ordering.
-- Currently just does Markdown, but this is intended to
-- be the general module for managing other formats as well.
-- This manages `Scene`
-- @module SceneMgr
local class = require 'pl.class'

local M = {}

local SceneMgr = class()

function SceneMgr:_init()
  -- scenes enable easy lookup by 'name' e.g. { "overlay" = <scene> }
  self.scenes = {}
end

-------------------------------------------------------------------------------
-- Adds an extra scene to get rendered.
-- Scenes are rendered in their priority order. Scenes are also accessible by their
-- name. 
-- @usage
-- local fooScene = FooScene("foo")
-- L.sceneMgr.add(fooScene)
-- ...
-- local scene = L.sceneMgr.scenes["foo"] -- retrieves the fooScene!
-- @param scene The scene to be added
function SceneMgr:add(scene)
  self.scenes[scene.name] = scene
  self:setRenderTable()
  scene:_added()
end

--- Define special sequences of characters.
---- For each pair (find, subs), the function will create a field named with
---- find which has the value of subs.
---- It also creates an index for the table, according to the order of insertion.
---- @param scene The replacement pattern.
function SceneMgr:remove(scene)
  self.scenes[scene.name] = nil
  self:setRenderTable()
  scene:_removed()
end

function SceneMgr:orderedScenes()
  local result = {}
  for _, scene in pairs(self.scenes) do
    table.insert(result, scene)
  end
  table.sort(result)
  return result
end

function SceneMgr:setRenderTable()
  local moaiLayers = {}
  for i, scene in ipairs(self:orderedScenes()) do
    moaiLayers[#moaiLayers + 1] = scene.moaiLayer
  end
  MOAIRenderMgr.setRenderTable(moaiLayers)
end

return SceneMgr()

