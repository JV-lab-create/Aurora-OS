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
if VersionToInstall == "Desktop" then
    if BuildChaneltoInstall == "Alpha" then
        shell.run("wget run https://raw.githubusercontent.com/JV-lab-create/Aurora-OS/refs/heads/main/installer/AlphaInstaller.lua")
    elseif BuildChaneltoInstall == "Beta"
        error("No Beta Release")
    elseif BuildChaneltoInstall == "Dev"
        error("No Dev Release")
    elseif BuildChaneltoInstall == "Release"
        error("No Stable Release")
    end
elseif VersionToInstall == "Terminal" then
    if BuildChaneltoInstall == "Pre-Alpha" then
        shell.run("wget run https://raw.githubusercontent.com/JV-lab-create/Aurora-OS/refs/heads/main/installer/AlphaInstaller.lua")
    elseif BuildChaneltoInstall == "Alpha" then
        error("No Alpha Release")
    elseif BuildChaneltoInstall == "Beta" then
        error("No Beta Release")
    elseif BuildChaneltoInstall == "Dev" then
        error("No Dev Release")
    elseif BuildChaneltoInstall == "Release" then
        error("No Stable Release")
    end
end
Install()
