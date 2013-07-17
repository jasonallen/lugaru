--------------
-- Lugaru is the toplevel framework namespace. It includes most related resources off of it.
-- @usage
-- local L = require 'lugaru'
--
-- L.init(320, 480)
-- local s = L.Scene("main", function() local e = L.Entity() end)
--
-- @module Lugaru

local Entity = require 'entity'
local Scene = require 'scene'
local SceneMgr = require 'scene_mgr'
local Sprite = require 'components.sprite'
local Position = require 'components.position'
local Lugaru = require 'lugaru_table'


Lugaru.Entity = Entity
Lugaru.Scene = Scene
Lugaru.SceneMgr = SceneMgr

-- components
Lugaru.Sprite = Sprite
Lugaru.Position = Position


--------------------------------------------
-- One-time initialization of Lugaru.
-- This is required for non-mobile environments.
-- @param width width of window, in pixels
-- @param height width of window, in pixels
-- @usage
-- local L = require 'lugaru'
-- L.init(640, 480)
function Lugaru.init(width, height)
	Lugaru._init(width, height) -- defined in LugaruTable
end

return Lugaru

