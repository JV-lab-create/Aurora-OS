--local arg = {...}
isFormatDriveChecked = arg[4]
BuildChaneltoInstall = arg[5]
VersionToInstall = arg[6]
version = arg[7]
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