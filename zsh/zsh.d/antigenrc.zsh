source $ZSH/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundles <<EOBUNDLES
    git
    heroku
    pip
    lein
    command-not-found

    # Syntax highlighting bundle.
    zsh-users/zsh-syntax-highlighting
EOBUNDLES

# Load the theme.
antigen theme candy

# Tell antigen that you're done.
antigen apply