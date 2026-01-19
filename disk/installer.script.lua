--local arg = {...}
isFormatDriveChecked = arg[1]
BuildChaneltoInstall = arg[2]
VersionToInstall = arg[3]
version = arg[4]


print(isFormatDriveChecked)
print(BuildChaneltoInstall)
print(VersionToInstall)
function Install()
if isFormatDriveChecked == "true" then
    shell.run("delete *.*")
end
    if BuildChaneltoInstall == "Alpha" then
        printError(BuildChaneltoInstall .. " Is not supported on this product please try something else")
        sleep(5)
    elseif BuildChaneltoInstall == "from Disk" then
    term.setBackgroundColor(colors.white)
    term.clear()
    term.setTextColor(colors.black)
    term.setCursorBlink(true)
    print("Installing Aurora OS"..version)
    if fs.exists("/system64/") then
        fs.delete("/system64/")
    end
    if fs.exists("/lib/") then
        fs.delete("/lib/")
    end
    if fs.exists("/home/") then
        fs.delete("/home/")
    end
    if fs.exists("/program_files/") then
        fs.delete("/program_files/")
    end
    if fs.exists("/raw/") then
        fs.delete("/raw/")
    end
    if fs.exists("/recycle_bin/") then
        fs.delete("/recycle_bin/")
    end
    if fs.exists("/startup.lua") then
        fs.delete("/startup.lua")
    end
    print("Makeing Directory")
    print("Copying Critical Files")
    fs.makeDir("/program_files/")
    fs.makeDir("/program_files/minexp/")
    fs.copy("/disk/raw/bootupstart.lua", "/startup.lua")
    fs.copy("/disk/raw/", "/system64/")
    fs.copy("/disk/apps/minexp.lua", "/program_files/minex/minexp.lua")
    fs.makeDir("/lib/")
    fs.copy("/disk/BSOD.lua", "/lib/BSOD.lua")
    fs.makeDir("/home/")
    fs.makeDir("/program_files/")
    fs.makeDir("/program_files/minexp/")
    fs.makeDir("/system64/cpl/")
    fs.makeDir("/system64/appsshorts/")
    fs.makeDir("/system64/gamesshorts/")
    fs.makeDir("/system64/recovery/")
    fs.makeDir("/recycle_bin/")
    fs.makeDir("/raw/")
    shell.run("wget run https://raw.githubusercontent.com/Pyroxenium/Basalt/refs/heads/master/docs/install.lua release")
    fs.copy("/basalt.lua", "/lib/basalt.lua")
    fs.delete("/basalt.lua")
    sleep(1)
else
    printError(BuildChaneltoInstall .. " Is not supported on this product please try something else")
    sleep(5)
end
end

Install()