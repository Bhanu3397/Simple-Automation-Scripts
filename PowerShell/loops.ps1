$servers = @("web-01", "db-01", "web-02", "db-02")

foreach ($server in $servers) {
    if ($server -like "web-*") {
        Write-Host "$server is a web server"
    } elseif ($server -like "db-*") {
        Write-Host "$server is a database server"
    } else {
        Write-Host "$server is unknown"
    }
}