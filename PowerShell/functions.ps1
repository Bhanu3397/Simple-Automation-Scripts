function Get-ServerType {
    param (
        [Parameter(Mandatory=$true)]
        [string]$ServerName
    )

    if ($ServerName -like "web-*") {
        return "Web Server"
    } elseif ($ServerName -like "db-*") {
        return "Database Server"
    } elseif ($ServerName -like "app-*") {
        return "App Server"
    } else {
        return "Unknown"
    }
}

# Call it a few times
$servers = @("web-01", "db-02", "app-03", "cache-01")

foreach ($server in $servers) {
    $type = Get-ServerType -ServerName $server
    Write-Host "$server --> $type"
}