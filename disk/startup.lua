-- Aurora OS Installer for 1.0.0 Alpha
-- This will install the OS

-- Please not the configs are here for how the disk is made
-- So if the disk douse not include the files for Installing
-- from the disk, insted of web, it will NOT work if the files
-- don't exsit.

-- OS ONLY Works on advanced computers

-- Checking if Advanced Computer
if not(term.isColor()) then
    printError("You must have a Advanced Computer to install Aurora OS")
    return
end

-- Installer Configs
local formatOnly = false
local ProductName = "Aurora OS"
local version = "1.0.0 ALPHA"
local installerver = "v0.1 ALPHA INSTALLER"
local OnlineOnly = true
-- Not used anymore local BasaltOnDisk = false -- If basalt is not on the Disk. It will require sperate disk
local githubPath = "https://raw.githubusercontent.com/JV-lab-create/Aurora-OS/" -- Github Path for installing from github, can also install other things too

VersionToInstall = "Desktop"
BuildChaneltoInstall = "Alpha"
isFormatDriveChecked = "false"

Installed = false
format = false

shell.run("set", "os.productname", ProductName)

-- Varables
local tx,ty = term.getSize() -- Terminal size (for centering text)

if OnlineOnly then
    if not(http) then
        printError("You must have HTTP on to use this installer")
        return
    end
end



if not http then
    printError("This installer Requires HTTP to function!")
    printError("Set http.enabled to true in CC: Tweaked's server config")
    return
end

-- Loading Process
term.clear()
term.setCursorPos((tx/2)-15,ty-6)
term.write("Setup is loading tempolary files")
term.setCursorPos(tx/2,ty-4)
term.setCursorBlink(true)
term.write("")
sleep(1)
if not(fs.exists("/disk/basalt.lua")) then
    print("Please Insert Basalt Disk")
    while not(fs.exists("/disk/basalt.lua")) do
        sleep(0.1)
    end
end
local basalt = require("/disk/basalt")
--if not(fs.exists("/basalt.lua")) then
--    term.clear()
--   term.setCursorPos(1,1)
--    printError("Unnable to Install basalt")
--    printError("This could happen for many of some reasons")
--    printError("Basalt can't be installed no longer exsits")
--    printError("Not enough space!")
--    return
--end
-- OLD CODE
term.clear()
term.setCursorPos((tx/2)-15,ty-6)
term.write("Setup is loading tempolary files")
term.setCursorPos(tx/2,ty-4)
term.setCursorBlink(true)
term.write("")
sleep(1)
term.clear()
term.setCursorPos(1,1)



-- Basalt
term.setCursorBlink(false)

if not(fs.exists("/disk/startup.lua")) then
    print("Please Insert Setup Disk")
    while not(fs.exists("/disk/installer.script.lua")) do
        sleep(0.1)
    end
end

local frame = 1
local MainFrame = basalt.createFrame():setBackground(colors.black)

local weard -- for some reson it keeps telling me "Unexpected local" so this fixed it

local sub ={
    MainFrame:addFrame():setPosition(2, 2):setSize(tx-2,ty-4):setBackground(colors.white),
    MainFrame:addFrame():setPosition(2, 2):setSize(tx-2,ty-4):setBackground(colors.white):hide(),
    MainFrame:addFrame():setPosition(2, 2):setSize(tx-2,ty-4):setBackground(colors.white):hide(),
    MainFrame:addFrame():setPosition(2, 2):setSize(tx-2,ty-4):setBackground(colors.white):hide(),
}

-- // Handling Errors
local function onProgramError(self, err)
    local errFrame = MainFrame:addFrame()
        :setSize(30, 10)
        :setPosition("parent.w / 2 - self.w / 2", "parent.h / 2 - self.h / 2")

    errFrame:addLabel()
        :setPosition(2, 3)
        :setSize("parent.w - 2", "parent.h - 3")
        :setText(err)

    errFrame:addButton()
        :setPosition("parent.w", 1)
        :setSize(1, 1)
        :setText("X")
        :setBackground(colors.red)
        :setForeground(colors.white)
        :onClick(function()
            errFrame:remove()
        end)
end

local function openSubFrame(id) -- we create a function which switches the frame for us
    if(sub[id]~=nil)then
        for k,v in pairs(sub)do
            v:hide()
        end
        sub[id]:show()
    end
end

openSubFrame(1)


sub[1]:addLabel():setText("Welcome to "..ProductName.."!"):setPosition(2, 2)
sub[1]:addLabel():setText(ProductName.." was created with a passion to make a"):setPosition(2, 4)
sub[1]:addLabel():setText("a GUI in Computer Craft. "..ProductName.." uses Basalt"):setPosition(2, 5)
sub[1]:addLabel():setText("to make beautiful and advanced interfaces."):setPosition(2, 6)
sub[2]:addLabel():setText("Instalation Options"):setPosition(2, 2)
sub[2]:addLabel():setText("Release Chanel"):setPosition(2, 4)
sub[2]:addLabel():setText("Version"):setPosition(2, 6)
sub[2]:addLabel():setText("Format Disk?"):setPosition(2, 8)
sub[4]:addLabel():setText(ProductName.." Has Installed!"):setPosition(2, 2)
local installchanel = sub[2]:addDropdown():setPosition(tx-15, 4)
--installchanel:addItem("Release", colors.green, colors.white)
--installchanel:addItem("Beta", colors.lightGray)
installchanel:addItem("Alpha", colors.lightGray)
--installchanel:addItem("Dev", colors.lightGray)
local versiondrop = sub[2]:addDropdown():setPosition(tx-15, 6)
versiondrop:addItem("Desktop", colors.lightGray)
--versiondrop:addItem("Minimal", colors.lightGray)
versiondrop:addItem("Terminal", colors.lightGray)
--versiondrop:addItem("Standerd", colors.lightGray)
--versiondrop:addItem("Advanced Server", colors.lightGray)
--versiondrop:addItem("Terminal Server", colors.lightGray)
local formatcheck = sub[2]:addCheckbox():setPosition(tx-15, 8)
local InstallerProgram = sub[3]:addProgram()

local nextBtn = MainFrame:addButton():setText("Next"):setSize(6,1):setPosition(tx-7, ty-1):setForeground(colors.black):setBackground(colors.white)

installchanel:onChange(function(self, event, item)
    BuildChaneltoInstall = item.text
end)

versiondrop:onChange(function(self, event, item)
    VersionToInstall = item.text
    if VersionToInstall == "Terminal" then
        installchanel:clear()
        installchanel:addItem("Pre-Alpha", colors.lightGray)
    elseif VersionToInstall == "Desktop" then
        installchanel:clear()
        installchanel:addItem("Alpha", colors.lightGray)
    end
end)


nextBtn:onClick(function(self,event,button,x,y)
    if frame == 1 then
        frame = 2
        nextBtn:setText("Install"):setSize(9,1):setPosition(tx-10, ty-1)
        openSubFrame(2)
    elseif frame == 2 then
        frame = 3
        openSubFrame(3)
        nextBtn:hide()
        if formatcheck:getValue() then
            isFormatDriveChecked = "true"
        else
            isFormatDriveChecked = "false"
        end
        InstallerProgram:execute(Install)
    elseif frame == 4 then
        os.reboot()
    end
end)


InstallerProgram:onError(function(self, event, err)
    onProgramError(self, err)
end)

local function getFilename(sUrl)
    sUrl = sUrl:gsub("[#?].*" , ""):gsub("/+$" , "")
    return sUrl:match("/([^/]+)$")
end

function Install()
    if isFormatDriveChecked == "true" then
        shell.run("rm /*")
    end
    local wtx, wty = term.getSize()
    if VersionToInstall == "Terminal" then
        if BuildChaneltoInstall == "Pre-Alpha" then
            shell.run("set", "os.version", VersionToInstall)
            shell.run("set", "os.buildchanel", BuildChaneltoInstall)
            shell.run("wget", "run", githubPath.."refs/heads/main/installer/TerminalPreAlpha.lua")
        end
    elseif VersionToInstall == "Desktop" then
        if BuildChaneltoInstall == "Alpha" then
            if http.checkURLAsync(githubPath.."refs/heads/main/installer/AlphaInstaller.lua") then
                shell.run("set", "os.version", VersionToInstall)
                shell.run("set", "os.buildchanel", BuildChaneltoInstall)
                shell.run("wget", "run", githubPath.."refs/heads/main/installer/AlphaInstaller.lua")
            end
        end
        elseif BuildChaneltoInstall == "Beta" then
            shell.run("set", "os.version", VersionToInstall)
            shell.run("set", "os.buildchanel", BuildChaneltoInstall)
        elseif BuildChaneltoInstall == "Dev" then
            shell.run("set", "os.version", VersionToInstall)
            shell.run("set", "os.buildchanel", BuildChaneltoInstall)
        elseif BuildChaneltoInstall == "Release" then
            shell.run("set", "os.version", VersionToInstall)
            shell.run("set", "os.buildchanel", BuildChaneltoInstall)
        end
    end
    --shell.run("/rom/programs/http/wget.lua run https://raw.githubusercontent.com/JV-lab-create/Aurora-OS/refs/heads/main/installer/installerinstall.lua" ,isFormatDriveChecked,BuildChaneltoInstall,VersionToInstall,version)


local function CheckFiles()
    return true -- WIP
end





InstallerProgram:onDone(function()
    if CheckFiles() then
        frame = 4
        nextBtn:show()
        nextBtn:setText("Restart PC"):setSize(12,1):setPosition(tx-12, ty-1)
        openSubFrame(4)
    else
        onProgramError(" ", "The System was unnable to Install correcty")
    end
end)

basalt.autoUpdate()


