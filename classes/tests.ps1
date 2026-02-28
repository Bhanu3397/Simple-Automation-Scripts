class Person {
    [string]$FirstName
    [string]$LastName
    [int]$Age

    Person([string]$firstName, [string]$lastName, [int]$age) {
        $this.FirstName = $firstName
        $this.LastName  = $lastName
        $this.Age       = $age
    }

    # A method that returns the full name
    [string] GetFullName() {
        return "$($this.FirstName) $($this.LastName)"
    }

    # A method that checks if they are an adult
    [bool] IsAdult() {
        return $this.Age -ge 18
    }

    # A method with no return value — just does something
    Introduce() {
        Write-Host "Hi, I am $($this.GetFullName()) and I am $($this.Age) years old"
    }
}

$person1 = [Person]::new("Bhanu", "Kumar", 30)
$person2 = [Person]::new("Alex", "Smith", 15)

$person1.Introduce()
$person2.Introduce()

Write-Host "$($person1.GetFullName()) is adult: $($person1.IsAdult())"
Write-Host "$($person2.GetFullName()) is adult: $($person2.IsAdult())"