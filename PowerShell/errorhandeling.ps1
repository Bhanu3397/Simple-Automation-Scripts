function Get-BookDetails {
    param (
        [string]$Title,

        [Parameter(Mandatory=$true)]
        [int]$Year
    )

    try {
        # Validate inputs
        if ([string]::IsNullOrWhiteSpace($Title)) {
            throw "Title cannot be empty"
        }

        if ($Year -lt 1000 -or $Year -gt 2100) {
            throw "Year must be between 1000 and 2100, got: $Year"
        }

        # Simulate work
        $book = [PSCustomObject]@{
            Title = $Title
            Year  = $Year
        }

        return $book

    } catch {
        Write-Host "Error in Get-BookDetails: $($_.Exception.Message)"
        return $null
    } finally {
        Write-Host "Get-BookDetails finished for: $Title"
    }
}

# Valid call
$book = Get-BookDetails -Title "The Great Gatsby" -Year 1925
if ($null -ne $book) {
    Write-Host "Got book: $($book.Title) ($($book.Year))"
}

Write-Host ""

# Invalid year
$book2 = Get-BookDetails -Title "Future Book" -Year 9999
if ($null -eq $book2) {
    Write-Host "Book lookup failed"
}

Write-Host ""

# Empty title
$book3 = Get-BookDetails -Title "" -Year 2000
if ($null -eq $book3) {
    Write-Host "Book lookup failed"
}