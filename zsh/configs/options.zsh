# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch


case "$OSTYPE" in
  darwin*)
    # ...
  ;;
  linux*)
    # Increse the cursort movement speed
    xset r rate 300 50

    # Switch ESC and Caps buttons
    setxkbmap -option caps:swapescape
  ;;
esac
