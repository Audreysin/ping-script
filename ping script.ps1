
# Requires the input file to have a column header named 'Pingable?' which is to be updated by the script

# Set $path to be the path of the file containing the servers/ip address... to be pinged
$path = "C:\Users\aulam\Documents\vi report\vi server list.csv"
$list = import-csv $path

Write-Host "Started Pinging.."

foreach($item in $list) {
    if (test-connection $ip.("Name"<#the name of the column header whose values a re to be pinged#>) -count 1 -quiet) {
        $list.'Pingable?' = 'Yes'

    } else {
         $list.'Pingable?' = 'No'
    }
    [pscustomobject] $list | export-csv -path $path -NoTypeInformation
}

Write-Host "Ping complete"