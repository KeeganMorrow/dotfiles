#! /bin/sh

usage(){
    echo "Usage: $0 mode classname [time] command"
    echo "modes: show, hide, toggle, timed"
    echo "Note: Script does not set classname on its own"
    exit 1
}

show(){
    xdotool search --classname $classname windowmap \
    || eval $@ &
}

hide(){
    ! xdotool search --onlyvisible --classname $classname windowunmap
}

toggle(){
    xdotool search --onlyvisible --classname $classname windowunmap \
    || xdotool search --classname $classname windowmap \
    || eval $@ &
}

if [ "$#" -lt 3 ]; then
    echo "Error: Invalid arguments"
    usage
fi

mode=$1
shift
classname=$1
shift
if [ "$mode" = "show" ]; then
    show
elif [ "$mode" = "hide" ]; then
    hide
elif [ "$mode" = "toggle" ]; then
    toggle
elif [ "$mode" = "timed" ]; then
    time=$1
    shift
    show
    sleep $time
    hide
else
    echo "Error: Invalid mode"
    usage
fi

