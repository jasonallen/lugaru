# ![Lugaru Logo](/logo.png "Lugaru!")Lugaru

A component-entity framework built on Moai. It makes PC and Mobile game development productive and enjoyable. It combines the amazing power and portability of Moai with a simplified component-entity based programming model.

### Features

* The framework is built on [Moai](http://getmoai.com/ "GetMoai!"), which means:
  * Works on PC, OSX, iphone & Android
  * Fast development cycle on PC/Mac, easy porting to mobile later
  * Extremely powerful and flexible (sprites, tiles, particles, physics and much, much more...)
  * Very, very fast - Built in portable C++
* [Component-Entity](http://en.wikipedia.org/wiki/Entity_component_system)-based framework: clean, simple, DRY code.
* [Well-documented](https://jasonallen.github.com/lugaru): source code is well documented, tutorials, code samples.
* The framework is well tested.

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
