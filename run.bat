@echo off

set "dir=%temp%\nuitka_%Random%"

mkdir "%dir%\%~1"
xcopy /E /I /Y "%~f1" "%dir%\%~1"

(
    echo from runpy import run_module
    echo if __name__=='__main__': run_module^("%~1", run_name="__main__"^)
) > "%dir%\run.py"

::python -m pip install "Nuitka[all]"

python -m nuitka ^
    --assume-yes-for-downloads ^
    --onefile ^
    "--include-module=%~1" ^
    --follow-imports ^
    --remove-output ^
    "--output-dir=%dir%" ^
    "%dir%\run.py"

rmdir /s /q "%dir%\%~1"

"%dir%\run.exe"
