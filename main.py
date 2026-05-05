from philh_myftp_biz.terminal import Args
from philh_myftp_biz.process import Run
from philh_myftp_biz.pc import loc

#=======================================================

SOURCE = loc.script

TEMP = loc.temp.child('path')

NAME = loc.script.name

#=======================================================

SOURCE.parent.cd()

hash = '-'.join(f.hash for f in TEMP.descendants if f.ext=='py')

# TODO Pass args

#python -m nuitka ^
#    --assume-yes-for-downloads ^
#    --module "%mod%" ^
#    --include-package=%mod%
