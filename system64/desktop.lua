-- Aurora OS 1.0
-- Desktop.lua
-- Main Enviorment for application to run

local basalt = require("/lib/basalt")
local tx,ty = term.getSize()
local startMenuOpen = false
local main = basalt.createFrame()
main:setBackground(colors.lightBlue)

local startMenu = main:addList():setBackground(colors.white):setSize(13,6):setPosition(1, ty-6)
startMenu:addItem("All Programs")
startMenu:addItem("Games")
startMenu:addItem("Terminal")
startMenu:addItem("Control Panel")
startMenu:addItem("Paint")
startMenu:addItem("File Manager")
startMenu:addItem("Restart")
startMenu:addItem("Shutdown")
startMenu:setVisible(false)
local taskbar = main:addButton():setBackground(colors.blue):setSize(tx,1):setText(""):setPosition(1, ty)
local startButton = main:addButton():setBackground(colors.green):setSize(5, 1):setText("Start"):setPosition(1, ty):onClick(
function()
    if startMenu:isVisible() == true then
        local startMenuOpen = false
        startMenu:setVisible(false)
        
    else
        local startMenuOpen = true
        startMenu:setVisible(true)

    end
end)

-- Moved
local function LaunchApp(app, appTitle)
    local appframe = main:addFrame():setSize(tx,ty)
    local ApplicationFrame = appframe:addProgram()
        :setSize(tx, ty-1)
        :setPosition(1, 2)
        :execute(app or "rom/programs/shell.lua")

    ApplicationFrame:onError(onProgramError)

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


function StartMenuOnSelect(self, event, item)
if item.text == "Shutdown" then
    os.shutdown()
elseif item.text == "Restart" then
    os.reboot()
elseif item.text == "Control Panel" then
    shell.run("/system64/app_launch.lua /system64/control.lua Control-Panel")
elseif item.text == "Terminal" then
    shell.run("/system64/app_launch.lua /system64/shell.lua Terminal-Shell")
elseif item.text == "File Manager" then
    shell.run("/system64/app_launch.lua /program_files/minex/minexp.lua File-Manager")
elseif item.text == "All Programs" then
    shell.run("/system64/app_launch.lua /system64/all_program_list.lua All-Programs")
elseif item.text == "Games" then
    shell.run("/system64/app_launch.lua /system64/games_list.lua Games")
elseif item.text == "Paint" then
    shell.run("/system64/app_launch.lua /rom/programs/hello.lua Paint")
else
    basalt.debug("Item got selected:", item.text)
end
end

startMenu:onSelect(StartMenuOnSelect)

basalt.autoUpdate()

shell.run("/system64/desktop.lua")