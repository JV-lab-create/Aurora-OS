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
        shell.run("wget run https://raw.githubusercontent.com/JV-lab-create/Aurora-OS/refs/heads/main/installer/AlphaInstaller.lua")
    else
        printError("Unnable to Connect")
        sleep(4)
    end
end

Install()