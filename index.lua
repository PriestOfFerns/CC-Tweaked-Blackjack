

local cobalt = dofile("/cobalt/init.lua")

args = {...}



local monitor = peripheral.wrap(args[1] or "monitor_3")
local barrel1 = peripheral.wrap(args[2] or "minecraft:barrel_2")
local barrel2 = peripheral.wrap(args[3] or "minecraft:barrel_3")

local Buttons = {}

local Stage = 0

term.redirect(monitor)

term.clear()

local function Start()
    Stage=1
end

local function Back()
    Stage = 0
end

function cobalt.draw()
    if Stage == 0 then
        cobalt.graphics.setBackgroundColor("green")
        cobalt.graphics.print("BLACKJACK",2,2)
        cobalt.graphics.setColor("brown")
        cobalt.graphics.rect("line",0,0,29,18)
        
        cobalt.graphics.rect("fill",10,10,2,1)

        cobalt.graphics.setBackgroundColor("brown")
        cobalt.graphics.setColor("white")
        cobalt.graphics.print("BLACKJACK",11,11)

        Buttons = { {x={10,17},y={10,14},func=Start} }
    elseif Stage == 1 then
        

        cobalt.graphics.setColor("black")
        
        
        cobalt.graphics.rect("fill",10,10,2,1)

        cobalt.graphics.setBackgroundColor("black")
        cobalt.graphics.setColor("white")
        cobalt.graphics.print("Back",11,11)

        Buttons = { {x={10,17},y={10,14},func=Back} }
    end


   
end

function cobalt.mousepressed(x, y, button)
    print(x)
    print(y)
    
    if  #Buttons > 0 then
        for k,v in pairs(Buttons) do
            if x > v.x[1] and x < v.x[2] and y > v.y[1] and y < v.y[2] then
                v.func()
            end
        end
    end
    
end



-- Start Cobalt's cycle
cobalt.init()