<#
AppManager                                                                                                             
AutoScheduler                                                                                                          
COMMON                                                                                                                 
Daq                                                                                                                    
FRONTENDS                                                                                                              
da---l         9/13/2023   2:15 PM                PBLS                                                                                                                   
da---l         9/13/2023   2:16 PM                Pricing                                                                                                                
da---l         9/13/2023   2:16 PM                QUOTING                                                                                                                
da---l         9/13/2023   2:16 PM                Reports                                                                                                                
da---l         9/13/2023   2:16 PM                RESULTMAN                                                                                                              
da---l         9/13/2023   2:17 PM                ShopLog                                                                                                                
da---l         9/13/2023   2:17 PM                Taskman                                                                                                                
da---l         9/13/2023   2:17 PM                VTE                                                                                                                    

#>



$path = "C:\Users\RayGaither\OneDrive\WorkOneDriveShare\ClientFolders\Paulo\CustomSQLfromPowerBuilderapps\2022Applications\test"
#$subDirList = Get-ChildItem $path
$x = 0
$OutputPath = "C:\Users\RayGaither\OneDrive\WorkOneDriveShare\ClientFolders\Paulo\CustomSQLfromPowerBuilderapps\2022Applications"

$outputFile = "$($OutputPath)\output.txt"


   # foreach ($subDir in "AppManager") #$subDirList) 
       # {
        # read the dir content list
   #    "Create procedure Dir as " | Out-File -FilePath "output.sql" -Append
   #    "begin "  | 
#   Out-File -FilePath $outputFile -Append

        $scriptList = Get-ChildItem $path #$subDir
        $filecount = 0
            foreach ($script in $scriptList)
            {
                $filecount = $filecount + 1
                Write-Host "File number " $($filecount)
                Write-Host "script value $($script)"
                $file1Lines = Get-Content -path "$($path)\$($script)" #-Path "file1"
                $x = 0
                foreach ($file1Line in $file1Lines)
                {

 #                   $file1Line | Out-File -FilePath $outputFile -Append
                    
                    $x = $x + 1
                    Write-Host "Line number" $x
                    Write-Host  $file1Line
                    
                    #$this = $script | select -Property Name
            
                    #Write-Host "This $"($this)""
                    #Write-Host $script.EnumerateFileSystemInfos
                }
                "$($script) Number of lines $($x)" |  Out-File -FilePath $outputFile -Append
            }
            
        #}
