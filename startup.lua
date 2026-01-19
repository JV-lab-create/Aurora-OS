-- ⚠️ This is a critical file ⚠️
-- If this is deleted your computer will not boot anymore and you will have to 
-- Reinstall the Operating System!



term.clear()
sleep(2)
if not(fs.exists("/system64/")) or not(fs.exists("/lib/")) or not(fs.exists("/lib/basalt.lua")) or not(fs.exists("/Home/")) then
if fs.exists("/lib/BSOD.lua") then
shell.run("/lib/BSOD.lua CRITICAL_FILE_NOT_FOUND")
return
else
printError("There was a error on loading the OS")
return
end
end


shell.run("system64/OS_Boot.lua")


shell.run("/system64/desktop.lua")
