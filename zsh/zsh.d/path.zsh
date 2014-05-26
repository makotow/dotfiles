setopt nonomatch

## path
path=(
       $JAVA_HOME/bin(N-/) \
       /usr/local/bin(N-/) \
       $HOME/bin(N-/) \
       $HOME/.cabal/bin(N-/) \
       $HOME/.vim/bundle/powerline/scripts(N-/) \ 
       $path \
)

#echo $path
typeset  -U path
export path

# fpath
fpath=(/usr/local/share/zsh-completions(N-/) \
	/usr/local/share/zsh/site-functions(N-/) \       
	$fpath \
)
