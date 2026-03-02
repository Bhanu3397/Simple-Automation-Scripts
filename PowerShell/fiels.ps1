# --- Setup: create a fake CMDB folder structure ---

$basePath    = [IO.Path]::Combine($HOME, "fake-cmdb")
$serverPath  = [IO.Path]::Combine($basePath, "Server")

# Create folders if they don't exist
if (-not (Test-Path -Path $serverPath)) {
    New-Item -ItemType Directory -Path $serverPath | Out-Null
    Write-Host "Created folder: $serverPath"
}

# --- Write fake server records as text files ---

$servers = @(
    [PSCustomObject]@{ Id = "web-01"; Name = "web-01"; Environment = "prod"; Role = "web" },
    [PSCustomObject]@{ Id = "db-01";  Name = "db-01";  Environment = "prod"; Role = "db"  },
    [PSCustomObject]@{ Id = "web-02"; Name = "web-02"; Environment = "dev";  Role = "web" }
)

foreach ($server in $servers) {
    $filePath = [IO.Path]::Combine($serverPath, "$($server.Id).txt")
    $content  = "Name: $($server.Name)`nEnvironment: $($server.Environment)`nRole: $($server.Role)"
    [IO.File]::WriteAllText($filePath, $content)
    Write-Host "Written: $filePath"
}

Write-Host ""

# --- Read all server records back ---

Write-Host "=== Reading all server records ==="
$files = Get-ChildItem -Path $serverPath -Filter "*.txt"

foreach ($file in $files) {
    Write-Host "--- $($file.Name) ---"
    $content = [IO.File]::ReadAllText($file.FullName)
    Write-Host $content
    Write-Host ""
}

# --- Check a specific file exists ---

$lookupId   = "web-01"
$lookupPath = [IO.Path]::Combine($serverPath, "$lookupId.txt")

if (Test-Path -Path $lookupPath) {
    Write-Host "=== Found record for $lookupId ==="
    Write-Host ([IO.File]::ReadAllText($lookupPath))
} else {
    Write-Host "No record found for $lookupId"
}

# --- Cleanup ---
Remove-Item -Path $basePath -Recurse
Write-Host ""
Write-Host "Cleaned up fake-cmdb folder"