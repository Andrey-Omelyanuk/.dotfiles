My .dot files. 
Based on [this article](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

HOW TO INSTALL:
---------------
```sh
git clone git@bitbucket.org:__Andrey/.dotfiles.git --bare $HOME/.git-dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout --force
```

Git
---
Use `config` instead of `git` in home directory.

- `config add reset.sh` - add file to commit
- `config status`       - show current status
- `config commit -m 'text for comment'` - create new commit
- `config push` - update remote repository 

OTHER
-----
How to create now repo like this one:

```sh
git init --bare $HOME/.git-dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Use config instead git (it is alias with special options).
For example:
config add readme.md


Vim (latest version) 
---
based on https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source
```sh
sudo apt install libncurses5-dev libgnome2-dev libgnomeui-dev \
    libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
    libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
    python3-dev ruby-dev lua5.1 liblua5.1-dev libperl-dev git \
    silversearcher-ag

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
mkdir ~/projects
cd ~/projects
git clone https://github.com/tmux/tmux.git
cd tmux
sudo apt install -y git automake build-essential pkg-config libevent-dev libncurses5-dev
sh autogen.sh
./configure && make
sudo apt-get remove tmux
sudo checkinstall
sudo update-alternatives --install /usr/bin/tmux tmux /usr/local/bin/tmux 1
```

Shourtcuts
==========
vim
---
Ctrl + w hjkl -   Windows

NerdTree
Ctrl  + N - open files tree
Shift + i - toggle hidden files.
o         - open folder/file
m         - create/delete folder/file 

ctrl+, s - vim-easymotion 


tmux
----
C-a prefix

C-a + I - установить плагины
C-a + Ctrl-s - Resurrect save
C-a + Ctrl-r - Resurrect restore

session
:new<CR>  new session
s  list sessions
$  name session

tabs
c  create 
w  list 
n  next 
p  previous 
f  find 
,  name 
&  kill

splits
%  vertical split
"  horizontal split
o  swap panes
q  show pane numbers
x  kill pane
+  break pane into window (e.g. to select text by mouse to copy)
-  restore pane from window
space - toggle between layouts
q  (Show pane numbers, when the numbers show up type the key to goto that pane)
{  (Move the current pane left)
}  (Move the current pane right)
z  toggle pane zoom

tmux console
------------
start new                   : tmux
start new with session name : tmux new -s myname
attach                      : tmux a  #  (or at, or attach)
attach to named             : tmux a -t myname
list sessions               : tmux ls
kill session                : tmux kill-session -t myname
Kill all the tmux sessions  : tmux ls | grep : | cut -d. -f1 | awk '{print substr($1, 0, length($1)-1)}' | xargs 

