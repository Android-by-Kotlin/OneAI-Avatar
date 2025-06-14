# PowerShell script to move files from old package structure to new one
$oldPackagePath = "app/src/main/java/max/ohm/noai"
$newPackagePath = "app/src/main/java/max/ohm/oneai"

# Create the new package directory structure if it doesn't exist
if (-not (Test-Path $newPackagePath)) {
    New-Item -Path $newPackagePath -ItemType Directory -Force
    Write-Host "Created new package directory: $newPackagePath"
}

# Get all directories in the old package structure
$directories = Get-ChildItem -Path $oldPackagePath -Directory

# Create the same directory structure in the new package path
foreach ($dir in $directories) {
    $newDir = Join-Path -Path $newPackagePath -ChildPath $dir.Name
    if (-not (Test-Path $newDir)) {
        New-Item -Path $newDir -ItemType Directory -Force
        Write-Host "Created directory: $newDir"
    }
    
    # Copy all files from old directory to new directory
    $files = Get-ChildItem -Path $dir.FullName -File
    foreach ($file in $files) {
        $destFile = Join-Path -Path $newDir -ChildPath $file.Name
        Copy-Item -Path $file.FullName -Destination $destFile -Force
        Write-Host "Copied file: $($file.FullName) to $destFile"
    }
}

# Copy files in the root of the old package
$rootFiles = Get-ChildItem -Path $oldPackagePath -File
foreach ($file in $rootFiles) {
    $destFile = Join-Path -Path $newPackagePath -ChildPath $file.Name
    Copy-Item -Path $file.FullName -Destination $destFile -Force
    Write-Host "Copied root file: $($file.FullName) to $destFile"
}

# Also handle test directories
$testDirs = @(
    @{Old = "app/src/test/java/max/ohm/noai"; New = "app/src/test/java/max/ohm/oneai"},
    @{Old = "app/src/androidTest/java/max/ohm/noai"; New = "app/src/androidTest/java/max/ohm/oneai"}
)

foreach ($dir in $testDirs) {
    if (Test-Path $dir.Old) {
        # Create the new directory if it doesn't exist
        if (-not (Test-Path $dir.New)) {
            New-Item -Path $dir.New -ItemType Directory -Force
            Write-Host "Created test directory: $($dir.New)"
        }
        
        # Copy all files from old test directory to new test directory
        $files = Get-ChildItem -Path $dir.Old -File
        foreach ($file in $files) {
            $destFile = Join-Path -Path $dir.New -ChildPath $file.Name
            Copy-Item -Path $file.FullName -Destination $destFile -Force
            Write-Host "Copied test file: $($file.FullName) to $destFile"
        }
    }
}

Write-Host "File movement complete!" 