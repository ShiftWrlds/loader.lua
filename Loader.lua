local files = {
    [94102028993104] = "Mushrooming.lua",
    [140149493280576] = "StealAForest.lua",
}

local file = files[game.PlaceId]
if not file then return end

local source = game:HttpGet(
    "https://raw.githubusercontent.com/ShiftWrlds/ShiftUniver/main/"
    .. file .. "?v=" .. os.time()
)

local run, err = loadstring(source)
if not run then
    warn(err)
    return
end

run()
