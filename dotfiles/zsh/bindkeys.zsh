# To see the key combo you want to use just do:
# cat > /dev/null
# And press it

#''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
#' Vi Mode Settings
#''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
# Not all of these belong in this file strictly speaking, but they
# should all be together, so here we go.
bindkey -v

export KEYTIMEOUT=1

#''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
# This stuff came from Pawel Goscicki. Thanks dude!
# http://paulgoscicki.com/archives/2012/09/vi-mode-indicator-in-zsh-prompt/
#''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
# Thanks Ron! (see comments)
function TRAPINT() {
  vim_mode=$vim_ins_mode
  return $(( 128 + $1 ))
}

bindkey '^R' history-incremental-search-backward

#''''''''''''''''''''''''''''''
# vi/m foreground binding
#''''''''''''''''''''''''''''''
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

#''''''''''''''''''''''''''''''
# more vim-like key bindings
#''''''''''''''''''''''''''''''
bindkey -a 'gg' beginning-of-buffer-or-history
bindkey -a 'g~' vi-oper-swap-case
bindkey -a G end-of-buffer-or-history

bindkey -a u undo
bindkey -a '^R' redo
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char

bindkey '^G' what-cursor-position

#TODO: Bind something else to this
#bindkey -M viins '^C' vi-cmd-mode

