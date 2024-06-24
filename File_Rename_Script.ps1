# SET Rename Directory
$Target_Renme_Directory = ".\ChangePath\"

# SET Number Of Digits
$SET_Num_of_Digits = 3

# SET Extension
$SET_Target_Extension = "png"

# SET Rename Filename
$SET_Rename_Filename = "<Rename File name>"

# SET Delimiter
$SET_Delimiter = "_"

# SET Start Counter
$SET_Start_Counter = 1


#----- Main Process -----

$Create_Target_Extension = "*." + $SET_Target_Extension
$Create_Rename_Extension = "." + $SET_Target_Extension
$GET_Target_File_Array = @()
$GET_Target_File_Array += Get-ChildItem $Target_Renme_Directory -Name -include $Create_Target_Extension

[int]$GET_Counter = $SET_Start_Counter

foreach ($line in $GET_Target_File_Array) {
    [string]$Convert_Str_Counter = $GET_Counter
    $Create_Digits = $Convert_Str_Counter.PadLeft($SET_Num_of_Digits, '0')
    $Create_Destination_FileName = $SET_Rename_Filename + $SET_Delimiter +$Create_Digits + $Create_Rename_Extension
    $Create_SourcePath = $Target_Renme_Directory + $line
    Rename-Item -Path $Create_SourcePath -NewName $Create_Destination_FileName
    $GET_Counter ++
}

