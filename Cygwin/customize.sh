#!/bin/sh
chere -if -t mintty -o "-i /Cygwin-Terminal.ico"
regtool -w -s set /HKCR/Directory/Background/shell/cygwin64_bash/Icon "$(cygpath -w "$(pwd)")\\Cygwin-Terminal.ico"