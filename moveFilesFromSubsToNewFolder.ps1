# Destination folder where you want to move the files
$destinationFolder = "C:\Users\RayGaither\OneDrive\WorkOneDriveShare\ClientFolders\Paulo\PowerBuilderSQLFilesFlat"

# Use Get-ChildItem to get files from subfolders and move them
Get-ChildItem -Path $sourceFolder -File -Recurse | ForEach-Object {
    # Build the new path in the destination folder
    $newPath = Join-Path -Path $destinationFolder -ChildPath $_.Name
    # Move the file to the new path
    Move-Item -Path $_.FullName -Destination $newPath -Force
}