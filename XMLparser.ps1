# Load the XML data into a variable
$xmlData = [xml](Get-Content -Path 'C:\SSMA_XML\KC_report.xml')

# Define an array to store the data
$data = @()

# Iterate through the XML elements
foreach ($item in $xmlData.SelectNodes('//your_element')) {
    $rowData = New-Object PSObject -Property @{
        'Column1' = $item.SelectSingleNode('element1').InnerText
        'Column2' = $item.SelectSingleNode('element2').InnerText
        # Add more columns as needed
    }
    $data += $rowData
}

# Convert the data to a CSV file
$data | Export-Csv -Path 'output.csv' -NoTypeInformation