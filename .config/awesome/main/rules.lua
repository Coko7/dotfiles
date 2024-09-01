-- Standard awesome library
local awful = require("awful")
-- Theme handling library
local beautiful = require("beautiful")

local _M = {}

-- reading
-- https://awesomewm.org/apidoc/libraries/awful.rules.html

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

function _M.get(clientkeys, clientbuttons)
	local rules = {

		-- All clients will match this rule.
		{
			rule = {},
			properties = {
				border_width = beautiful.border_width,
				border_color = beautiful.border_normal,
				focus = awful.client.focus.filter,
				raise = true,
				keys = clientkeys,
				buttons = clientbuttons,
				screen = awful.screen.preferred,
				placement = awful.placement.no_overlap + awful.placement.no_offscreen,
			},
		},

		-- Floating clients.
		{
			rule_any = {
				instance = {
					"DTA", -- Firefox addon DownThemAll.
					"copyq", -- Includes session name in class.
					"pinentry",
				},
				class = {
					"Arandr",
					"Blueman-manager",
					"Gpick",
					"Kruler",
					"MessageWin", -- kalarm.
					"Sxiv",
					"Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
					"Wpa_gui",
					"veromix",
					"xtightvncviewer",
				},

				-- Note that the name property shown in xprop might be set slightly after creation of the client
				-- and the name shown there might not match defined rules here.
				name = {
					"Event Tester", -- xev.
				},
				role = {
					"AlarmWindow", -- Thunderbird's calendar.
					"ConfigManager", -- Thunderbird's about:config.
					"pop-up", -- e.g. Google Chrome's (detached) Developer Tools.
				},
			},
			properties = {
				floating = true,
			},
		},

		-- Add titlebars to normal clients and dialogs
		{
			rule_any = {
				type = { "normal", "dialog" },
			},
			properties = {
				titlebars_enabled = false,
			},
		},

		-- 1. Main (M)
		{ rule = { class = "FreeTube" }, properties = { screen = 1, tag = "M" } },
		{ rule = { class = "mpv" }, properties = { screen = 1, tag = "M" } },

		-- 2. Web (www)
		{ rule = { class = "firefox" }, properties = { screen = 1, tag = "www" } },
		{ rule = { class = "Brave-browser" }, properties = { screen = 1, tag = "www" } },
		{ rule = { class = "thunderbird" }, properties = { screen = 1, tag = "www" } },

		-- 3. Terminal (term)

		-- 4. Office (note)
		{ rule = { class = "Joplin" }, properties = { screen = 1, tag = "note" } },
		{ rule = { class = "ONLYOFFICE Desktop Editors" }, properties = { screen = 1, tag = "note" } },

		-- 5. Communication & social (chat)
		{ rule = { class = "Signal" }, properties = { screen = 1, tag = "chat" } },
		{ rule = { class = "WebCord" }, properties = { screen = 1, tag = "chat" } },

		-- 6. Graphics design (draw)
		{ rule = { class = "Aseprite" }, properties = { screen = 1, tag = "draw" } },
		{ rule = { class = "Gimp" }, properties = { screen = 1, tag = "draw" } },
		{ rule = { class = "krita" }, properties = { screen = 1, tag = "draw" } },
		{ rule = { class = "com-eteks-sweethome3d-SweetHome3D" }, properties = { screen = 1, tag = "draw" } },

		-- 7. Gaming (game)
		{ rule = { class = "steam" }, properties = { screen = 1, tag = "game" } },
		{ rule = { class = "love" }, properties = { screen = 1, tag = "game" } }, -- Olympus has the "love" class
		{ rule = { class = "MultiMC" }, properties = { screen = 1, tag = "game" } },
		{ rule = { class = "PrismLauncher" }, properties = { screen = 1, tag = "game" } },
		{ rule = { class = "Minecraft Launcher" }, properties = { screen = 1, tag = "game" } },

		-- 8.

		-- 9. Miscellaneous (misc)
		{ rule = { class = "kdenlive" }, properties = { screen = 1, tag = "misc" } },
		{ rule = { class = "openshot" }, properties = { screen = 1, tag = "misc" } },
		{ rule = { class = "QjackCtl" }, properties = { screen = 1, tag = "misc" } },
		{ rule = { class = "qBittorrent" }, properties = { screen = 1, tag = "misc" } },
		-- { rule = { class = "Lxappearance" }, properties = { screen = 1, tag = "misc" } },
	}

	return rules
end

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

return setmetatable({}, {
	__call = function(_, ...)
		return _M.get(...)
	end,
})
