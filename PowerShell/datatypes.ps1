# String and number
$serverName = "web-server-01"
$port = 8080

# Array of tags
$tags = @("env-prod", "role-web", "location-useast")

# Hashtable representing a server
$server = @{
    Name    = $serverName
    Port    = $port
    Tags    = $tags
}

# Print individual values
Write-Host "Server name: $serverName"
Write-Host "Port: $port"
Write-Host "First tag: $($tags[2])"
Write-Host "Server from hashtable: $($server.Name)"