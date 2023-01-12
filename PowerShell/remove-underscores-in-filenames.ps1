$filepath = Get-ChildItem -Path '<file/folder path>' 

$filepath | Rename-Item -NewName { $_.Name -replace '_',' ' }