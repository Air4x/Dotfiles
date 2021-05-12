starship init fish | source
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
#if command -v tmux >/dev/null 2>&1 && [ "$DISPLAY" ]
    # if not inside a tmux session, and if no session is started, start a new session
#    [ -z "$TMUX" ] && tmux attach || tmux >/dev/null 2>&1
#end

