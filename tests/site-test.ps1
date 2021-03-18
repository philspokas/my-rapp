
$response = Invoke-WebRequest $(appservice.AppServiceApplicationUrl)
if ($response.StatusCode -eq 200) {
    exit 0
}
else {
    $response
    exit $response.StatusCode
}