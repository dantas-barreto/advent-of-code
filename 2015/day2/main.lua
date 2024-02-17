local function splitDimensions(str)
    local numbers = {}
    for number in string.gmatch(str, "%d+") do
        table.insert(numbers, tonumber(number))
    end
    return numbers
end

local function calculateSurface(numbers)
    local side1 = numbers[1] * numbers[2]
    local side2 = numbers[2] * numbers[3]
    local side3 = numbers[3] * numbers[1]

    local slack= math.min(side1, side2, side3)
    local surface = (2*side1) + (2*side2) + (2*side3)
    return surface + slack
end

local function calculateRibbon(numbers)
    table.sort(numbers) -- sort the table to find the 2 smallests values
    local ribbonWrap = 2 * numbers[1] + 2 * numbers[2] -- perimeter of the present
    local ribbonBow = numbers[1] * numbers[2] * numbers[3]

    return ribbonWrap + ribbonBow
end

local file = io.open("input", "r") -- file opening
assert(file, "Failed to open file")

io.input(file) -- insert open file in input stream

local input = {} -- creating data table
for line in file:lines() do
   table.insert(input, line)
end

local total_paper = 0
local total_ribbon = 0
for _, value in pairs(input) do
    local dimensions = splitDimensions(value)
    total_paper = total_paper + calculateSurface(dimensions)
    total_ribbon = total_ribbon + calculateRibbon(dimensions)
end

print("total wrapping paper needed:", total_paper)
print("total ribbon needed:", total_ribbon)

io.close(file) -- closing file