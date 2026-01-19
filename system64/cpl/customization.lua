local basalt = require("/lib/basalt")
local tx,ty = term.getSize()
local mainFrame = basalt.createFrame()
local scrollableFrame = mainFrame:addScrollableFrame():setSize(tx,ty)

scrollableFrame:setDirection("horizontal")

basalt.autoUpdate()