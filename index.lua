

local cobalt = dofile("/cobalt/init.lua")

args = {...}



local monitor = peripheral.wrap(args[1] or "monitor_2")
local barrel1 = peripheral.wrap(args[2] or "minecraft:barrel_0")
local barrel2 = peripheral.wrap(args[3] or "minecraft:barrel_1")

local Buttons = {}

local Stage = 0

term.redirect(monitor)

term.clear()

local function Start()
    Stage=1
end

function cobalt.draw()
    if Stage == 0 then
        cobalt.graphics.print("BLACKJACK",2,2)
        cobalt.graphics.setColor("brown")
        cobalt.graphics.rect("line",0,0,29,18)
        
        cobalt.graphics.rect("fill",10,10,29,18)


        cobalt.graphics.setColor("white")
        cobalt.graphics.print("BLACKJACK",10,10)

        Buttons = { {x={10,28},y={10,18},func=Start} }
    elseif Stage == 1 then
        cobalt.graphics.setBackgroundColor("white")
    end
end



function cobalt.load()
    cobalt.graphics.setBackgroundColor("lime")
end

function cobalt.mousepressed(x, y, button)
    if button == 1 and Buttons.length > 0 then
        for k,v in pairs(Buttons) do
            if x > v.x[1] and x < v.x[2] and y > v.y[1] and y < v.y[2] then
                v.func()
            end
        end
    end
    
end




-- Start Cobalt's cycle
cobalt.init()