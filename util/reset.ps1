get-process VBox* | stop-process

$paths = '~/Dockerix/', '~/.docker', '~/.VirtualBox/', '~/Dockerix-bins/', '~/Library/Application Support/Dockerix'

Foreach($path in $paths) {
    if(test-path $path) {
        Remove-Item $path -Force -Recurse
    }
}

$virtualBoxApp = Get-WmiObject -Class Win32_Product | Where {$_.Name -Match 'VirtualBox'}

if($virtualBoxApp -ne $null) {
    $virtualBoxApp.Uninstall()
}