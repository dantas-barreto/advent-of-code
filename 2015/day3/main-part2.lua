local map = {}
local santaX, santaY, roboX, roboY = 0, 0, 0, 0
local gifted_houses = 0

-- generate a key for each position in grid
local function positionKey(x, y)
    return tostring(x) .. "," .. tostring(y)
end

-- set a house as gifted or not
local function dropGift(x, y, gifted)
    local position = positionKey(x, y)
    if gifted == false then
        map[position] = true
        gifted_houses = gifted_houses + 1
    end
end

-- get the value of a position, defaulting to false if not set
local function getPosition(x, y)
    local position = positionKey(x, y)
    return map[position] or false
end

-- reading file code block
local file = io.open("input", "r")
assert(file, "Failed to open file")
io.input(file)
local input = io.read()

-- starting house
dropGift(santaX, santaY, getPosition(santaX, santaY))

for i = 1, string.len(input) do
    local direction = string.sub(input, i, i)
    if i % 2 == 0 then
    -- santa (odd instructions)
        if direction == "^" then
            santaY = santaY + 1
            dropGift(santaX, santaY, getPosition(santaX, santaY))
        end
        if direction == "v" then
            santaY = santaY - 1
            dropGift(santaX, santaY, getPosition(santaX, santaY))
        end
        if direction == "<" then
            santaX = santaX - 1
            dropGift(santaX, santaY, getPosition(santaX, santaY))
        end
        if direction == ">" then
            santaX = santaX + 1
            dropGift(santaX, santaY, getPosition(santaX, santaY))
        end
    else
    -- robo-santa (even instructions)
        if direction == "^" then
            roboY = roboY + 1
            dropGift(roboX, roboY, getPosition(roboX, roboY))
        end
        if direction == "v" then
            roboY = roboY - 1
            dropGift(roboX, roboY, getPosition(roboX, roboY))
        end
        if direction == ">" then
            roboX = roboX + 1
            dropGift(roboX, roboY, getPosition(roboX, roboY))
        end
        if direction == "<" then
            roboX = roboX - 1
            dropGift(roboX, roboY, getPosition(roboX, roboY))
        end
    end
end

print("total houses gifted", gifted_houses)

io.close(file)