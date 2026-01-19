local basalt = require("/lib/basalt")
local tx,ty = term.getSize()
local mainFrame = basalt.createFrame()
local scrollableFrame = mainFrame:addScrollableFrame():setSize(tx,ty)
settings.load("/program_files/programs.cfg")
scrollableFrame:setDirection("horizontal")
scrollableFrame:addLabel():setText("Default Program: "):setPosition(1, 1)
local defultinput = scrollableFrame:addInput()
defultinput:setInputType("text"):setPosition(20, 1)
defultinput:setDefaultText("program")
defultinput:setValue(settings.get("minexp.default_program"))

scrollableFrame:addLabel():setText("Default NFT"):setPosition(1, 3)
scrollableFrame:addLabel():setText("Program"):setPosition(1, 4)
local nftinput = scrollableFrame:addInput()
nftinput:setInputType("text"):setPosition(20, 3)
nftinput:setDefaultText("program")
nftinput:setValue(settings.get("minexp.programs.nft"))

scrollableFrame:addLabel():setText("Default NFP "):setPosition(1, 6)
scrollableFrame:addLabel():setText("Program"):setPosition(1, 7)
local nfpinput = scrollableFrame:addInput()
nfpinput:setInputType("text"):setPosition(20, 6)
nfpinput:setDefaultText("program")
nfpinput:setValue(settings.get("minexp.programs.nfp"))

settings.load("/program_files/explorer.cfg")
scrollableFrame:addLabel():setText("Recycle Directory: "):setPosition(1, 8)
local recycleinput = scrollableFrame:addInput()
recycleinput:setInputType("text"):setPosition(20, 8)
recycleinput:setDefaultText("program")
recycleinput:setValue(settings.get("minexp.recycle_directory"))

scrollableFrame:addLabel():setText("Disable Hotkeys: "):setPosition(1, 10)
local dishotkeys = scrollableFrame:addCheckbox()
dishotkeys:setValue(settings.get("minexp.disable_hotkeys")):setPosition(20, 10)

scrollableFrame:addLabel():setText("Recycle on leave: "):setPosition(1, 12)
local recycleonleave = scrollableFrame:addCheckbox()
recycleonleave:setValue(settings.get("minexp.recycle_on_leave")):setPosition(20, 12)




local function recycleonleavecheckboxchange(self)
  local recyclechecked = self:getValue()
  basalt.debug(recyclechecked)
  settings.load("/program_files/explorer.cfg")
  settings.set("minexp.recycle_on_leave", recyclechecked)
  settings.set("minexp.disable_hotkeys", settings.get("minexp.disable_hotkeys"))
  settings.set("minexp.disable_hotkeys", settings.get("minexp.recycle_directory"))
  settings.save("/program_files/minex/explorer.cfg")
end
recycleonleave:onChange(recycleonleavecheckboxchange)

local function disablehotkeysonchange(self)
  local hotdisablecheck = self:getValue()
  basalt.debug(hotdisablecheck)
  settings.load("/program_files/explorer.cfg")
  settings.set("minexp.recycle_on_leave", settings.get("minexp.recycle_on_leave"))
  settings.set("minexp.disable_hotkeys", hotdisablecheck)
  settings.set("minexp.disable_hotkeys", settings.get("minexp.recycle_directory"))
  settings.save("/program_files/minex/explorer.cfg")
end
dishotkeys:onChange(disablehotkeysonchange)



basalt.autoUpdate()