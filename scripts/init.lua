ENABLE_DEBUG_LOG = true -- Disable before any releases

local variant = Tracker.ActiveVariantUID
IS_ITEMS_ONLY = variant:find("itemsonly")

if ENABLE_DEBUG_LOG then
    print("Debug logging is enabled!")
end

ScriptHost:LoadScript("scripts/utils.lua")
ScriptHost:LoadScript("scripts/logic.lua")
ScriptHost:LoadScript("scripts/layouts.lua")

if not IS_ITEMS_ONLY then
    Tracker:AddMaps("maps/maps.json")
    ScriptHost:LoadScript("scripts/items.lua")
    ScriptHost:LoadScript("scripts/locations.lua")
end

if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end

initialize_watch_items()