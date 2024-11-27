# Define the backup folder (ensure it exists or create it)
$BackupFolder = "C:\RegistryBackup"
if (!(Test-Path -Path $BackupFolder)) {
    New-Item -ItemType Directory -Path $BackupFolder
}

# List of registry hives to back up
$RegistryHives = @(
    "HKEY_LOCAL_MACHINE\SYSTEM",
    "HKEY_LOCAL_MACHINE\SOFTWARE",
    "HKEY_LOCAL_MACHINE\SECURITY",
    "HKEY_LOCAL_MACHINE\SAM",
    "HKEY_USERS\.DEFAULT",
    "HKEY_CURRENT_USER"
)

# Iterate through each hive and save it as a .hiv file
foreach ($Hive in $RegistryHives) {
    $HiveFileName = $Hive -replace "HKEY_", "" -replace "\\", "_" -replace "\.", "Default"
    $BackupPath = Join-Path -Path $BackupFolder -ChildPath "$HiveFileName.hiv"
    Write-Output "Backing up $Hive to $BackupPath..."
    reg save "$Hive" "$BackupPath" /y > $null 2>&1
}

Write-Output "Registry backup completed. Files are stored in $BackupFolder"
