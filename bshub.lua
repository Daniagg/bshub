local game = game
local placeId = game.PlaceId

if placeId == 17586052747 then
	local success, error = pcall(function()
		local scriptContent = game:HttpGet('https://raw.githubusercontent.com/Daniagg/bshub/refs/heads/main/17586052747.lua')
		if scriptContent then
			local loadedScript = loadstring(scriptContent)
			if loadedScript then
				loadedScript()
			else
				warn("Failed to load script: Invalid Lua code.")
			end
		else
			warn("Failed to retrieve script from URL.")
		end
	end)
	if not success then
		warn("Error loading script 17586052747.lua:", error)
	end
elseif placeId == 12501200809 then
	local success, error = pcall(function()
		local scriptContent = game:HttpGet('https://raw.githubusercontent.com/Daniagg/bshub/refs/heads/main/12501200809.lua')
		if scriptContent then
			local loadedScript = loadstring(scriptContent)
			if loadedScript then
				loadedScript()
			else
				warn("Failed to load script: Invalid Lua code.")
			end
		else
			warn("Failed to retrieve script from URL.")
		end
	end)
	if not success then
		warn("Error loading script:", error)
	end
else
	local success, error = pcall(function()
		local scriptContent = game:HttpGet('https://raw.githubusercontent.com/Daniagg/bshub/refs/heads/main/ifnotsuported.lua')
		if scriptContent then
			local loadedScript = loadstring(scriptContent)
			if loadedScript then
				loadedScript()
			else
				warn("Failed to load script ifnotsuported.lua: Invalid Lua code.")
			end
		else
			warn("Failed to retrieve script ifnotsuported.lua from URL.")
		end
	end)
	if not success then
		warn("Error loading script ifnotsuported.lua:", error)
	end
end
