-- @description Create single region with name prompt from time selection
-- @author Brunetton
-- @version 1
-- @about
--   - User is prompted to enter a name for the created region


-- Get time selection bounds
local time_start, time_end = reaper.GetSet_LoopTimeRange(false, false, 0, 0, false)
if time_end <= time_start then return end

-- Prompt for region name
local b_valid_name_entered, region_name = reaper.GetUserInputs("", 1, "Region (from time selection) name:, extrawidth=250", "" )

-- create region
reaper.AddProjectMarker2(0, true, time_start, time_end, region_name, -1, 0)
