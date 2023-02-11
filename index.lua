

local cobalt = dofile("/cobalt/init.lua")

args = {...}

local monitor = peripheral.wrap(args[1] or "monitor_2")
local barrel1 = peripheral.wrap(args[2] or "minecraft:barrel_0")
local barrel2 = peripheral.wrap(args[3] or "minecraft:barrel_1")


function cobalt.draw()
    cobalt.graphics.print("Hello world!", 2, 1)
end

function cobalt.load()
    cobalt.graphics.setBackgroundColor(36)
end

-- Start Cobalt's cycle
cobalt.init()