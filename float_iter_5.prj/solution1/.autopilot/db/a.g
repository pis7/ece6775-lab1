#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/pis7/ece6775/lab1/float_iter_5.prj/solution1/.autopilot/db/a.g.bc ${1+"$@"}
