#!/bin/sh

# Used to check if certain things should be restarted
export BSPWM_FIRST_RUN="1"
export BSPWM_WRAPPER_LOG="${HOME}/bspwm_log.log"

while :
do
    echo "Entering bspwm wrapper script loop" >> $BSPWM_WRAPPER_LOG
    echo "Sourcing bspwm environment" >> $BSPWM_WRAPPER_LOG
    source $(dirname $0)/bspwm_env.sh 2>&1 >> $BSPWM_WRAPPER_LOG
    echo "Entering bspwm runner script" >> $BSPWM_WRAPPER_LOG
    source $(dirname $0)/bspwm_runner.sh 2>&1 >> $BSPWM_WRAPPER_LOG
    echo "Completed an iteration of the loop. Hoorah!" >> $BSPWM_WRAPPER_LOG
    export BSPWM_FIRST_RUN="0"
done
