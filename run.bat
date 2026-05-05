@echo off

set "dir=%temp%\nuitka_%Random%"

mkdir "%dir%\%~1"
xcopy /E /I /Y "%~f1" "%dir%\mymod"

(
    echo from runpy import run_module
    echo if __name__=='__main__': run_module^("mymod", run_name="__main__"^)
) > "%dir%\run.py"

::python -m pip install "Nuitka[all]"

python -m nuitka ^
    --assume-yes-for-downloads ^
    --onefile ^
    "--include-module=mymod" ^
    --follow-imports ^
    --remove-output ^
    --debug ^
    "--output-dir=%dir%" ^
    "%dir%\run.py"

rmdir /s /q "%dir%\%~1"

"%dir%\run.exe"
