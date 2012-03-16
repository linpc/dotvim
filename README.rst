How to install:
-----------------------

    cd ~
    git clone http://github.com/linpc/dotvim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule update --init

Upgrading a plugin bundle:
-----------------------
    git submodule foreach git pull origin master

Thanks to:
-----------------------
http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
