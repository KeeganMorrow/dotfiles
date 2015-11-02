#TODO: Figure out how to add plugins
#plugins=($plugins ssh-agent)

# General purpose work paths
hash -d igdev='/usr0/igdev'
hash -d sw='/usr0/igdev/sw'
hash -d swWorking='/usr0/igdev/sw/working'
hash -d swTools='/usr0/igdev/sw/tools'
hash -d grponly='usr0/igdev/grponly'
hash -d swKM='/usr0/igdev/sw/working/kmorrow'

# Ace Paths
hash -d aceRepos='/usr0/igdev/sw/working/kmorrow/ace/aceRepos'
hash -d wallApp='/usr0/igdev/sw/working/kmorrow/ace/aceRepos/wallapp'

# Yocto Build systems on Frogstar
hash -d yoctoAce='/frogstar/scratch/kmorrow/ace/poky'
hash -d yoctoCcp='/frogstar/scratch/kmorrow/ccp/yocto'
hash -d yoctoMuse='/zardoz/scratch/kmorrow/muse/yocto'
hash -d yoctoProgrammer='/zardoz/scratch/kmorrow/ccp-programmer/yocto'

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
export PATH="$PATH:/usr0/igdev/sw/tools/scripts"
