
# INSTALL

## Auto isntall
前提としてgit, ruby 1.9.3, curl がインストールされていること

dotfiles を git clone するディレクトリを作成し、移動後次のコマンドを実行


    curl -o - https://raw.github.com/makotow/dotfiles/master/auto-install.sh | sh
	
## Manual install 
前提としてgit, ruby 1.9.3, がインストールされていること

	git clone git@github.com:makotow/dotfiles.git
	cd dotfiles
	git submodule update --init --recursive
	./setup.sh

