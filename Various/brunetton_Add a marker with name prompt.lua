-- @description Add a marker on current play position, asking for name
-- @author Brunetton
-- @version 1
-- @about
--   - User is prompted to enter a name for the created marker

-- Get time selection bounds
local time = reaper.GetCursorPosition()
if not time then return end

-- Prompt for name
local b_valid_name_entered, name = reaper.GetUserInputs("", 1, "Marker name:, extrawidth=250", "" )

-- create marker
local index = reaper.AddProjectMarker(0, false, time, 0, name or "", -1)
