if (Test-Path "$env:PUBLIC\Desktop\Microsoft Edge.lnk"){
    throw "Microsoft Edge all users' desktop shortcut exists!"
}else{
    Write-Host "Microsoft Edge all users' desktop shortcut doesn't exist!"
}