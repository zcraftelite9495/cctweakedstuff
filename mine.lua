-- Set the turtle to mine downwards in a 3x3 area
local width = 3 -- Width of the area
local height = 3 -- Height of the area (number of layers to mine down)

-- Function to mine a 3x3 area downwards
function mineDown()
    for h = 1, height do
        for w = 1, width do
            for d = 1, width do
                -- Move to the correct position
                if w > 1 then
                    turtle.forward()
                end
                -- Mine down
                turtle.digDown()
                turtle.down()
                -- Return to the original position
                if w > 1 then
                    turtle.back()
                end
            end
            -- Move to the next row
            if w < width then
                turtle.turnRight()
                turtle.forward()
                turtle.turnLeft()
            end
        end
        -- Move back to the starting position
        if h < height then
            turtle.up() -- Go back up to the starting height
            turtle.digDown() -- Mine the block above for the next layer
        end
    end
end

-- Main program execution
mineDown()
