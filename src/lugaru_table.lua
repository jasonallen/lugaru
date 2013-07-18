local LugaruTable = {}

function LugaruTable._init(width, height)
  MOAISim.openWindow("lugaru", width, height) 
  LugaruTable.viewport = MOAIViewport.new ()
  LugaruTable.viewport:setSize ( width, height )
  LugaruTable.viewport:setScale ( width, -height )
end

return LugaruTable

