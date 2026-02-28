class Person {
    [string]$FirstName
    [string]$LastName
    [int]$Age
    [string[]]$Hobbies

    Person([string]$firstName, [string]$lastName, [int]$age) {
        $this.FirstName = $firstName
        $this.LastName  = $lastName
        $this.Age       = $age
        $this.Hobbies   = @()   # start with empty array
    }

    [string] GetFullName() {
        return "$($this.FirstName) $($this.LastName)"
    }

    # Check if person has a specific hobby
    [bool] HasHobby([string]$hobby) {
        return $this.Hobbies -contains $hobby
    }

    # Find hobbies that start with a given prefix
    [string[]] FindHobbies([string]$prefix) {
        return $this.Hobbies | Where-Object { $_ -like "$prefix*" }
    }

    Introduce() {
        Write-Host "Hi, I am $($this.GetFullName())"
        Write-Host "My hobbies are: $($this.Hobbies -join ', ')"
    }
}

# Create people
$person1 = [Person]::new("Bhanu", "Kumar", 30)
$person1.Hobbies = @("outdoor-hiking", "outdoor-cycling", "indoor-reading", "indoor-gaming")

$person2 = [Person]::new("Alex", "Smith", 25)
$person2.Hobbies = @("indoor-reading", "outdoor-swimming")

# Test it all out
$person1.Introduce()
Write-Host ""

Write-Host "Bhanu likes hiking: $($person1.HasHobby('outdoor-hiking'))"
Write-Host "Bhanu likes cooking: $($person1.HasHobby('indoor-cooking'))"
Write-Host ""

$outdoorHobbies = $person1.FindHobbies("outdoor-")
Write-Host "Bhanu's outdoor hobbies: $($outdoorHobbies -join ', ')"

$indoorHobbies = $person1.FindHobbies("indoor-")
Write-Host "Bhanu's indoor hobbies: $($indoorHobbies -join ', ')"