
###############################################################################
# Plugin configuration
###############################################################################
############################################################
# Set up Zplug
############################################################
export ZPLUG_HOME="${HOME}/.zsh/zplug"
zplug_file="${ZPLUG_HOME}/init.zsh"

if [[ ! -d "${ZPLUG_HOME}" ]]; then
    git clone https://github.com/zplug/zplug "${ZPLUG_HOME}"
fi

# shellcheck source=/dev/null
source "${zplug_file}"

############################################################
# Plugins
############################################################

########################################
# Oh-My-Zsh plugins
########################################
zplug "plugins/gitfast",                from:oh-my-zsh
zplug "plugins/pip",                    from:oh-my-zsh

########################################
# Prezto plugins
########################################
zplug "modules/ssh",                    from:prezto
zplug "modules/python",                 from:prezto

########################################
# Other Plugins
########################################
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-completions"

# This way of doing things stolen from arecarn's dotfiles
# https://github.com/arecarn/dotfiles/blob/master/zsh/.zshrc
zplug 'junegunn/fzf', \
    use:"shell", \
    hook-build:'./install --all --no-update-rc --no-key-bindings'
zplug 'junegunn/fzf', as:"command", use:"bin/*"

########################################
# Themes
########################################
zplug "korrow/zsh-themes", as:theme

############################################################
# More zplug boilerplate
############################################################

# Install plugins if there are plugins that have not been installed                                                                              j
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

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

# Disable <C-s> and <C-q>
stty -ixon

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

autoload -U compinit && compinit
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
zstyle ':completion:*' completer _complete _match _approximate
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

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

####################
# Messages                     #
####################
# format all messages not formatted in bold prefixed with ----
zstyle ':completion:*' format "%F{214}%B-- %d --%b%f"
# format descriptions
zstyle ':completion:*:descriptions' format $"$fg[green]completing %B%d%b%"
# bold and underline normal messages
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
# format in bold red error messages
zstyle ':completion:*:warnings' format "%B$fg[red]%}---- No match for: $fg[white]%d%b"


############################################################
# Additional completions
############################################################

########################################
# Disable usernames in tilde completion
# Taken from http://superuser.com/questions/344128/disable-users-from-completing-after-a-in-zsh
########################################
_bangfalse_tilde () {
  # The standard _tilde function with users removed
  [[ -n "$compstate[quote]" ]] && return 1
  local expl suf ret=1
  if [[ "$SUFFIX" = */* ]]; then
    ISUFFIX="/${SUFFIX#*/}$ISUFFIX"
    SUFFIX="${SUFFIX%%/*}"
    suf=(-S '')
  else
    suf=(-qS/)
  fi
  _tags users named-directories directory-stack
  while _tags; do
    _requested named-directories expl 'named directory' compadd "$suf[@]" "$@" -k nameddirs && ret=0
    _requested directory-stack && _directory_stack "$suf[@]" && ret=0
  done
  (( ret )) || return 0
}
compdef _bangfalse_tilde -tilde-


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
        export PATH=$PATH:"$addition"
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
  fzf-tmux -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}


####################
# List git branches with a log as a preview
####################
fzfgb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-tmux --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

####################
# List git tags with a log as a preview
####################
fzfgt() {
  is_in_git_repo || return
  git tag | sort -V --reverse |
  fzf-tmux --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

####################
# List git commits on current HEAD
####################
fzfgu() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-tmux --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

####################
# List git remotes
####################
fzfgr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-tmux --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
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
# Fucntion for returning to git repo root
########################################
groot(){
    local gitroot=$(git rev-parse --show-cdup)
    if [ -d "$gitroot" ]; then
        cd "$gitroot"
    fi
}


################################################################################
# Aliases
################################################################################
# Always use colordiff
alias diff=colordiff

############################################################
# Clipboard Aliases
############################################################
if ! hash getclip 2> /dev/null; then
    alias getclip='xclip -selection clipboard -o'
    alias putclip='xclip -selection clipboard'
fi

############################################################
# Aliases to get weather information from wttr.in
############################################################
alias weath='curl -s "wttr.in/Everett,Wa"'
alias moon='curl -s "wttr.in/Moon"'

############################################################
# Make minicom always have wrapping enabled
############################################################
alias minicom='minicom -w'

############################################################
# Make ssh sessions start in PWD
############################################################
sshcd(){
    \ssh "$@" -t "type $(basename $SHELL) &> /dev/null" &> /dev/null
    if [[ $? -eq 0 ]]; then
        echo "Found matching shell $SHELL"
        ssh_shell="$SHELL"
    else
        echo "Using fallback shell sh"
        ssh_shell="sh"
    fi
    \ssh "$@" -t "cd $(realpath .) ; $ssh_shell -l"
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
# Alias to start vimwiki
########################################
alias vimwiki='vim -c VimwikiIndex'

########################################
# Alias make less always have line numbers
########################################
alias less='less -N -R'

########################################
# Use vi style keys for info
########################################
alias info='info --vi-keys'

########################################
# Always fork zathura into background
########################################
alias zathura='zathura --fork'


########################################
# Mount home machine via sshfs
# Requires key added to authorized_keys
########################################
alias mntkeegpi='sshfs keegan@keegpi.hopto.org:/pi/usr1 /${HOSTNAME}/keegpi'
alias ummntkeegpi='fusermount -u /${HOSTNAME}/keegpi'

################################################################################
# Key bindings
################################################################################
# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

# Use 10ms timeout for key sequences
export KEYTIMEOUT=1

############################################################
# Vi Mode Settings
############################################################
# Not all of these belong in this section strictly speaking, but they
# should all be together, so here we go.

# Use vi keys

bindkey -v
########################################
# This stuff came from Pawel Goscicki. Thanks dude!
# http://paulgoscicki.com/archives/2012/09/vi-mode-indicator-in-zsh-prompt/
########################################
vim_ins_mode="[INS]"
vim_cmd_mode="[CMD]"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Fix a bug when you C-c in CMD mode and you'd be prompted with CMD mode indicator, while in fact you would be in INS mode
# Fixed by catching SIGINT (C-c), set vim_mode to INS and then repropagate the SIGINT, so if anything else depends on it, we will not break it
# Thanks Ron! (see comments from above blog post)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

bindkey -M vicmd '^V' edit-command-line

########################################
# vi/m foreground binding
########################################
foreground-vi() {
    # This should work for vi/vim and neovim
    fg %vi || fg %nvim
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

########################################
# more vim-like key bindings
########################################
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'g~' vi-oper-swap-case
bindkey -a G end-of-buffer-or-history

bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

#TODO: Bind something else to this
#bindkey -M viins '^C' vi-cmd-mode
bindkey -M viins '^W' backward-kill-word

bindkey '^E' _expand_alias

############################################################
# History search keybindings
############################################################
bindkey "^n" history-beginning-search-forward
bindkey "^p" history-beginning-search-backward
bindkey -M menuselect "^n" down-history
bindkey -M menuselect "^p" up-history

# Search previously used words
_insert-next-word() {
    zle insert-last-word 1
}
zle -N _insert-next-word

# Bind this functionality to ctrl+up/down
bindkey -M viins '^[[A'    insert-last-word
bindkey -M viins '^[[B'    _insert-next-word

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

########################################
# FZF keymappings
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

bind-git-helper f b t r u
unset -f bind-git-helper

bindkey -M viins '^T' fzf-file-widget
bindkey -M viins '^Y' fzf-cd-widget
bindkey -M viins '^R' fzf-history-widget

# Remove default list-expand mapping
bindkey -r '^g'
bindkey -r '^u'

#Bind list-expand to ^f instead
bindkey '^f' list-expand

################################################################################
# Exports
################################################################################

############################################################
# Path setup
############################################################
_additional_paths=(
"/sbin"
"/usr/sbin"
"${HOME}/syncsettings/bin"
"${HOME}/bin/bin"
)

_addpaths _additional_paths > /dev/null

export EDITOR=vim

# Socket to use for communicating with bspwm, also in config/bspwm/bspwm_wrapper.sh
export BSPWM_SOCKET="/tmp/bspwm-socket.${USER}"

# Use rg with fzf
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

################################################################################
# Machine specific zsh files
################################################################################

machinerc="${HOME}/.zsh/local/$(hostname).zshrc"
workrc="${HOME}/.zsh/local/work.zshrc"
workpath="/usr0/igdev/"

if [ -e "$machinerc" ];then
    echo "Using zshrc for $(hostname)"
    source $machinerc
fi

if [ -d "$workpath" ]; then
    echo "Using work zshrc"
    source $workrc
fi

################################################################################
# Special function overrides
################################################################################
autoload -U add-zsh-hook

add-zsh-hook precmd precmd_hook_tmux
precmd_hook_tmux() {
    if [[ -n "$TMUX" ]]; then
        tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
    fi
    case $TERM in
        screen*)
            # Set Tmux-title to abbreviated pwd
            print -Pn "\033k%3~\033\\"
            # Set urxvt title to zsh and pwd
            print -Pn "\e]2:tmux:%~\a"
    ;;
    esac
}

add-zsh-hook preexec preexec_hook_tmux
preexec_hook_tmux() {
    case $TERM in
        screen*)
            # Set Tmux-title to running program
            print -Pn "\033k$(echo "$1" | cut -d' ' -f1)\033\\"
            print -Pn "\e]2;tmux:$(echo "$1" | cut -d' ' -f1)\a"
    ;;
    esac
}

