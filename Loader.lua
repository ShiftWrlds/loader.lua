if not game:IsLoaded() then
    game.Loaded:Wait()
end

local BaseURL =
    "https://raw.githubusercontent.com/ShiftWrlds/ShiftUniver/main/"

local Games = {
    [94102028993104] = "Games/Mushrooming.lua",
    [140149493280576] = "Games/StealAForest.lua",
}

local ScriptPath = Games[game.PlaceId]

if not ScriptPath then
    warn("Shift Universal: Unsupported PlaceId " .. game.PlaceId)
    return
end

local downloaded, source = pcall(function()
    return game:HttpGet(BaseURL .. ScriptPath)
end)

if not downloaded then
    warn("Shift Universal: Download failed\n" .. tostring(source))
    return
end

local run, compileError = loadstring(source)

if not run then
    warn("Shift Universal: Compile failed\n" .. tostring(compileError))
    return
end

local success, runtimeError = pcall(run)

if not success then
    warn("Shift Universal: Script error\n" .. tostring(runtimeError))
end