# Set order
source $ZDOTDIR/init.zsh
configs=(env.zsh plugin.zsh `uname`_zshrc.zsh alias.zsh post.zsh)

for f in $configs; do
  source_if_exists $ZDOTDIR/$f
done