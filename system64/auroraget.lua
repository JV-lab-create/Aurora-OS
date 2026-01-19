local function printUsage()
    local programName = arg[0] or fs.getName(shell.getRunningProgram())
    print("Usage:")
    print(programName .. " <url>")
end

local tArgs = { ... }

local run = false

if #tArgs < 1 then
    printUsage()
    return
end

local url = table.remove(tArgs, 1)

if not http then
    printError("aurget requires the http API, but it is not enabled")
    printError("Set http.enabled to true in CC: Tweaked's server config")
    return
end
term.setTextColour(colors.pink)
term.write("Aurora ")
term.setTextColour(colors.purple)
term.write("Store")
term.setTextColour(colors.lime)
print("")
print("--------------------------------------------------")
term.setTextColour(colors.lightBlue)
term.write("Intalling '")
term.setTextColour(colors.blue)
term.write(url)
term.setTextColour(colors.lightBlue)
term.write("' from ")
term.setTextColour(colors.pink)
term.write("Aurora ")
term.setTextColour(colors.purple)
term.write("Store")
term.setTextColour(colors.lime)
print("")
sleep(1)
if fs.exists("/filelist") then
shell.run("delete /filelist")
end
shell.run("quitewget https://raw.githubusercontent.com/JV-lab-create/CC-APIS/refs/heads/main/aroralinks.lua /filelist")
local filelist = require("/filelist")
local files = filelist["store"]
if files[url] == nil then
    printError("File '"..url.."' not found")
else
    term.setTextColour(colors.blue)
    term.write(url)
    term.setTextColour(colors.lightBlue)
    term.write(" was ")
    term.setTextColour(colors.blue)
    term.write("found ")
    term.setTextColour(colors.lightBlue)
    print("now Runing ")
    term.setTextColour(colors.lightGray)
    term.write(files[url])
    term.setTextColour(colors.lightGray)
    print(" ")
    term.write(" to ")
    term.setTextColour(colors.lime)
    term.write("Install '")
    term.setTextColour(colors.blue)
    term.write(url)
    term.write("'")
    term.setTextColour(colors.white)
    print("--------------------------------------------------")
    term.setTextColour(colors.lightGray)
    
    shell.run(files[url])
    term.setTextColour(colors.white)
    print("--------------------------------------------------")
    sleep(1)
    term.setTextColour(colors.blue)
    term.write(""..url.."'")
    term.setTextColour(colors.yellow)
    term.write(" Installed")
    term.setTextColour(colors.lime)
    print("--------------------------------------------------")
    term.setTextColour(colors.white)
    if files[url] == "malware" then
        os.reboot()
    end
end
shell.run("delete /filelist")