@echo off

python -m pip install "Nuitka[all]"

python -m nuitka ^
    --assume-yes-for-downloads ^
    --module %1 ^
    --include-package=%~1 ^
    --output-dir=%temp%

cd /d %temp%

python -m %~1
