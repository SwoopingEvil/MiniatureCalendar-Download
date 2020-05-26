$urlBase = "http://miniature-calendar.com/wp-content/uploads/"

$StartDate = get-date
$EndDate = [datetime]”04/20/2011 00:00”
$diff = New-Timespan –start $EndDate –end $StartDate
$randomDay = Get-Random -maximum $($diff.Days)
$testDate = $($EndDate).AddDays($randomDay)

$urlYear = $($testDate.ToString('yyyy')) + "/"
$urlMonth = $($testDate.ToString('MM')) + "/"
$urlFileDate = $($testDate.ToString('yyMMdd')) + $($testDate.ToString('ddd')).ToLower()
$url = $urlBase + $urlYear + $urlMonth + $urlFileDate

try {
    Invoke-WebRequest $($url + '.jpg') -OutFile $("C:\" + $urlFileDate + ".jpg")
    Write-Host $($url + '.jpg')
}
catch {
    Invoke-WebRequest $($url + '1.jpg') -OutFile $("C:\" + $urlFileDate + "1.jpg")
    Write-Host $($url + '1.jpg')
}