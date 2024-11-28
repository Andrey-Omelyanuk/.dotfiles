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

For laptop need to create a file:
```sh
sudo vim /etc/modprobe.d/inteldsp.conf
```
And put here a line 
```
options snd_intel_dspcfg dsp_driver=1
```
Usefull commands
```sh
    sudo vim /etc/modprobe.d/alsa-base.conf
    sudo vim /etc/modprobe.d/inteldsp.conf
    sudo hdajackretask
    sudo hdajacksensetest
```


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


How to install dependencies:
---
```sh
sudo apt install vim-gtk3 tmux xclip curl make
```
Note: use `vim-gtk3` instead of `vim` because gtk3 version has clipboard enabled by default.


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

