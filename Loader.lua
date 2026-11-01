-- Shift Universal loader v3 | No on-screen notifications
local success, failure = xpcall(function()
    if not game:IsLoaded() then game.Loaded:Wait() end
    assert(type(loadstring) == "function", "loadstring unavailable")
    local files = {
        [94102028993104] = "Mushrooming.lua",
        [140149493280576] = "StealAForest.lua",
    }
    local file = files[game.PlaceId]
    assert(file, "Unsupported PlaceId: " .. tostring(game.PlaceId))
    local url = "https://raw.githubusercontent.com/ShiftWrlds/ShiftUniver/main/" .. file
    local source = game:HttpGet(url .. "?v=" .. tostring(os.time()))
    assert(type(source) == "string" and #source > 0, "Empty download")
    local run, compileError = loadstring(source, "@ShiftUniversal/" .. file)
    assert(run, "Compile failed: " .. tostring(compileError))
    run()
end, function(err)
    return tostring(err)
end)
if not success then warn("[Shift Loader] " .. tostring(failure)) end
