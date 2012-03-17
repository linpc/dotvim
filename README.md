How to install:
-----------------------
    cd ~
    git clone http://github.com/linpc/dotvim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule update --init

Upgrading all bundled plugins:
-----------------------
update manually:
    cd ~/.vim
    git pull origin master
    git submodule foreach git pull origin master

or just run the update.sh script:
    ~/.vim/update.sh

Install a new plugin as a git submodule:
-----------------------
    cd ~/.vim
    git submodule add ${git_repository_url} bundle/${plugin_name}

Thanks to:
-----------------------
* drewneil: [Synchronizing plugins with git submodules and pathogen] (http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)
