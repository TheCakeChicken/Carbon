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


return function(custom, data)
    print('Loaded')
end