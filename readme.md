My .dot files. 

Based on [this article](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

How to create now repo like this one:

```sh
git init --bare $HOME/.git-dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Install onto a new system:


```sh
git clone git@bitbucket.org:__Andrey/.dotfiles.git --bare $HOME/.git-dotfiles

alias config='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout --force
```

Vim (latest version) 
---
based on https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
```sh
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git

sudo apt remove vim vim-runtime gvim

cd ~/projects
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-gui=gtk2 \
            --enable-cscope \
            --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim80

sudo apt install checkinstall
sudo checkinstall

sudo update-alternatives --install /usr/bin/vim vim /usr/local/bin/vim 1
```

Tmux (latest version)
---
based on http://bogdanvlviv.com/posts/tmux/how-to-install-the-latest-tmux-on-ubuntu-16_04.html
```sh
cd ~/projects
git clone https://github.com/tmux/tmux.git
sudo apt install -y git automake build-essential pkg-config libevent-dev libncurses5-dev
sh autogen.sh
./configure && make
sudo apt-get remove tmux
sudo checkinstall
sudo update-alternatives --install /usr/bin/tmux tmux /usr/local/bin/tmux 1
```


