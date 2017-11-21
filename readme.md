Based on [this article](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)

Install from scratch:

```sh
git init --bare $HOME/.git-dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Install onto a new system:


```
git clone git@bitbucket.org:__Andrey/.dotfiles.git --bare $HOME/.git-dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.git-dotfiles/ --work-tree=$HOME'
config checkout
```

