local basalt = require("basalt")

local main = basalt.createFrame()
main:setBackground(colors.red, "#", colors.yellow)

local title = main:addLabel()
:SetText("Slots")
:setFontSize(4)
:setPosition(2,4)


basalt.autoUpdate()