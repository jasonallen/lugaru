require 'spec.setup'
local L = require 'lugaru'

local setup = function ()
end

describe("SceneMgr when one scene added", function()
	local emptyScene
	local setupSpy
	
	before(function()
		setupSpy = spy.new(setup)
		emptyScene = L.Scene("empty", setupSpy)
		emptyScene:start()
	end)

	after(function()
		emptyScene:stop()
		assert.are.same({}, L.SceneMgr.scenes)
	end)

	it("scene.add should call added", function()
		assert.spy(setupSpy).was.called()
	end)

	it("should contain one scene", function()
 		local expected = { empty = emptyScene }
		assert.are.same(expected, L.SceneMgr.scenes)
	end)

	it("should contain one ordered scene", function()
		assert.are.same({[1]=emptyScene}, L.SceneMgr:orderedScenes())
	end)

	it("moai MOAIRenderMgr render table should be accurate", function()
		assert.are.same({emptyScene.moaiLayer}, MOAIRenderMgr.getRenderTable())
	end)

end)
