--[[> Crash Message System by XenusSoft <]]--
--[[>     Copyright 2020 XenusSoft      <]]--  


--<[] INIT VARIABLES []>--
local w, h = term.getSize()
local wm, hm = (w/2), (h/2)
local args = { ... } -- Grab arguments needed in a table that ran with the program


--<[] INIT FUNCTIONS []>--

--< Http >--

function downloadFile(url, dest)
    if not http then
        error("no http api, check with your server admin or enable it in the config file of the mod", 0)
    end
    local x, y = term.getCursorPos()
    term.setCursorPos(-1000000000, -10000000000) -- Bring off the screen so it does not show the temp api installed.
    if not fs.exists(dest) then
        shell.run("wget " .. url .. " " .. dest)
    else
        fs.delete(dest)
        shell.run("wget " .. url .. " " .. dest)
    end
    term.setCursorPos(x, y) -- Bring back whenever the file is installed or updated.
end

--< Text API - Credit to IgorTimofeev for this one >--

function string.split(s, delimiter)
	local parts, index = {}, 1
	for part in s:gmatch(delimiter) do
		parts[index] = part
		index = index + 1
	end

	return parts
end

function string.limit(s, limit, mode, noDots)
	local length = string.len(s)
	
	if length <= limit then
		return s
	elseif mode == "left" then
		if noDots then
			return string.sub(s, length - limit + 1, -1)
		else
			return "?" .. string.sub(s, length - limit + 2, -1)
		end
	elseif mode == "center" then
		local integer, fractional = math.modf(limit / 2)
		if fractional == 0 then
			return string.sub(s, 1, integer) .. "?" .. string.sub(s, -integer + 1, -1)
		else
			return string.sub(s, 1, integer) .. "?" .. string.sub(s, -integer, -1)
		end
	else
		if noDots then
			return string.sub(s, 1, limit)
		else
			return string.sub(s, 1, limit - 1) .. "?"
		end
	end
end

function string.wrap(data, limit)
	if type(data) == "string" then
		data = { data }
	end

	local wrappedLines, result, preResult, position = {}

	for i = 1, #data do
		wrappedLines[i] = data[i]
	end
 
	local i = 1
	while i <= #wrappedLines do
		local position = wrappedLines[i]:find("\n")
		if position then
			table.insert(wrappedLines, i + 1, string.sub(wrappedLines[i], position + 1, -1))
			wrappedLines[i] = string.sub(wrappedLines[i], 1, position - 1)
		end

		i = i + 1
	end

	local i = 1
	while i <= #wrappedLines do
		result = ""

		for word in wrappedLines[i]:gmatch("[^%s]+") do
			preResult = result .. word

			if string.len(preResult) > limit then
				if string.len(word) > limit then
					table.insert(wrappedLines, i + 1, string.sub(wrappedLines[i], limit + 1, -1))
					result = string.sub(wrappedLines[i], 1, limit)
				else
					table.insert(wrappedLines, i + 1, string.sub(wrappedLines[i], string.len(result) + 1, -1))	
				end

				break	
			else
				result = preResult .. " "
			end
		end

        wrappedLines[i] = result:gsub("%s+$", "")
        wrappedLines[i] = wrappedLines[i]:gsub("^%s+", "")

		i = i + 1
	end

	return wrappedLines
end

--<[] START DISPLAY []>--

function display()
-- This part is functioned because we'll want to execute it later on.
term.setBackgroundColor(colors.blue)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1, 1)

print("A error has occurred or something has been detected that may harm your ComputerCraft PC and Aurora OS has stopped all running apps to prevent damage to your ComputerCraft computer.")
print("")
print("If this is your first time seeing this error, reboot the computer, or go to support by emailing to jakevento417@gmail.com or going to https://jv-lab-create.github.io/aurora-os/support")
print("If this error keeps on popping up, this is urgent and needs to be fixed by contacting support.")
print("")
print("ERR_CODE: " .. (args[1] and args[1] or "GENERAL"))
end

function init()
print("")
if args[2] then shell.run(args[2]) end
end

display()
init()

if not args[2] then
print("Press enter...")
while true do
    local ev, p1 = os.pullEventRaw()
    if ev == "key" then
        if p1 == keys.enter or p1 == keys.numPadEnter then
            break
        end
    end
end
local scrollPoint = (math.random(1, 2) == 1 and 1 or -1) 
term.setBackgroundColor(colors.lightBlue)
term.scroll(scrollPoint)
term.setBackgroundColor(colors.white)
for i = 1, h do
    term.scroll(scrollPoint)
    sleep(0.01)
end
sleep(0.1)
term.setBackgroundColor(colors.lightGray)
term.clear()
sleep(0.1)
term.setBackgroundColor(colors.gray)
term.clear()
sleep(0.1)



end

term.setBackgroundColor(colors.black)
term.setTextColor(colors.white)
term.clear()
term.setCursorPos(1,1)


if not args[2] then
	os.reboot()
end
