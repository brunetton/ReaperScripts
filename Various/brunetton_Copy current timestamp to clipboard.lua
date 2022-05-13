-- @description Copy (formatted) cursor current timestamp to clipboard
-- @author Brunetton
-- @version 1
-- @about
--   - Examples of copied timestamps: "00:56.177", "05:01:28.399"
--   - requires Ultraschall-API ! https://ultraschall.fm/api/; install it first before using this script
--      - add https://github.com/ReaTeam/Extensions/raw/master/index.xml to Reascripts sources
--      - install "js_ReaScriptAPI: API functions for ReaScripts"


-- Load Ultraschall-API
dofile(reaper.GetResourcePath().."/UserPlugins/ultraschall_api.lua")


function disp_time(time)
    -- return string representation of time (in seconds)
    -- examples:
    --    disp_time(56.17700566747) => "00:56.177"
    --    disp_time(18088.39901735) => "05:01:28.399"
    local hours = math.floor(math.fmod(time, 86400)/3600)
    local minutes = math.floor(math.fmod(time,3600)/60)
    local seconds = math.floor(math.fmod(time,60))
    local ms = math.floor(math.fmod(time,1) * 1000)
    if hours > 0 then
        return string.format("%02d:%02d:%02d.%03d",hours,minutes,seconds,ms)
    else
        return string.format("%02d:%02d.%03d",minutes,seconds,ms)
    end
end


-- Get current position (in seconds and milliseconds)
raw_pos=reaper.GetCursorPosition()
-- reaper.ShowConsoleMsg(pos)
-- reaper.ShowConsoleMsg("\n")
formatted_pos=disp_time(raw_pos)
-- reaper.ShowConsoleMsg("res: ")
-- reaper.ShowConsoleMsg(formatted_pos)
-- reaper.ShowConsoleMsg("\nEND\n")

-- Copy formatted_pos to clipboard
ToClip(formatted_pos)
