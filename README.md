# ![Lugaru Logo](/logo.png "Lugaru!")Lugaru

A component-entity framework built on Moai. It makes PC and Mobile game development productive and enjoyable. It combines the amazing power and portability of Moai with a simplified component-entity based programming model.

### Example

Checkout the examples/ directory. Here's hello world:

    local L = require 'lugaru'
    L.init(320, 480)
    
    local setup = function(scene)
      local e = L.Entity()
      e:addComponent(L.Position(0,0))
      e:addComponent(L.Sprite("examples/foo.png", 128, 128))
      scene:addEntity(e)
    end
    
    L.Scene("main", setup):start()
