@echo off
cd /d E:\Projects
if "%1"=="." (cd /d C:\Users\vishn\AppData\Local\nvim)
if "%1"=="cat" (cd catprep.in)
if "%1"=="leet" (cd leetcode-custom-themes)
if "%1"=="search" (cd search-extension)
if "%1"=="one" (cd onepiecebounty)
if "%1"=="vim" (cd vim-motions)
if "%1"=="swap" (cd /d "C:\Users\vishn\AppData\Local\nvim-data\swap")
