@echo on

set "out_dir=%temp%\nukita_%Random%"

python -m pip install "Nuitka[all]"

python -m nuitka ^
    --assume-yes-for-downloads ^
    --standalone ^
    --output-dir="%out_dir%" ^
    --main="%~1"

cd /d "%out_dir%\%~1.dist"

dir

"%~1.exe"

::python -c "import sys, importlib.util; n='%~n1'; s=importlib.util.find_spec(n); m=importlib.util.module_from_spec(s); m.__dict__.update({'__name__': '__main__', '__file__': s.origin, '__builtins__': __builtins__}); sys.modules['__main__'] = m; s.loader.exec_module(m)"

::python -c "import sys, importlib.util; name='%~n1'; spec=importlib.util.find_spec(name); m=importlib.util.module_from_spec(spec); m.__name__='__main__'; sys.modules[name]=m; spec.loader.exec_module(m)"

:: python -c "import runpy; runpy.run_module('%~1', run_name='__main__', init_globals={})"
