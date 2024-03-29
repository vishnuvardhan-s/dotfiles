# startup stuff
oh-my-posh init pwsh --config "C:\Users\vishn\AppData\Local\Programs\oh-my-posh\themes\multiverse-neon.omp.json" | Invoke-Expression

# aliases
New-Alias -Name v -Value nvim
New-Alias -Name touch -Value New-Item
New-Alias -Name trash -Value Remove-ItemSafely

# bash like auto completion
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# for intellisense
Set-PSReadLineOption -Colors @{ InlinePrediction = '#808080'}

# default location
Set-Location E:\Develop

# vim mode for typing commands
$ESC = "$([char]0x1b)"
$OnViModeChange = [scriptblock] {
    if ($args[0] -eq 'Command') {
        Write-Host -NoNewLine "${ESC}[1 q"
    }
    else {
        Write-Host -NoNewLine "${ESC}[5 q"
    }
}
Set-PsReadLineOption -EditMode Vi -BellStyle None
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $OnViModeChange

# functions
function To {
    param (
        $Location
    )
    if ($Location -eq "one") {
        Set-Location -Path "E:\Develop\onepiecebounty"
    }
    elseif ($Location -eq "dot") {
        Set-Location -Path "C:\Users\vishn\AppData\Local\nvim"
    } 
    elseif ($Location -eq "cat") {
        Set-Location -Path "E:\Develop\catprep.in"
    }
    elseif ($Location -eq "leet") {
        Set-Location -Path "E:\Develop\leetcode-custom-themes"
    }
    elseif ($Location -eq "search") {
        Set-Location -Path "E:\Develop\search-extension"
    }
    elseif ($Location -eq "vim") {
        Set-Location -Path "E:\Develop\vim-motions"
    }
    elseif ($Location -eq "swap") {
        Set-Location -Path "C:\Users\vishn\AppData\Local\nvim-data\swap"
    }
    elseif ($Location -eq "script") {
        Set-Location -Path "C:\Users\vishn\Documents\WindowsPowerShell"
        nvim Microsoft.PowerShell_profile.ps1
    }
    else {
        Write-Host ("None was specified, going to Projects folder")
        Set-Location -Path "E:\Develop"
    }
}

function Config {
    To "dot"
    nvim init.lua
}

function gs {
    git status
}

function gl {
    git status --pretty=oneline
}

function undo {
    git reset HEAD~1
}
