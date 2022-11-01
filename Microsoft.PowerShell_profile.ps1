# startup stuff
oh-my-posh init pwsh --config "C:\Users\vishn\AppData\Local\Programs\oh-my-posh\themes\multiverse-neon.omp.json" | Invoke-Expression

# aliases
New-Alias -Name v -Value nvim
New-Alias -Name touch -Value New-Item
New-Alias -Name trash -Value Remove-ItemSafely

# functions
function To {
    param (
        $Location
    )
    if ($Location -eq "one") {
        Set-Location -Path "E:\Projects\onepiecebounty"
    }
    elseif ($Location -eq "dot") {
        Set-Location -Path "C:\Users\vishn\AppData\Local\nvim"
    } 
    elseif ($Location -eq "cat") {
        Set-Location -Path "E:\Projects\catprep.in"
    }
    elseif ($Location -eq "leet") {
        Set-Location -Path "E:\Projects\leetcode-custom-themes"
    }
    elseif ($Location -eq "search") {
        Set-Location -Path "E:\Projects\search-extension"
    }
    elseif ($Location -eq "vim") {
        Set-Location -Path "E:\Projects\vim-motions"
    }
    elseif ($Location -eq "swap") {
        Set-Location -Path "C:\Users\vishn\AppData\Local\nvim-data\swap"
    }
    else {
        Write-Host ("None was specified, going to Projects folder")
        Set-Location -Path "E:\Projects"
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
