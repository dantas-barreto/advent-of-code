local file = io.open("input", "r") -- file opening
assert(file, "Failed to open file")

io.input(file) -- insert open file in input stream

local input = io.read() -- reading input and saving in a variable

local floor = 0
local has_entered = false
for i = 1, string.len(input) do
    local c = string.sub(input, i, i) -- saving each char of string in c
    if c == "(" then
        floor = floor + 1
    end
    if c == ")" then
        floor = floor - 1
    end
    if floor == -1 then
        if has_entered == false then
            print("first time entering floor -1:", i)
            has_entered = true
        end
    end
end

print("final floor:",  floor)



io.close(file) -- closing file
