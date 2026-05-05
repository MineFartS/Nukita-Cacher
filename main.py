from philh_myftp_biz.terminal import Args
from philh_myftp_biz.process import Run
from philh_myftp_biz.text import hex
from philh_myftp_biz.pc import loc, Path

from runpy import run_module
from importlib import import_module

#=======================================================

MOD = Path(Args[0])

TEMPDIR = loc.temp.child(hex.encode(MOD.path))

Run(
    args = [
        'nuitka',
        '--assume-yes-for-downloads',
        '--module', MOD.name,
        f'--output-dir={TEMPDIR}'
    ],
    dir = MOD.parent,
    terminal = 'pym'
)
"""
Run(
    args = [MOD.name, *Args],
    dir = TEMPDIR,
    terminal = 'pym'
)
"""
with TEMPDIR.cd:

    run_module(
        mod_name = MOD.name, 
        run_name = "__main__",
        init_globals = {}
    )

    #import_module('__main__', MOD.name)
