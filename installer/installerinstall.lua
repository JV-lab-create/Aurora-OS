--local arg = {...}
isFormatDriveChecked = arg[3]
BuildChaneltoInstall = arg[4]
VersionToInstall = arg[5]
version = arg[6]
-- Changed from the WGET

print(isFormatDriveChecked)
print(BuildChaneltoInstall)
print(VersionToInstall)
function Install()
if isFormatDriveChecked == "true" then
    shell.run("delete *.*")
end
    if BuildChaneltoInstall == "Alpha" then
        shell.run("wget run https://raw.githubusercontent.com/JV-lab-create/Aurora-OS/refs/heads/main/installer/AlphaInstaller.lua")
    else
        printError("Unnable to Connect")
        sleep(4)
    end
end

Install()