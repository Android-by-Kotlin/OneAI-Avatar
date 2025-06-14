# PowerShell script to rename package from noai to oneai in all Kotlin files
$oldPackage = "max.ohm.noai"
$newPackage = "max.ohm.oneai"

# Find all Kotlin files with the old package name
$files = Get-ChildItem -Path "app/src" -Filter "*.kt" -Recurse | Select-Object -ExpandProperty FullName

foreach ($file in $files) {
    $content = Get-Content -Path $file -Raw
    
    # Replace package declarations
    if ($content -match "package\s+$oldPackage") {
        $newContent = $content -replace "package\s+$oldPackage(\..*)?", "package $newPackage`$1"
        Set-Content -Path $file -Value $newContent
        Write-Host "Updated package declaration in $file"
    }
    
    # Replace import statements
    if ($content -match "import\s+$oldPackage") {
        $newContent = $content -replace "import\s+$oldPackage(\..*)?", "import $newPackage`$1"
        Set-Content -Path $file -Value $newContent
        Write-Host "Updated import statements in $file"
    }
}

Write-Host "Package renaming complete!" 