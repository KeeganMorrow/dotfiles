#TODO: Figure out how to add plugins
#plugins=($plugins ssh-agent)

# General purpose work paths
hash -d igdev='/evtfs/igdev/igdev'
hash -d sw='/evtfs/igdev/igdev/grponly/sw'
hash -d swWorking='/evtfs/igdev/igdev/grponly/sw/working'
hash -d swTools='/evtfs/igdev/igdev/grponly/sw/tools'
hash -d swRelease='/evtfs/igdev/igdev/grponly/sw/release'
hash -d grponly='/evtfs/igdev/igdev/grponly'
hash -d swKM='/evtfs/igdev/igdev/grponly/sw/working/kmorrow'

# Ace Paths
hash -d aceRepos='/evtfs/igdev/igdev/grponly/sw/working/kmorrow/ace/aceRepos'
hash -d wallApp='/evtfs/igdev/igdev/grponly/sw/working/kmorrow/ace/aceRepos/wallapp'

# Yocto Build systems on Frogstar
hash -d yoctoAce='/frogstar/scratch/kmorrow/ace/poky'
hash -d yoctoCcp='/frogstar/scratch/kmorrow/ccp/yocto'
hash -d yoctoMuse='/zardoz/scratch/kmorrow/muse/yocto'
hash -d yoctoProgrammer='/zardoz/scratch/kmorrow/ccp-programmer/yocto'

# Project directories
hash -d proj='/evtfs/igdev/igdev/grponly'
hash -d projMuse='/evtfs/igdev/igdev/grponly/muse'
hash -d projAce='/evtfs/igdev/igdev/grponly/ace'
hash -d projHutch='/evtfs/igdev/igdev/grponly/hutch'
hash -d projScout='/evtfs/igdev/igdev/grponly/scout'
hash -d projScout2='/evtfs/igdev/igdev/grponly/scout_two'

# CCP Repos on jeb
hash -d ccpUBoot='/jeb/usr1/uboot-ccp'
hash -d ccpKernel='/jeb/usr1/kernel-ccp'

# Disable annoying ksshaskpass stuff on git push
export SSH_ASKPASS=

#Use colored output for nosetests
alias nose="nosetests --rednose"


# Virtualenv setup stuff
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.3
    export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
    export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

    source /usr/bin/virtualenvwrapper.sh
fi

# Add igdev sw tools to PATH
export PATH="$PATH:/evtfs/igdev/igdev/grponly/sw/tools/scripts"

igpath(){
    result=$(realpath "$@")
    replaced=$(echo $result | sed 's/evtfs\/igdev/usr0/g')
    echo -E $replaced
}

winpath(){
    result=$(realpath "$@")
    replaced=$(echo "$result" | sed 's/\/evtfs\/igdev/Q:/g')
    replaced=$(echo "$replaced" | sed 's:/:\\:g')
    echo -E $replaced
}

alias urxvt='urxvt-256color'
