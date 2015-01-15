How to install:
-----------------------

    cd ~
    git clone http://github.com/linpc/dotvim.git ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    cd ~/.vim
    git submodule update --init

Upgrading all bundled plugins:
-----------------------

Just execute the update.sh script:

    ~/.vim/update.sh

or you can do manual update:

    cd ~/.vim
    git pull origin master
    git submodule init
    git submodule update
    git submodule foreach git pull origin master

Install a new plugin as a git submodule:
-----------------------

    cd ~/.vim
    git submodule add ${git-repository-url} bundle/${plugin-name}

Delete a submodule:
-----------------------

1. Remove it from .gitmodules
2. git rm --cached bundle/${plugin-name}
3. rm -rf bundle/${plugin-name}

Plugins to be installed:
-----------------------

* [neocomplcache] (https://github.com/Shougo/neocomplcache): Ultimate auto-completion system for Vim.
* [checksyntax] (https://github.com/tomtom/checksyntax_vim): Check a file's syntax when saving a file (php, ruby, tex ...) with vim.
* [easytags.vim] (https://github.com/xolox/vim-easytags): Automated tag file generation and syntax highlighting of tags in Vim
* [gundo] (https://github.com/sjl/gundo.vim): Graph your Vim undo tree in style.

Thanks to:
-----------------------

* drewneil: [Synchronizing plugins with git submodules and pathogen] (http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)
