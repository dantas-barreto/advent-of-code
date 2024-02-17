local map = {}
local x_cord, y_cord = 0, 0
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
dropGift(x_cord, y_cord, getPosition(x_cord, y_cord))

for i = 1, string.len(input) do
    local direction = string.sub(input, i, i)
    if direction == "^" then
        y_cord = y_cord + 1
        dropGift(x_cord, y_cord, getPosition(x_cord, y_cord))
    end
    if direction == "v" then
        y_cord = y_cord - 1
        dropGift(x_cord, y_cord, getPosition(x_cord, y_cord))
    end
    if direction == "<" then
        x_cord = x_cord - 1
        dropGift(x_cord, y_cord, getPosition(x_cord, y_cord))
    end
    if direction == ">" then
        x_cord = x_cord + 1
        dropGift(x_cord, y_cord, getPosition(x_cord, y_cord))
    end
end

print("total houses gifted", gifted_houses)

io.close(file)