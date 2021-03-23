
$RequestAccessTokenUri = "https://login.microsoftonline.com/$TenantId/oauth2/token"
$body = "grant_type=client_credentials&client_id=$ClientId&client_secret=$ClientSecret&resource=$Resource"
$Token = Invoke-RestMethod -Method Post -Uri $RequestAccessTokenUri -Body $body -ContentType 'application/x-www-form-urlencoded'

Write-Output "Token: "; $Token

# # Hit website
#$SiteUri = "https://samplecrm-myrapp-test.azurewebsites.net"
$SiteUri = $Resource
Write-Output "Site: "; $SiteUri

$Headers = @{}
$Headers.Add("Authorization","$($Token.token_type)"+ " " + "$($Token.access_token)")
$Headers.Add("Accept", "*/*")
$Headers.Add("Accept-Encoding", "gzip, deflate, br")
$Headers

$result = Invoke-RestMethod -Method Get -Uri $SiteUri -Headers $Headers

