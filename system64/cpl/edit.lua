local basalt = require("/lib/basalt")
local tx,ty = term.getSize()
local mainFrame = basalt.createFrame()
local scrollableFrame = mainFrame:addScrollableFrame():setSize(tx,ty)

scrollableFrame:setDirection("horizontal")

scrollableFrame:setDirection("horizontal")
scrollableFrame:addLabel():setText("Autocomplete: "):setPosition(1, 1)

local autocompletebox = scrollableFrame:addCheckbox()
autocompletebox:setValue(settings.get("edit.autocomplete")):setPosition(15, 1)

scrollableFrame:addLabel():setText("Default Extension"):setPosition(1, 3)
scrollableFrame:addLabel():setText(""):setPosition(1, 4)
local defext = scrollableFrame:addInput()
defext:setInputType("text"):setPosition(20, 3)
defext:setDefaultText("Extension")
defext:setValue(settings.get("edit.default_extension"))


local function autocompleteboxfun(self)
    local audocompcheck = self:getValue()
    basalt.debug(audocompcheck)
    if audocompcheck then
        shell.run("set edit.autocomplete true")
    else
       shell.run("set edit.autocomplete false")
    end
end
autocompletebox:onChange(autocompleteboxfun)

local function defextfun(self)
    local defextcheck = self:getValue()
    basalt.debug(defextcheck)
    shell.run("set edit.default_extension", defextcheck)

end
defext:onChange(defextfun)


basalt.autoUpdate()
