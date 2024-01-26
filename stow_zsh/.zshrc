###############################################################################
# Plugin configuration
###############################################################################

############################################################
# Set up powerlevel10k instant prompt
############################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

############################################################
# Set up zcomet
############################################################
# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

############################################################
# Plugins
############################################################

########################################
# Oh-My-Zsh plugins
########################################
zcomet load ohmyzsh plugins/gitfast
zcomet load ohmyzsh plugins/pip
zcomet load ohmyzsh plugins/fancy-ctrl-z

########################################
# Prezto plugins
########################################
zcomet load prezto init.zsh
# zcomet load prezto modules/gpg

########################################
# Other Plugins
########################################
zcomet load "zsh-users/zsh-syntax-highlighting"
zcomet load "zsh-users/zsh-completions"
zcomet load "pawel-slowik/zsh-term-title"
zcomet load "jeffreytse/zsh-vi-mode"
zcomet load "laggardkernel/zsh-gpg-agent"

# Taken from zcomet readme
zcomet load junegunn/fzf shell completion.zsh key-bindings.zsh
(( ${+commands[fzf]} )) || ~[fzf]/install --bin


########################################
# Themes
########################################
zcomet load "romkatv/powerlevel10k"

# Enable the transient prompt
POWERLEVEL9K_TRANSIENT_PROMPT=always

# Prompt element configuration
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir_writable dir vcs newline context vi_mode)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time root_indicator virtualenv background_jobs)
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_CONTENT_EXPANSION='$'
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_VIINS_FOREGROUND=76
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_CONTENT_EXPANSION='$'
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_VIINS_FOREGROUND=196

# Mode configuration
POWERLEVEL9K_MODE=nerdfont-complete

# Basic icon configuration
POWERLEVEL9K_ROOT_ICON=\\uF09C
POWERLEVEL9K_TIME_ICON=\\uF017

# Prompt settings
POWERLEVEL9K_PROMPT_ON_NEWLINE=false
POWERLEVEL9K_RPROMPT_ON_NEWLINE=false

# vi_mode settings
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='blue'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_INSERT_MODE_STRING="INSERT"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='red'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='black'
POWERLEVEL9K_VI_COMMAND_MODE_STRING="NORMAL"
POWERLEVEL9K_VI_MODE_VISUAL_BACKGROUND='magenta'
POWERLEVEL9K_VI_MODE_VISUAL_FOREGROUND='black'
POWERLEVEL9K_VI_VISUAL_MODE_STRING="VISUAL"

# dir settings
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

# context settings
POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND='black'
POWERLEVEL9K_CONTEXT_DEFAULT_BACKGROUND='yellow'
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='black'
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND='red'
POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND='black'
POWERLEVEL9K_CONTEXT_SUDO_BACKGROUND='red'
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND='black'
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND='green'
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND='black'
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND='red'

# status configuration
POWERLEVEL9K_STATUS_OK_BACKGROUND='grey'

############################################################
# Plugin Configuration
############################################################

#TODO: Does something belong here?

###############################################################################
# Color configuration
###############################################################################

#TODO: Does something belong here?

###############################################################################
# Shell Configuration
###############################################################################
############################################################
# Basic configuration
############################################################

# If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt auto_cd

# Allow comments even in interactive shells (especially for Muness)
setopt interactive_comments

# Treat these characters as part of a word for navigation (ie vi w)
WORDCHARS='*?_-.[]~&;!#$%^(){}<>'

# Display CPU usage stats for commands taking more than REPORTTIME seconds
REPORTTIME=10

############################################################
# History Configuration
############################################################

# Share history between zsh sessions
setopt share_history

# Do not write events to history that are duplicates of previous events
setopt hist_ignore_dups

# When searching history don't display results already cycled through twice
setopt hist_find_no_dups

# Remove extra blanks from each command line being added to history
setopt hist_reduce_blanks

# Include more information about when the command was executed, etc
setopt extended_history

# Set up the history file
HISTSIZE=500000
SAVEHIST=500000
HISTFILE=~/.zsh_history

############################################################
# Prompt configuration
############################################################

# Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt PROMPT_SUBST

###############################################################################
# Completion Configuration
###############################################################################

zcomet compinit
zmodload -i zsh/complist
############################################################
# Completion options
############################################################
########################################
# setopt completion options
########################################

# Bring up completion menu on abiguous completion
setopt menu_complete

# Unset as to not to collide with menu_complete
unsetopt auto_menu

# Keep the cursor in place until a completion
setopt complete_in_word

# Move the cursor to end after completion
setopt always_to_end

# Add a trailing slash instead of a space
setopt auto_param_slash

# List files like "ls -F"
setopt list_types

# Open completion on globs
setopt glob_complete

# Do not require a leading `.' in filename to be matched
setopt glob_dots

########################################
# zstyle completion options
########################################

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

# match uppercase from lowercase, and left-side substrings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' '+l:|=*'

# Activate menu selection
zstyle ':completion:*' menu select

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _extensions _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
 
########################################
# Completion formatting and Messages
########################################
####################
# Formatting
####################
# More verbose completion, including descriptions for command options
zstyle ':completion:*' verbose yes

# Show command short descriptions
zstyle ':completion:*' extra-verbose yes

# Group completion matches
zstyle ':completion:*' group-name ''

# Completion Styles

# use completion menu, where select is the number of items needed for the menu
# to open
zstyle ':completion:*' menu yes select _complete _ignored _approximate

# list of completion types to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle ':completion:*:approximate:*' max-errors 3

# Formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:options' description yes
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' auto-description '%d'

# when doing an expansion use a custom order of tags
zstyle ':completion:*:expand:*' group-order original all-expansions expansions

# match uppercase from lowercase, and left-side substrings
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' '+l:|=*'

# Use ls colors during command completion
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Expand // to / instead of /*/
zstyle ':completion:*' squeeze-slashes true

############################################################
# Additional completions
############################################################

###############################################################################
# Functions
###############################################################################
# Path modification functions

# Takes a single value to be checked for and
_addpath(){
    addition="$1"
    if [[ ":$PATH:" == *":$addition:"* ]];then
        echo "$addition found in path"
    else
        echo "$addition not found in path, adding"
        export PATH="$addition":$PATH
        echo "PATH is now $PATH"
    fi
}

# Takes a zsh array of path additions
_addpaths(){
    for addition in ${(P)1}; do
        _addpath "$addition"
    done
}

############################################################
# FZF Functions
############################################################
########################################
# Git FZF functions
########################################
# -------------
# Taken from Junegunn's git fzf bindings
# https://gist.github.com/junegunn/8b572b8d4b5eddd8b85e5f4d40f17236
# Modified to use GNU sort instead of git's --sort option
# Added fzf prefix to functions (not doing this broke git)
# Moved ^g^h to ^g^u

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

####################
# List git diffs
####################
fzfgf() {
    is_in_git_repo || return
    git -c color.status=always status --short |
    sk -m --ansi --nth 2..,.. \
        --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1})' |
    cut -c4- | sed 's/.* -> //'
}

####################
# List git branches with a log as a preview
####################
fzfgb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  sk --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1)' |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

####################
# List git tags with a log as a preview
####################
fzfgt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  sk --multi --preview-window right:70% \
    --preview 'git show --color=always {}'
}

####################
# List git commits on current HEAD
####################
fzfgu() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  sk --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always' |
  grep -o "[a-f0-9]\{7,\}"
}

####################
# List git remotes
####################
fzfgr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  sk --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1}' |
  cut -d$'\t' -f1
}

####################
# Git stash browsing tool
# Taken from junegunn's gstash.sh
# https://gist.github.com/junegunn/a563d9e3e07fd721d618562762ec619d
####################

 gstash() {
  is_in_git_repo || return
  local out k reflog
  out=(
    $(git stash list --pretty='%C(yellow)%gd %>(14)%Cgreen%cr %C(blue)%gs' |
      fzf --ansi --no-sort --header='enter:show, ctrl-d:diff, ctrl-o:pop, ctrl-y:apply, ctrl-x:drop' \
          --preview='git stash show --color=always -p $(cut -d" " -f1 <<< {}) | head -'$LINES \
          --preview-window=down:50% --reverse \
          --bind='enter:execute(git stash show --color=always -p $(cut -d" " -f1 <<< {}) | less -r > /dev/tty)' \
          --bind='ctrl-d:execute(git diff --color=always $(cut -d" " -f1 <<< {}) | less -r > /dev/tty)' \
          --expect=ctrl-o,ctrl-y,ctrl-x))
  k=${out[0]}
  reflog=${out[1]}
  [ -n "$reflog" ] && case "$k" in
    ctrl-o) git stash pop $reflog ;;
    ctrl-y) git stash apply $reflog ;;
    ctrl-x) git stash drop $reflog ;;
  esac
}

############################################################
# Other functions
############################################################

#######################################
# Function to read a man page using the Vim superman plugin
# https://github.com/jez/vim-superman
#######################################
vman() {
    vim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}

########################################
# Function for returning to git repo root
########################################
groot(){
    local gitroot=$(git rev-parse --show-cdup)
    if [ -d "$gitroot" ]; then
        echo "Switching to $gitroot"
        cd "$gitroot"
    else
        echo "Git Root detected as $gitroot, but that isn't a valid directory"
    fi
}

############################################################
# Path setup
############################################################
_additional_paths=(
"/sbin"
"/usr/sbin"
"${HOME}/syncsettings/bin"
"${HOME}/local/bin"
"${HOME}/.fzf/bin"
"${HOME}/.local/bin"
)

_addpaths _additional_paths > /dev/null

if (( $+commands[rg] )); then
    # Use rg with fzf
    export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
fi

# Use preview with fzf ctrl-t and completion
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat --color=always --style=numbers --line-range=:500 {} || tree -C {}) 2> /dev/null | head -200'"
export FZF_COMPLETION_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || bat --color=always --style=numbers --line-range=:500 {} || tree -C {}) 2> /dev/null | head -200'"

# Use preview with fzf ctrl r
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:wrap"

if (( $+commands[fd] )); then
    # Use fd instead of find with fzf
     _fzf_compgen_path() {
      fd --hidden --follow --exclude ".git" . "$1"
    }

    # Use fd to generate the list for directory completion
    _fzf_compgen_dir() {
      fd --type d --hidden --follow --exclude ".git" . "$1"
    }
fi

################################################################################
# Aliases
################################################################################
# Always use colordiff
alias diff=colordiff

# Use colored ls (when it makes sense)
alias ls='ls --color=auto'

############################################################
# neovim aliases
############################################################
if (( $+commands[nvim] )) ; then
    alias vim='nvim'
    alias vi='nvim'
    alias vimdiff='nvim -d'
else
    alias vi='vim'
fi

############################################################
# Clipboard Aliases
############################################################
if (( $+commands[getclip] )) ; then
    alias getclip='xclip -selection clipboard -o'
    alias putclip='xclip -selection clipboard'
fi

############################################################
# Aliases to get weather information from wttr.in
############################################################
alias weath='curl -s "wttr.in/Kirkland,Wa"'
alias moon='curl -s "wttr.in/Moon"'

############################################################
# Colored dmesg output through less
############################################################
alias lmesg='dmesg -L=always | less'

############################################################
# less support for more filetypes
############################################################
# Not technically an alias, but fills a similar role
if (( $+commands[lesspipe] )) ; then
    eval $(lesspipe)
fi

if (( $+commands[exa] )) ; then
    alias ls='exa --icons'
fi
############################################################
# Function to show a binary file in vim
############################################################
binview(){
    if [ ! -z "$1" ]; then
        echo "Viewing $1"
        vim $1 -c Vinarise
    else
        echo "Usage: binview [file]"
    fi
}

############################################################
# Function to show a binary diff in vim
############################################################
bindiff(){
    if [ ! -z "$1" ] && [ ! -z "$2" ]; then
        echo "Comparing $1 and $2"
        vimdiff <(hexdump -C $1) <(hexdump -C $2)
    else
        echo "Usage: bindiff [file1] [file2]"
    fi
}

############################################################
# Alias for opening files
############################################################

open(){
    xdg-open "$@" &
}


############################################################
# Git Aliases
############################################################
########################################
# Alias for git - see .gitconfig for subcommand aliases
########################################
alias g='git'

########################################
# Alias to make vimiv run in background
########################################
iv(){
    vimiv "$@" &
}
alias vimiv='iv'

########################################
# Alias make less always have line numbers
########################################
alias less='less -N -R'

########################################
# Use vi style keys for info
########################################
alias info='info --vi-keys'

################################################################################
# Key bindings
################################################################################
# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

# Use 10ms timeout for key sequences
export KEYTIMEOUT=1

########################################
# Overrides for lost bindings
########################################
# Bindkey -v removes bindings that are used by these plugins, re-instante them

############################################################
# History search keybindings
############################################################

# Search previously used words
_insert-next-word() {
    zle insert-last-word 1
}
zle -N _insert-next-word

############################################################
# Completion keybindings
############################################################
# Based off of Christian Neukirchen's blog post:
# http://chneukirchen.org/blog/archive/2013/03/10-fresh-zsh-tricks-you-may-not-know.html
bindkey -M menuselect '^D' undo
bindkey -M menuselect '^R' history-incremental-search-forward
bindkey -M menuselect '^[[Z' reverse-menu-complete # Shift Tab

############################################################
# Misc bindings
############################################################

# Remove default ^J accept line binding (Used by tmux)
bindkey -r '^J'

 # Insert "sudo " at the beginning of the line
function prepend-sudo {
    if [[ $BUFFER != "sudo "* ]]; then
        BUFFER="sudo $BUFFER"; CURSOR+=5
    else
        BUFFER="${BUFFER:gs/sudo /}"
    fi
}

zle -N prepend-sudo

########################################
# FZF keymapping helpers
########################################
join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local char
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(fzfg$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}


function zvm_after_init() {
    # FZF Git functions
    bind-git-helper f b t r u
    unset -f bind-git-helper
    bindkey -M viins '^T' fzf-file-widget
    # This is actually intended for ctr+/
    bindkey -M viins '^_' fzf-cd-widget
    bindkey -M viins '^R' fzf-history-widget

    # This lets us interrupt a command in the middle of typing to run another
    bindkey '^Q' push-line

    # Remove default list-expand mapping
    bindkey -r '^g'

    #Bind list-expand to ^f instead
    bindkey '^f' list-expand

    # Bind this functionality to ctrl+up/down
    bindkey -M viins '^[[A'    insert-last-word
    bindkey -M viins '^[[B'    _insert-next-word

    # Fancy ctrl z plugin
    bindkey '^Z' fancy-ctrl-z

    # Prepend sudo function
    bindkey -M viins '^s' prepend-sudo

    bindkey -M viins '^E' _expand_alias

    # History search functionality
    bindkey "^n" history-beginning-search-forward
    bindkey "^p" history-beginning-search-backward
    bindkey -M menuselect "^n" down-history
    bindkey -M menuselect "^p" up-history

    # Fix for fzf completion
    bindkey '^I' fzf-completion
}

################################################################################
# Exports
################################################################################

# These LS_COLORS values are taken from running dircolors on Ubuntu 18.04
LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

# Use pale night theme for bat
export BAT_THEME="Material-Theme-Palenight"

################################################################################
# Exports based on what is in the path
################################################################################
# Set editor based on what is available
if (( $+commands[nvim] )); then
    export EDITOR='nvim'
elif (( $+commands[vim] )); then
    export EDITOR='vim'
elif (( $+commands[vi] )); then
    export EDITOR='vi'
fi

################################################################################
# Machine specific zsh files
################################################################################
if [ -e "$machinerc" ];then
    echo "Using zshrc for $(hostname)"
    source $machinerc
fi

################################################################################
# Special function overrides
################################################################################
#
################################################################################
# Last minute options
################################################################################
# Prevents ^s from stopping terminal
# <$TTY >$TTY is needed per powerlevel10k author
# https://github.com/romkatv/powerlevel10k/issues/388
stty -ixon <$TTY >$TTY

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
