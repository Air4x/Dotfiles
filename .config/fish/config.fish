starship init fish | source
set -x MANPAGER "nvim -c 'set ft=man' -"
#if command -v tmux >/dev/null 2>&1 && [ "$DISPLAY" ]
    # if not inside a tmux session, and if no session is started, start a new session
#    [ -z "$TMUX" ] && tmux attach || tmux >/dev/null 2>&1
#end

