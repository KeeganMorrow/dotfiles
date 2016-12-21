#!/bin/sh

# Used to check if certain things should be restarted
export BSPWM_FIRST_RUN="1"

while :
do
    echo "Entering bspwm wrapper script loop"
    echo "Sourcing bspwm environment"
    source $(dirname $0)/bspwm_env.sh
    echo "Entering bspwm runner script"
    $(dirname $0)/bspwm_runner.sh 2>&1 >> $BSPWM_WRAPPER_LOG
    echo "Completed an iteration of the loop. Hoorah!"
    export BSPWM_FIRST_RUN="0"
done
