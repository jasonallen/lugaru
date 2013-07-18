package.path = package.path .. ";src/?.lua"

local L = require 'lugaru'
L.init(320, 480)

local setup = function(scene)
  local e = L.Entity()
  e:addComponent(L.Position(0,0))
  e:addComponent(L.Sprite("examples/foo.png", 128, 128))
  scene:addEntity(e)
end

L.Scene("main", setup):start()
