# Env
#$env:HTTP_PROXY="http://127.0.0.1:10801"
#$env:HTTPS_PROXY="http://127.0.0.1:10801"

# Function
function pdm { python -m pdm $args }
function getip { curl ipinfo.io }
function docker { 
    $sudoCommand = "sudo docker $args"
    Invoke-Expression $sudoCommand
}
function dockerps { sudo docker ps --format "table {{.Names}}\t{{.Ports}}\t{{.Status}}" }
function dockerpsa { sudo docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}\t{{.Status}}" }

# Alias
Set-Alias p pnpm
Set-Alias ll ls
Set-Alias vim nvim
Set-Alias brew scoop
Set-Alias grep findstr
Set-Alias js 'C:\software\apps\webstorm\current\IDE\bin\webstorm64.exe'
Set-Alias py 'C:\software\apps\pycharm-professional\current\IDE\bin\pycharm64.exe'

oh-my-posh init pwsh --config '~/.config/powershell/ryoma.opm.json' | Invoke-Expression
