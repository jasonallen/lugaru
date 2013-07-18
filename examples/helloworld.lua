package.path = package.path .. ";src/?.lua"

local L = require 'lugaru'
local Position = require 'components.position'

L.init(320, 480)

local setup = function(scene)
	local e = L.Entity()
	e:addComponent(L.Position(0,0))
	e:addComponent(L.Sprite("examples/foo.png", 64, 64))
	scene:addEntity(e)
end

local scene = L.Scene("main", setup)
scene:start()
