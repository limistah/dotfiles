require("rcmd")

hs = hs
hs.loadSpoon("AClock")

hs.hotkey.bind({ "cmd", "alt" }, "C", function()
	spoon.AClock:toggleShow()
end)

-- hammerspoon can be your next app launcher!!!!
hs.hotkey.bind({ "cmd", "alt" }, "A", function()
	hs.application.launchOrFocus("Arc")
	-- local arc = hs.appfinder.appFromName("Arc")
	-- arc:selectMenuItem({"Help", "Getting Started"})
end)
