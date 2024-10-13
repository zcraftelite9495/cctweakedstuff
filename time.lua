-- Open monitor on the side it's attached to (e.g., "right", "left")
local monitor = peripheral.find("monitor")
monitor.clear()
monitor.setTextScale(1)

-- Function to convert and format time to 12-hour format with AM/PM
local function formatTimeWithAMPM(time)
    local hours = math.floor(time)
    local minutes = math.floor((time - hours) * 60)
    local period = "AM"

    if hours >= 12 then
        period = "PM"
        if hours > 12 then
            hours = hours - 12
        end
    elseif hours == 0 then
        hours = 12  -- Midnight is 12:00 AM
    end

    return string.format("%02d:%02d %s", hours, minutes, period)
end

-- Function to check if it's "Sleepy Time" (after 6:32 PM or before 6:32 AM)
local function isSleepyTime(time)
    local hours = math.floor(time)
    local minutes = math.floor((time - hours) * 60)

    -- Check if the time is after 6:32 PM (18:32) or before 6:32 AM (6:32)
    if (hours > 18 or (hours == 18 and minutes >= 32)) or (hours < 6 or (hours == 6 and minutes < 01)) then
        return true
    else
        return false
    end
end

-- Main loop to display the time and "Sleepy Time" if appropriate
while true do
    -- Get the current time in Minecraft (0 to 24)
    local time = os.time()

    -- Clear the monitor and set the cursor position
    monitor.clear()
    monitor.setCursorPos(6, 4)

    -- Format and display the time with AM/PM
    monitor.write(formatTimeWithAMPM(time))

    -- Check if it's "Sleepy Time"
    if isSleepyTime(time) then
        monitor.setCursorPos(4, 3)
        monitor.write("Sleepy Time")
    end

    -- Sleep for 1 second before updating again
    sleep(1)
end
