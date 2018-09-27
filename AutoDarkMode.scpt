#!/usr/bin/osascript
repeat while true
	
	set sunrise to do shell script "sunrise.sh"
	set sunset to do shell script "sunset.sh"
	set sunriseTomorrow to do shell script "sunriseTomorrow.sh"
	
	
	set sunriseTime to date sunrise
	set sunriseTime to sunriseTime - 4 * 60 * 60
	
	set sunsetTime to date sunset
	set sunsetTime to sunsetTime - 4 * 60 * 60
	
	set sunriseTimeTomorrow to date sunriseTomorrow
	set sunriseTimeTomorrow to sunriseTimeTomorrow + 20 * 60 * 60
	
	
	set currentTime to (current date)
	
	tell application "System Events"
		tell appearance preferences
			if (currentTime < sunriseTime) and (currentTime < sunsetTime) then
				set dark mode to true
				set waitUntil to sunriseTime - currentTime
			else if (currentTime > sunriseTime) and (currentTime < sunsetTime) then
				set dark mode to false
				set waitUntil to sunsetTime - currentTime
			else if (currentTime > sunriseTime and currentTime > sunsetTime) then
				set dark mode to true
				set waitUntil to (sunriseTimeTomorrow - currentTime)
			end if
		end tell
	end tell
	delay 10
end repeat

