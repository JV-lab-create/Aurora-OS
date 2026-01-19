local basalt = require("/lib/basalt")
local tx,ty = term.getSize()
local mainFrame = basalt.createFrame()
local scrollableFrame = mainFrame:addScrollableFrame():setSize(tx,ty)

scrollableFrame:setDirection("horizontal")

scrollableFrame:setDirection("horizontal")
scrollableFrame:addLabel():setText("Autocomplete: "):setPosition(1, 1)
local autocompletebox = scrollableFrame:addCheckbox()
autocompletebox:setValue(settings.get("shell.autocomplete")):setPosition(15, 1)

scrollableFrame:addLabel():setText("Disk Startup: "):setPosition(1, 3)
local allowdiskstartupbox = scrollableFrame:addCheckbox()
allowdiskstartupbox:setValue(settings.get("shell.allow_disk_startup")):setPosition(15, 3)

local function autocompleteboxfun(self)
    local audocompcheck = self:getValue()
    basalt.debug(audocompcheck)
    if audocompcheck then
        shell.run("set shell.autocomplete true")
    else
       shell.run("set shell.autocomplete false")
    end
end
autocompletebox:onChange(autocompleteboxfun)

local function diskystartupyallowy(self)
    local audocompcheck = self:getValue()
    basalt.debug(audocompcheck)
    if audocompcheck then
        shell.run("set shell.allow_disk_startup true")
    else
       shell.run("set shell.allow_disk_startup false")
    end
end
allowdiskstartupbox:onChange(diskystartupyallowy)


basalt.autoUpdate()
