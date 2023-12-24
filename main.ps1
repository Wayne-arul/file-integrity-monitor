

Write-Host "What would you like to do"
Write-Host "    A) Collect new Baseline?"
Write-Host "    B) Begin monitoring files with saved Baseline?"

$res = Read-Host -Prompt "Please enter 'A' or 'B'"

Function Calculate-File-Hash($filepath){
    $filehash = Get-FileHash -Path $filepath -Algorithm SHA512
    return $filehash
}

Function Erase-File(){
    $a = Test-Path -Path .\baseline.txt
    if($a) {
        Remove-Item -Path .\baseline.txt
    }
}

if($res -eq 'A'.ToUpper()) {
    Erase-File

    $files = Get-ChildItem -Path .\files
    foreach($file in $files){
        $hash = Calculate-File-Hash $file.FullName
        "$($hash.Path)|$($hash.Hash)" | Out-File -FilePath .\baseline.txt -Append
    }
}

elseif($res -eq 'B'.ToUpper()){

    $filedir = @{}

    $filePathsHashes = Get-Content -Path .\baseline.txt
    $filePathsHashes

    foreach($f in $filePathsHashes){
        $filepath = $f.Split("|")[0]
        $hash = $f.Split("|")[1]
        $filedir.add($f.Split("|")[0],$f.Split("|")[1])
    }

    while($true){
        Start-Sleep -Seconds 1
        $files = Get-ChildItem -Path .\files
    foreach($file in $files){
        $hash = Calculate-File-Hash $file.FullName
        #"$($hash.Path)|$($hash.Hash)" | Out-File -FilePath .\baseline.txt -Append

        if($filedir[$hash.Path] -eq $null){
            Write-Host "$($hash.Path) has been created!" -ForegroundColor Green
        }

        else {
            if($filedir[$hash.Path] -eq $hash.Hash){
                #file not changed
            }
            else {
                Write-Host "$($hash.Path) has changed!!!!" -ForegroundColor Red
            }
        }

        foreach($key in $filedir.Keys) {
            $baselineExists = Test-Path -Path $key
            if(-Not $baselineExists) {
                Write-Host "$($key) has been deleted!!" -ForegroundColor Red
            }
        }
    }


}


    #Write-Host "Read exisitng baseline.txt, start monitoring files." -ForegroundColor Yellow
}

