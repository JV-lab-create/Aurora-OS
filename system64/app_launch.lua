-- Aurora OS 1.0
-- app_launch.lua
-- The Emulator for apps and more


local basalt = require("/lib/basalt")
local tx,ty = term.getSize()
local startMenuOpen = false
local main = basalt.createFrame()
main:setBackground(colors.lightBlue)


local function LaunchApp(app, appTitle)
    local appframe = main:addFrame():setSize(tx,ty)
    local ApplicationFrame = appframe:addProgram()
        :setSize(tx, ty-1)
        :setPosition(1, 2)
        :execute(app or "rom/programs/shell.lua")

    if appTitle == nil then
        local ApplicationFrame = appframe:addButton()
            :setBackground(colors.blue)
            :setSize(tx,1)
            :setText("New Program")
            :setPosition(1, 1)
    else
    appframe:addButton()
        :setBackground(colors.blue)
        :setSize(tx,1)
        :setText(appTitle)
        :setPosition(1, 1)
    end
    appframe:addButton()
        :setBackground(colors.red)
        :setSize(1,1)
        :setText("X")
        :setPosition(tx, 1)
        :onClick(function()
            basalt.stop()
        end)
end

LaunchApp(arg[1], arg[2])

basalt.autoUpdate()