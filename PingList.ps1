
$listPath = 'C:\Users\argaither\repos\PSScripts'
$listFile = 'ServerList.txt'

$logPath = 'C:\Users\argaither\Documents\Logs'
$logFile = "PingListOutput $(get-date -f yyyyMMddHHmmss).log"

Start-Transcript -Path "$($logPath)\$($logFile)"


$complist = Get-Content "$($listPath)\$($listFile)"

foreach($comp in $complist){
    
    $pingtest = Test-Connection -ComputerName $comp -Quiet -Count 1 -ErrorAction SilentlyContinue

    if($pingtest){

        $date = $(get-date -f yyyyMMdd:HH:mm:ss)
         Write-Host($date + "  " + $comp + "        is online")
         
     }
     else{
        
        $date = $(get-date -f yyyyMMdd:HH:mm:ss)
        Write-Host($date + "  " + $comp + "        is not reachable")
        
     }
  
}



write-host "`n"
Write-Host "Script Completed"
Stop-Transcript