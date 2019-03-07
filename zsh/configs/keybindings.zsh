# give us access to ^Q
stty -ixon

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

# The time the shell waits, in hundredths of seconds, for another key
# # to be pressed when reading bound multi-character sequences.
# #
# # Set to shortest possible delay is 1/100 second.
# # This allows escape sequences like cursor/arrow keys to work,
# # while eliminating the delay exiting vi insert mode.
KEYTIMEOUT=1

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"
