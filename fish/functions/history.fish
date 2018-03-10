# ~/.config/fish/functions/history.fish

function history
    builtin history --show-time='%Y/%m/%d %H:%M:%S ' | sort
end
