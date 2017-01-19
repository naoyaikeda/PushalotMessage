#    Copyright 2017 Naoya Ikeda
# 
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
# 
#        http://www.apache.org/licenses/LICENSE-2.0
# 
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

function Send-PushalotMessage {
    param(
        [parameter(Mandatory=$true)]$authToken,
        [parameter(Mandatory=$true)]$message,
        [parameter(Mandatory=$true)]$title
    )
    $endPoint = "https://pushalot.com/api/sendmessage"
    $bodyObj = @{AuthorizationToken=$authToken}

    if($message -ne $null)
    {
        $bodyObj.Add("body", $message)
    }

    if($title -ne $null)
    {
        $bodyObj.Add("title", $title)
    }

    $result = Invoke-RestMethod -Uri $endPoint -Method Post -Body $bodyObj
    $result
}
