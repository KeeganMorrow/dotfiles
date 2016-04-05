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
bindkey -M vicmd v edit-command-line

#''''''''''''''''''''''''''''''
# vi/m foreground binding
#''''''''''''''''''''''''''''''
foreground-vi() {
    # This should work for vi/vim and neovim
    fg %vi || fg %nvim
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
bindkey -M viins '^W' backward-kill-word


bindkey '^E' _expand_alias
#''''''''''''''''''''''''''''''
# History search keybindings
#''''''''''''''''''''''''''''''
bindkey "^n" history-beginning-search-forward
bindkey "^p" history-beginning-search-backward

# Search previously used words
insert-next-word() {
    zle insert-last-word 1
}
zle -N insert-next-word

# Bind this functionality to ctrl+up/down
bindkey -M viins '^[[A'    insert-last-word
bindkey -M viins '^[[B'    insert-next-word

#''''''''''''''''''''''''''''''
# Misc bindings
#''''''''''''''''''''''''''''''
# Remove default ^J accept line binding
bindkey -r '^J'
#''''''''''''''''''''''''''''''
# Completion keybindings
#''''''''''''''''''''''''''''''
# Based off of Christian Neukirchen's blog post:
# http://chneukirchen.org/blog/archive/2013/03/10-fresh-zsh-tricks-you-may-not-know.html
bindkey -M menuselect '/'  accept-and-infer-next-history
bindkey -M menuselect '^N' undo
bindkey -M menuselect '^[^M' accept-and-hold
bindkey -M menuselect '^R' history-incremental-search-forward
bindkey -M menuselect '^[[Z' reverse-menu-complete # Shift Tab

