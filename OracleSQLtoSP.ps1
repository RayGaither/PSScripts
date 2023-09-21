Select-String -Path "C:\Users\RayGaither\OneDrive\WorkOneDriveShare\ClientFolders\Paulo\Custom SQL from PowerBuilder apps\2022Applications\PBLS\*.*" -Pattern 'insert '

Select-String -Path "." -Pattern 'insert '


Get-ChildItem C:\temp -Filter *.log -Recurse |&nbsp;Select-String "Contoso"&nbsp;| Copy-Item -Destination C:\temp2

Get-ChildItem -Filter *.src -Filter *.src -Recurse | Select-String -Path "." -Pattern 'from '

$mainDir = Get-ChildItem 



$scriptList = Get-ChildItem "$($queryOutputPath)\*.sql"
				foreach ($script in $scriptList) {
					# Clean File Name for Excel output of Worksheet and Table Name
					# Remove invalid Characters, set Pascal Case
					$fn = $script
					$name = $script.BaseName -replace "(?:^|_|-|\s|\s-\s)(\p{L}) ", '' #{ $_.Groups.Value.ToUpper() }
					$tblname = $name -replace " ", ''
					if ($name.Length -gt 25) {$name = $name.Substring(0,25)
                    }


$path = "C:\Users\RayGaither\OneDrive\WorkOneDriveShare\ClientFolders\Paulo\Custom SQL from PowerBuilder apps\2022Applications"
$subDirList = Get-ChildItem $path

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

$x = 0
$path = "C:\Users\RayGaither\OneDrive\WorkOneDriveShare\ClientFolders\Paulo\CustomSQLfromPowerBuilderapps\2022Applications\test"
   # foreach ($subDir in "AppManager") #$subDirList) 
       # {
        # read the dir content list
       "Create procedure Dir as " | Out-File -FilePath "output.sql" -Append
       "begin "  | Out-File -FilePath "output.sql" -Append

        $scriptList = Get-ChildItem $path #$subDir
        $filecount = 0
            foreach ($script in $scriptList)
            {
                $filecount = $filecount + 1
                Write-Host "File number " $($filecount)
                $file1Lines = Get-Content $script #-Path "file1"
                $x = 0
                foreach ($file1Line in $file1Lines)
                {

                    $file1Line | Out-File -FilePath "output.sql" -Append
                    
                    $x = $x + 1
                    Write-Host "Line number" $x
                    Write-Host  $file1Line
                    
                    #$this = $script | select -Property Name
            
                    #Write-Host "This $"($this)""
                    #Write-Host $script.EnumerateFileSystemInfos
                }
            }
        #}
"END " | Out-File -FilePath "output.sql" -Append