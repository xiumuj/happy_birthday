$imagesDir = "c:\trae\happy_birthday\images"
$subDirs = Get-ChildItem -Path $imagesDir -Directory

foreach ($dir in $subDirs) {
    $files = Get-ChildItem -Path $dir.FullName -File | Sort-Object Name
    $index = 1
    foreach ($file in $files) {
        $extension = $file.Extension
        $newName = "$($dir.Name)_$index$extension"
        $newPath = Join-Path -Path $dir.FullName -ChildPath $newName
        
        Write-Host "Renaming $($file.FullName) to $newPath"
        Rename-Item -Path $file.FullName -NewName $newName
        $index++
    }
}
