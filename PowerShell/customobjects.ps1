# Create a list of servers as custom objects
$servers = @(
    [PSCustomObject]@{ Name = "web-01"; Environment = "prod"; Role = "web"; IsActive = $true  },
    [PSCustomObject]@{ Name = "db-01";  Environment = "prod"; Role = "db";  IsActive = $true  },
    [PSCustomObject]@{ Name = "web-02"; Environment = "dev";  Role = "web"; IsActive = $false },
    [PSCustomObject]@{ Name = "db-02";  Environment = "dev";  Role = "db";  IsActive = $true  }
)

# Print all servers
Write-Host "=== All Servers ==="
$servers | ForEach-Object { Write-Host "$($_.Name) - $($_.Environment) - $($_.Role)" }
Write-Host ""

# Filter prod servers
Write-Host "=== Prod Servers ==="
$prodServers = $servers | Where-Object { $_.Environment -eq "prod" }
$prodServers | ForEach-Object { Write-Host $_.Name }
Write-Host ""

# Filter active servers only
Write-Host "=== Active Servers ==="
$activeServers = $servers | Where-Object { $_.IsActive -eq $true }
$activeServers | ForEach-Object { Write-Host $_.Name }
Write-Host ""

# Filter prod AND active
Write-Host "=== Active Prod Servers ==="
$activeProd = $servers | Where-Object { $_.Environment -eq "prod" -and $_.IsActive -eq $true }
$activeProd | ForEach-Object { Write-Host $_.Name }