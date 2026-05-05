@echo off

cls

set "dir=%temp%\nuitka_%Random%"

mkdir "%dir%\%~1"
xcopy /E /I /Y "%~f1" "%dir%\mymod"

(
    echo import sys, os, runpy
    echo sys.path.insert^(0, os.path.dirname^(__file__^)^)
    echo if __name__=='__main__':
    echo     runpy.run_module^("mymod", run_name="__main__"^)
) > "%dir%\run.py"


python -m pip install "Nuitka[all]"


python -m nuitka ^
    --assume-yes-for-downloads ^
    --onefile ^
    --standalone ^
    --enable-plugin=multiprocessing ^
    --follow-imports ^
    --remove-output ^
    --debug ^
    "--output-dir=%dir%" ^
    "%dir%\run.py"

rmdir /s /q "%dir%\mymod"

cls

"%dir%\run.exe"
