# Define the time range
$StartTime = Get-Date "01/06/2025 07:55:00 AM"
$EndTime = Get-Date "01/06/2025 08:20:00 AM"

# Define relevant Event IDs
$RelevantEventIDs = @(6006, 6008, 1074, 41, 1, 4624, 4647)

# Filter events in the System log based on time and relevant Event IDs
Get-WinEvent -LogName System | Where-Object {
    $_.TimeCreated -ge $StartTime -and
    $_.TimeCreated -lt $EndTime -and
    $_.Id -in $RelevantEventIDs
} | Select-Object TimeCreated, Id, Message | Out-File -FilePath C:\Users\jinhwank\Desktop\RelevantFilteredEvents_Full.txt -Width 300
