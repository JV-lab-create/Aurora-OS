if fs.exists("/disk/") then
    print("Installing...")
    shell.run("wget https://raw.githubusercontent.com/JV-lab-create/Aurora-OS/refs/heads/main/disk/startup.lua /disk/startup.lua")
    shell.run("wget https://github.com/JV-lab-create/Aurora-OS/blob/main/disk/installer.script.lua /disk/installer.script.lua")
    --shell.run("wget https://raw.githubusercontent.com/JV-lab-create/Aurora-OS/refs/heads/main/disk/basalt.lua /disk/basalt.lua")
    -- you must make a diffrent disk for the basalt
else
    print("Please Insert disk to make install disk")
end