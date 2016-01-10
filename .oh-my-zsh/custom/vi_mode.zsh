bindkey -v
export KEYTIMEOUT=1

# go through history
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^A' vi-beginning-of-line
bindkey '^E' vi-end-of-line
bindkey '^K' kill-line

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
