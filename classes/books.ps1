class book{
    [string]$Title
    [string]$Author
    [string]$Genre
    [string[]]$Tag

    book([string]$title, [string]$author, [string]$genre){
        $this.Title = $title
        $this.Author = $author
        $this.Genre = $genre
        $this.Tag = @()        
    }
    #check if book has a specific tag
    [bool] HasTag([string]$tag){
        return $this.Tag -contains $tag
    }
    # find tags that start with a given prefix
    [string[]] FindTags([string]$prefix){
        return $this.Tag | Where-Object { $_ -like "$prefix*" } 
    }
    #create a method to display book information
    Describe(){
        Write-Host "Title: $($this.Title)"
        Write-Host "Author: $($this.Author)"
        Write-Host "Genre: $($this.Genre)"
        Write-Host "Tags: $($this.Tag -join ', ')"
    }
}

#Create books
$book1 = [book]::new("The Great Gatsby", "F. Scott Fitzgerald", "Classic")
$book1.Tag = @("classic", "1920s", "American literature")
$book2 = [book]::new("To Kill a Mockingbird", "Harper Lee", "Classic")
$book2.Tag = @("classic", "racism", "American literature")

#Test it all out
$book1.Describe()
Write-Host ""
$book2.Describe()
Write-Host ""
Write-Host "Does 'The Great Gatsby' have the tag '1920s'? $($book1.HasTag('1920s'))"
Write-Host "Does 'To Kill a Mockingbird' have the tag '1920s'? $($book2.HasTag('1920s'))"
Write-Host ""
$classicTags = $book1.FindTags("classic")
Write-Host "Tags for 'The Great Gatsby' that start with 'classic': $($classicTags -join ', ')"
$americanTags = $book1.FindTags("American")
Write-Host "Tags for 'The Great Gatsby' that start with 'American': $($americanTags -join ', ')"