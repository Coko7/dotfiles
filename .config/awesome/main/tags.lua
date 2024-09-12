-- Standard awesome library
local awful = require("awful")

local _M = {}

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
	local tags = {}

	local tagpairs = {
		names = {
			"M",
			"www",
			"term",
			"note",
			"chat",
			"draw",
			"game",
			"8",
			"misc",
		},
	}

	awful.screen.connect_for_each_screen(function(s)
		-- Each screen has its own tag table.
		tags[s] = awful.tag(tagpairs.names, s, RC.layouts[2])
	end)

	return tags
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
