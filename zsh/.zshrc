# Set order
configs=(init.zsh env.zsh plugin.zsh `uname`_zshrc.zsh alias.zsh .p10k.zsh fzf.zsh post.zsh)

for f in $configs; do
    [ -f $ZDOTDIR/$f ] && . $ZDOTDIR/$f
done

# [ -f $ZDOTDIR/init.zsh           ] && . $ZDOTDIR/init.zsh
# [ -f $ZDOTDIR/env.zsh            ] && . $ZDOTDIR/env.zsh
# [ -f $ZDOTDIR/plugin.zsh         ] && . $ZDOTDIR/plugin.zsh
# [ -f $ZDOTDIR/`uname`_zshrc.zsh  ] && . $ZDOTDIR/`uname`_zshrc.zsh
# [ -f $ZDOTDIR/alias.zsh          ] && . $ZDOTDIR/alias.zsh
# [ -f $ZDOTDIR/.p10k.zsh          ] && . $ZDOTDIR/.p10k.zsh # To customize prompt, run `p10k configure` or edit $ZDOTDIR/.p10k.zsh.
# [ -f $ZDOTDIR/fzf.zsh            ] && . $ZDOTDIR/fzf.zsh
# [ -f $ZDOTDIR/post.zsh           ] && . $ZDOTDIR/post.zsh
