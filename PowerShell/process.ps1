function Get-BookInfo {
    param (
        [Parameter(ValueFromPipeline=$true)]
        [string]$Title
    )

    begin {
        Write-Host "=== Book lookup starting ==="
        $count = 0
    }

    process {
        $count++
        Write-Host "$count. Looking up: $Title"
    }

    end {
        Write-Host "=== Done. Looked up $count books ==="
    }
}

$books = @("The Great Gatsby", "To Kill a Mockingbird", "1984")
$books | Get-BookInfo