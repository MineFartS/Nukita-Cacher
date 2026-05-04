@echo off

cls

python -m pip install "Nuitka[all]"

if "%~1"=="" (
    cd "%~dp0"
    set "mod=test"
) else (
    set "mod=%~1"
)

python -m nuitka ^
    --assume-yes-for-downloads ^
    --module "%mod%" ^
    --include-package=%mod%
