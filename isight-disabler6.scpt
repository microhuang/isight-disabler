— Intel Mac iSight Disabler
— Tested on OS X 10.11
— Tested on 2015 15″ MBP

— Version 6.0 w/ El Capitan

— Credit to fdoc for Snow Leopard fix in 3.5
— Credit to Mike Mc for Mavericks fix in 5.0 (http://techslaves.org/isight-disabler/, Comment 90)

— Credit to Vento for El Capitan fix in 6.0

— rt@techslaves.org

display dialog “Intel Mac iSight Disabler
brought to you by techslaves.org.

Version 6.0
Support for El Capitan

Any applications currently using the iSight will continue to have access until they are quit or restarted.” buttons {“Enable iSight”, “Disable iSight”} with icon stop

set userChoice to button returned of result

set allDrivers to “”

tell application “Finder”
set driver to “/System/Library/PrivateFrameworks/CoreMediaIOServicesPrivate.framework/Versions/A/Resources/VDC.plugin/Contents/MacOS/VDC”
if exists driver as POSIX file then
set allDrivers to allDrivers & driver & ” ”
end if
set driver to “/System/Library/PrivateFrameworks/CoreMediaIOServices.framework/Versions/A/Resources/VDC.plugin/Contents/MacOS/VDC”
if exists driver as POSIX file then
set allDrivers to allDrivers & driver & ” ”
end if
set driver to “/Library/CoreMediaIO/Plug-Ins/DAL/AppleCamera.plugin/Contents/MacOS/AppleCamera”
if exists driver as POSIX file then
set allDrivers to allDrivers & driver
end if
end tell

if userChoice = “Enable iSight” then
do shell script “/bin/chmod a+r ” & allDrivers with administrator privileges
else if userChoice = “Disable iSight” then
do shell script “/bin/chmod a-r ” & allDrivers with administrator privileges
end if

