Test-Connection
    [-AsJob]
    [-DcomAuthentication <AuthenticationLevel>]
    [-WsmanAuthentication <String>]
    [-Protocol <String>]
    [-BufferSize <Int32>]
    [-ComputerName] <String[]>
    [-Count <Int32>]
    [-Impersonation <ImpersonationLevel>]
    [-ThrottleLimit <Int32>]
    [-TimeToLive <Int32>]
    [-Delay <Int32>]
    [<CommonParameters>]


#Start-Transcript -Path .\log.txt
#@("1.1.1.1","2.2.2.2") | ForEach {Write-Host $_, "-", ([System.Net.NetworkInformation.Ping]::new().Send($_)).Status}
#Stop-Transcript

Test-Connection -ComputerName (Get-Content 'C:\Users\argaither\repos\PSScripts\ServerList.txt)') -ErrorAction Stop -Count 1 | Out-GridView


Start-Transcript -Path .\log.txt
(Get-Content C:\Users\argaither\repos\PSScripts\ServerList.txt) | ForEach {Test-Connection $_}
Stop-Transcript


#{Write-Host $_, "-", ([System.Net.NetworkInformation.Ping]::new().Send($_)).Status}

Test-Connection EXPSQL20



Get-Content "C:\Users\argaither\repos\PSScripts\ServerList.txt" | foreach { Test-Connection $_ }


$list = get-content "C:\Users\argaither\repos\PSScripts\ServerList.txt"
test-connection $list -AsJob -count 1 | Receive-Job -Wait -AutoRemoveJob  | Out-GridView



$complist = Get-Content "C:\Users\argaither\repos\PSScripts\ServerList.txt"

foreach($comp in $complist){
    
    $pingtest = Test-Connection -ComputerName $comp -Quiet -Count 1 -ErrorAction SilentlyContinue

    if($pingtest){

         Write-Host($comp + " is online")
     }
     else{
        Write-Host($comp + " is not reachable")
     }
     
}