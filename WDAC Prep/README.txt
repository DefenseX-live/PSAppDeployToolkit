This is a location to put evidences of PackageInspector.exe and Get-Driverlist

These will both map detials regarding file paths to help make wdac policy and give meta information

Example Usage:
PackageInspector.exe Start C: -path <Path to exe / msi>
Install file
PackageInspector.exe Stop C: -out list -ListPath <Path to output file>

PackageInspector.exe Start C: -path "C:\Users\RichardHarris\Desktop\npp.8.7.1.Installer.x64.exe"
PackageInspector.exe Stop C: -out list -ListPath "C:\Users\RichardHarris\Desktop\Notepad_check.txt"

$files = Get-SystemDriver -UserPEs -NoShadowCopy -NoScript -ScanPath "C:\Program Files\Notepad++"