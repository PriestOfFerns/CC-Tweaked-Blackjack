

local cobalt = dofile("/cobalt/init.lua")

args = {...}



local monitor = peripheral.wrap(args[1] or "monitor_3")
local input = peripheral.wrap(args[2] or "minecraft:barrel_3")
local storage = peripheral.wrap(args[3] or "create:item_vault_0")

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

local function InvCheck()
    local DCount = 0
    for slot, item in pairs(input.list()) do
        term.redirect(term.native())
        print(item.name)
    
        term.redirect(monitor)
        if item.name == "minecraft:Diamond" then
            DCount=DCount+item.count
        end
    end
    return DCount
end


function cobalt.draw()
    if Stage == 0 then
        cobalt.graphics.setBackgroundColor("green")
        cobalt.graphics.print("BLACKJACK",2,2)
        cobalt.graphics.setColor("brown")
        cobalt.graphics.setBackgroundColor("green")
        cobalt.graphics.rect("line",0,0,29,18)
        
        

        cobalt.graphics.setBackgroundColor("brown")
        cobalt.graphics.setColor("white")
        cobalt.graphics.print("Start",11,11)

        Buttons = { {x={10,17},y={10,12},func=Start} }

        cobalt.graphics.setBackgroundColor("green")
    elseif Stage == 1 then
        

        cobalt.graphics.setColor("black")
        
        
        

        cobalt.graphics.setBackgroundColor("black")
        cobalt.graphics.setColor("white")
        cobalt.graphics.print("Back",11,11)


        
        cobalt.graphics.setColor("cyan")
        cobalt.graphics.print("Diamonds: "..tostring(InvCheck()),11,5)


        Buttons = { {x={10,17},y={10,12},func=Back} }
        cobalt.graphics.setBackgroundColor("white")
    end


   
end

function cobalt.mousepressed(x, y, button)
   
    
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