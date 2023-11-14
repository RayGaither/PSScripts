$OutputPath = "C:\Users\RayGaither\OneDrive\WorkOneDriveShare\ClientFolders\Paulo\CustomSQLfromPowerBuilderapps"
$outputFile = "$($OutputPath)\output.txt"

$path = "C:\Users\RayGaither\OneDrive\WorkOneDriveShare\ClientFolders\Paulo\CustomSQLfromPowerBuilderapps\2022Applications"
#write-host "Path is  is $($path)"
$pathContent = Get-ChildItem $path
foreach ($folder in $pathContent)
    {    #1
    $newPath = "$($path)\$($folder)"
    $pathContent2 = Get-ChildItem $newPath
   # write-host "newPath is  is $($NewPath)"

    
    foreach ($folder2 in $pathContent2)
        {   #2
        $newPath2 = "$($newPath)\$($folder2)"
      #  $newPath2 | Out-File -FilePath $outputFile -Append
        $pathContent3 = Get-ChildItem $newPath2
        #write-host "newPath2 is  is $($newPath2)"

        foreach ($file in $pathContent3)
            {      #3 
            #Write-Host "file is $($file) Length is:  $($file.length)"  
            
            
            $lines = 0
            try {
                Get-Content "$($newPath2)\$($file)" |%{ $lines++ }   
                }
             Catch   
                { # do nothing
                }
               Finally
               {
                $string = "$($newPath2), $($file), $($file.length), $($lines)"
            
                $string| Out-File -FilePath $outputFile -Append
                }
            }#3
       
        }#2
    }#1

        
<#

    $pathDown2 = Get-ChildItem $pathDown1
    foreach ($pathDown3 in $pathDown2)
        {
        Write-Host "Folder:  $($pathDown3)"
        $files = Get-ChildItem "$($pathDown3)" #-Recurse -File | ForEach-Object 
        foreach ($file in $files)
            {
            # Do something with the file size
        
            Write-Host "File: $($file.Name) size $($file.Length)" 
            }
        }
#>

    



<#
    Get-ChildItem "C:\Users\RayGaither\OneDrive\WorkOneDriveShare\ClientFolders\Paulo\CustomSQLfromPowerBuilderapps\2022Applications\AppManager" -Recurse -File | ForEach-Object 
    {
    # Do something with the file size
    Write-Host "File: $($_.FullName), Size: $($_.Length)"
    }


 get folder size

$Folder = "C:\Users\RayGaither\OneDrive\WorkOneDriveShare\ClientFolders\Paulo\CustomSQLfromPowerBuilderapps\2022Applications\AppManager"
$Items = Get-ChildItem $folder -Recurse -File
$Size = ($Items | Measure-Object -Property Length -Sum).Sum
$count = ($items | Measure-Object).Count
Write-host "The Folder has '$Count' Files with size '$Size'"
#>