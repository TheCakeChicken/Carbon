-------------------------------
-- Carbon Server-side module --
-------------------------------
--[[
	You're probably here because you want to see the code, or modify it for yourself. Cool!
	"ThIS loOkS LIkE adoNiS!11!!!" -- That's because it's inspired by Adonis <3
--]]

local origPrint = print
local origWarn = warn
local script = script
local game = game
getfenv().script = nil
getfenv().game = nil

local print = function(...) origPrint('[Carbon : Info] ', ...) end
local warn = function(...) origWarn('[Carbon : Important] ', ...) end
local alert = function(...) origWarn('[Carbon : Alert] ', ...) end
local error = function(...) origWarn('[Carbon : ERROR] ', ...) end

local server = {}
local service = {}
local client = {} --// Server-sided representation of the client model. Basically a reference to the 'Client' folder

return function(custom, data)

	--// MUTEX Code -- Suggested that this is not edited. If this is edited, you cannot get support if this breaks.
	if _G['__Carbon_Module_MUTEX'] == true then
		if custom == true then
			alert('-----------------------------------------------'..
			'\nCarbon is already running on this server!'..
			'\nThis may mean Carbon has not loaded.'..
			'\nA custom version has been detected. Please only contact TheCakeChicken if you have not edited the MUTEX code.' ..
			'\nIf you only have ONE loader, let your developer know about this error.'..
			'\n-----------------------------------------------')
		else
			alert('-----------------------------------------------'..
			'\nCarbon is already running on this server!'..
			'\nThis may mean Carbon has not loaded.'..
			'\nIf you only have ONE loader, let TheCakeChicken know about this error.'..
			'\n-----------------------------------------------')
		end
	else
		_G['__Carbon_Module_MUTEX'] = true
	end

	if custom == true then
		alert('Custom version of Carbon detected; User provided modules will overwrite any features in the MainModule.')
	end

	--// Now, we define some stuff
	server.Root = script.Parent.Parent --// MainModule
	client.Root = server.Root.Client --// Client folder

	--// Set the client table as a metatable, saves us from having to add every file to the table.
	setmetatable(client, {__index = function(t,i)
		t[i] = t.Root:FindFirstChild(i)
		return t[i]
	end})

	if not data then
		data = require(server.Deps.DefaultData)
		alert('No data was passed to Carbon; Using defaults.')
	end

	server.Data = data
	server.Settings = data.Settings
	server.Debug = data.Debug
	

	server.ModuleLoadOrder = { --// Specify the order we want the server modules to load. Some modules require functions from other modules.

	}

    warn('Loaded')
end