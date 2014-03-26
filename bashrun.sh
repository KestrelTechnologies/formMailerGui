#!/bin/sh

# 2014-03-03 mlrathbun

# bashrun.sh

# This script simply executes everything passed through
# to it as if the arguments were executed interactively at a bash
# command.

# This technique is needed in order to run commands from Lazarus' TProcess.Execute
# command.  

# If the command echo $HOME was given to Execute where echo is the command
# to execute and $HOME was the arguement to echo, then result of Execute would be that
# the echo command won't be executed as the builtin bash echo command, but rather the
# the external /bin/echo binary program would run, and it doesn't handle $ expansion
# because $ expansion is only done by bash.

# Likewise, if Execute is setup with '/usr/local/bin/bash echo $HOME', $HOME is still
# not expanded.

# However, by setting up Execute with './bashrun.sh echo $HOME', the arguments listed
# will be executed within the script verbatim, whether they be linux commands or shell
# commands, expanding $ as expected.

#set -x
#echo $*

# This is what works:
eval $*

# SRR says to try this rather than eval $*, but it doesn't work.
#"$&"
#set +x
