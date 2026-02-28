class Vehicle {
    [string]$Id
    [string]$Make
    [string]$Model
    [string[]]$Features

    Vehicle([string]$id, [string]$make, [string]$model) {
        $this.Id       = $id
        $this.Make     = $make
        $this.Model    = $model
        $this.Features = @()
    }

    [bool] HasFeature([string]$feature) {
        return $this.Features -contains $feature
    }

    [string[]] FindFeatures([string]$prefix) {
        return $this.Features | Where-Object { $_ -like "$prefix*" }
    }

    Describe() {
        Write-Host "Vehicle: $($this.Make) $($this.Model)"
        Write-Host "Features: $($this.Features -join ', ')"
    }
}

# Create a couple of vehicles
$car1 = [Vehicle]::new("v-001", "Toyota", "Camry")
$car1.Features = @("safety-abs", "safety-airbags", "comfort-heated-seats")

$car2 = [Vehicle]::new("v-002", "Honda", "Civic")
$car2.Features = @("safety-abs", "tech-apple-carplay")

# Test it out
$car1.Describe()
Write-Host "Has ABS: $($car1.HasFeature('safety-abs'))"

$safetyFeatures = $car1.FindFeatures("safety-")
Write-Host "Safety features: $safetyFeatures"