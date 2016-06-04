#!/bin/sh

if [ -z ${EMACS} ]; then
   if [ -x "/Applications/Emacs.app/Contents/MacOS/Emacs" ]; then
       EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
   else
       EMACS="emacs"
   fi
fi

${EMACS} -batch -l ert -l scheme-complete.el -l run-tests.el \
         -f ert-run-tests-batch-and-exit
