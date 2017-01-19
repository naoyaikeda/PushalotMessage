function Send-PushalotMessage {
    Param($authToken, $message)
    $endPoint = "https://pushalot.com/api/sendmessage"

    $result = Invoke-RestMethod -Uri $endPoint -Method Post -Body @{AuthorizationToken=$authToken;Body=$message}
    $result
}
