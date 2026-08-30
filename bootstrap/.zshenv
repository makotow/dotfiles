export ZDOTDIR=$HOME/.config/zsh

# rustup writes ~/.cargo/env; absent on hosts without a Rust toolchain.
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
