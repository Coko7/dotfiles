-- Standard Awesome library
local gears = require("gears")
local awful = require("awful")
-- Custom Local Library
-- local titlebar = require("anybox.titlebar")

local _M = {}
local modkey = RC.vars.modkey

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get()
	local clientkeys = gears.table.join(
		awful.key({ modkey }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "toggle fullscreen", group = "client" }),
		awful.key({ modkey, "Shift" }, "c", function(c)
			c:kill()
		end, { description = "close", group = "client" }),
		awful.key(
			{ modkey, "Control" },
			"space",
			awful.client.floating.toggle,
			{ description = "toggle floating", group = "client" }
		),
		awful.key({ modkey, "Control" }, "Return", function(c)
			c:swap(awful.client.getmaster())
		end, { description = "move to master", group = "client" }),
		awful.key({ modkey }, "o", function(c)
			c:move_to_screen()
		end, { description = "move to screen", group = "client" }),
		awful.key({ modkey }, "t", function(c)
			c.ontop = not c.ontop
		end, { description = "toggle keep on top", group = "client" }),
		awful.key({ modkey }, "n", function(c)
			-- The client currently has the input focus, so it cannot be
			-- minimized, since minimized clients can't have the focus.
			c.minimized = true
		end, { description = "minimize", group = "client" }),
		awful.key({ modkey }, "m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "(un)maximize", group = "client" }),
		awful.key({ modkey, "Control" }, "m", function(c)
			c.maximized_vertical = not c.maximized_vertical
			c:raise()
		end, { description = "(un)maximize vertically", group = "client" }),
		awful.key({ modkey, "Shift" }, "m", function(c)
			c.maximized_horizontal = not c.maximized_horizontal
			c:raise()
		end, { description = "(un)maximize horizontally", group = "client" }),

		--- shxkd key binds

		awful.key({ modkey, "Control" }, "i", function() end, { description = "show playing media", group = "system" }),
		awful.key(
			{ modkey, "Control" },
			"Space",
			function() end,
			{ description = "switch keyboard layout", group = "system" }
		),
		awful.key({ modkey, "Shift" }, "e", function() end, { description = "lock the computer", group = "system" }),
		awful.key({ modkey, "Shift" }, "w", function() end, { description = "suspend the computer", group = "system" }),
		awful.key(
			{ modkey, "Shift" },
			"x",
			function() end,
			{ description = "restart sxhkd hotkey daemon", group = "system" }
		),

		-- app launcher bindings (rofi)
		awful.key({ modkey }, "r", function() end, { description = "open the app launcher", group = "app launcher" }),
		awful.key(
			{ modkey, "Shift" },
			"r",
			function() end,
			{ description = "open the command launcher", group = "app launcher" }
		),
		awful.key({ modkey }, ",", function() end, { description = "open the emoji picker", group = "app launcher" }),
		awful.key({ modkey }, "c", function() end, { description = "open the calculator", group = "app launcher" }),

		-- applications bindings
		awful.key({ modkey }, "Return", function() end, { description = "launch Kitty", group = "applications" }),
		awful.key({ modkey }, "b", function() end, { description = "launch Firefox", group = "applications" }),
		awful.key({ modkey }, "e", function() end, { description = "launch Nemo", group = "applications" }),
		awful.key({ modkey }, "y", function() end, { description = "launch FreeTube", group = "applications" }),

		-- flameshot bindings
		awful.key({}, "Print", function() end, { description = "take screenshot (interactive)", group = "flameshot" }),
		awful.key(
			{ "Shift" },
			"Print",
			function() end,
			{ description = "take monitor screenshot", group = "flameshot" }
		),
		awful.key(
			{ "Control" },
			"Print",
			function() end,
			{ description = "take multi-monitor screenshot", group = "flameshot" }
		)
	)

	return clientkeys
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
