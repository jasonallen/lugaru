local class = require 'pl.class'
local Component = require 'components.component'
local Position = require 'components.position'

local Sprite = class(Component)

function Sprite:_init(img, w, h)
	self.quad = MOAIGfxQuad2D.new ()
	self.quad:setTexture (img)
	self.quad:setRect (-w/2, -h/2, w/2, h/2)
	self.quad:setUVRect ( 0, 0, 1, 1 )
end

function Sprite:start(e)
	local position = e:getComponent(Position)
	position.prop:setDeck(self.quad)
end

function Sprite:removed()
end


return Sprite
