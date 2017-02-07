autoload -U compinit && compinit
zmodload -i zsh/complist
################################################################
# Completion options
################################################################
################################
# setopt completion options
################################

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

################################
# zstyle completion options
################################

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
 
################################################################
# Formatting and Messages                                      #
################################################################

# More verbose completion, including descriptions for command options
zstyle ':completion:*' verbose yes

# Show command short descriptions
zstyle ':completion:*' extra-verbose yes

# Group completion matches
zstyle ':completion:*' group-name ''

# Add simple colors to kill
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

################################
# Messages                     #
################################
# format all messages not formatted in bold prefixed with ----
zstyle ':completion:*' format "%F{214}%B-- %d --%b%f"
# format descriptions
zstyle ':completion:*:descriptions' format $"$fg[green]completing %B%d%b%"
# bold and underline normal messages
zstyle ':completion:*:messages' format '%B%U---- %d%u%b'
# format in bold red error messages
zstyle ':completion:*:warnings' format "%B$fg[red]%}---- No match for: $fg[white]%d%b"


################################################################
# Additional completions
################################################################

#----------------------------------------------------------------------
# Disable usernames in tilde completion
# Taken from http://superuser.com/questions/344128/disable-users-from-completing-after-a-in-zsh
#----------------------------------------------------------------------
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
